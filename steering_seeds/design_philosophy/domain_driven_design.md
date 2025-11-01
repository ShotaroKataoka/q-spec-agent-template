# Domain-Driven Design (DDD)

## Core Philosophy

Domain-Driven Design focuses on understanding and modeling the business domain. The software structure reflects the business reality, using the language of domain experts.

DDD is divided into **Strategic Design** (high-level structure) and **Tactical Design** (implementation patterns).

---

## Strategic Design

### Ubiquitous Language
**A shared language between developers and domain experts**

- Use domain terms in code, conversations, and documentation
- Avoid technical jargon when discussing business concepts
- Evolve the language as understanding deepens

```python
# ✅ Good: Uses domain language
class Order:
    def place(self) -> None:
        self.status = OrderStatus.PLACED
    
    def fulfill(self) -> None:
        if self.status != OrderStatus.PLACED:
            raise InvalidOrderStateError()
        self.status = OrderStatus.FULFILLED

# ❌ Bad: Technical language
class Order:
    def set_status_1(self) -> None:
        self.flag = 1
    
    def set_status_2(self) -> None:
        self.flag = 2
```

### Bounded Context
**A boundary within which a domain model is valid**

Each bounded context has its own model and ubiquitous language. The same term can mean different things in different contexts.

**Example**: "Customer" in different contexts
- **Sales Context**: Customer = potential buyer, has contact info, purchase history
- **Support Context**: Customer = user needing help, has support tickets, issue history
- **Shipping Context**: Customer = delivery recipient, has address, delivery preferences

```
┌─────────────────┐    ┌─────────────────┐    ┌─────────────────┐
│  Sales Context  │    │Support Context  │    │Shipping Context │
│                 │    │                 │    │                 │
│  Customer       │    │  Customer       │    │  Customer       │
│  - name         │    │  - user_id      │    │  - recipient    │
│  - email        │    │  - tickets      │    │  - address      │
│  - orders       │    │  - priority     │    │  - phone        │
└─────────────────┘    └─────────────────┘    └─────────────────┘
```

### Context Mapping
**Define relationships between bounded contexts**

**Patterns:**
- **Shared Kernel**: Two contexts share a subset of the model
- **Customer-Supplier**: Downstream depends on upstream
- **Conformist**: Downstream conforms to upstream model
- **Anti-Corruption Layer**: Translate between contexts to protect your model
- **Published Language**: Well-documented shared format (e.g., API contract)

```python
# Anti-Corruption Layer example
class LegacySystemAdapter:
    """Translates legacy system data to our domain model"""
    
    def get_customer(self, legacy_id: str) -> Customer:
        legacy_data = self._legacy_api.fetch_customer(legacy_id)
        
        # Translate legacy format to our domain model
        return Customer(
            customer_id=self._map_id(legacy_data['cust_no']),
            name=f"{legacy_data['fname']} {legacy_data['lname']}",
            email=legacy_data['email_addr']
        )
```

---

## Tactical Design

### Entities
**Objects with unique identity that persists over time**

```python
class Customer:
    def __init__(self, customer_id: CustomerId, email: Email):
        self._customer_id = customer_id  # Identity
        self._email = email
        self._name = None
    
    @property
    def customer_id(self) -> CustomerId:
        return self._customer_id
    
    def change_email(self, new_email: Email) -> None:
        self._email = new_email
    
    def __eq__(self, other) -> bool:
        if not isinstance(other, Customer):
            return False
        return self._customer_id == other._customer_id  # Identity-based equality
```

### Value Objects
**Immutable objects defined by their attributes**

```python
@dataclass(frozen=True)
class Money:
    amount: Decimal
    currency: str
    
    def add(self, other: 'Money') -> 'Money':
        if self.currency != other.currency:
            raise ValueError("Cannot add different currencies")
        return Money(self.amount + other.amount, self.currency)
    
    def multiply(self, factor: Decimal) -> 'Money':
        return Money(self.amount * factor, self.currency)

@dataclass(frozen=True)
class Address:
    street: str
    city: str
    postal_code: str
    country: str
    
    def __str__(self) -> str:
        return f"{self.street}, {self.city} {self.postal_code}, {self.country}"
```

### Aggregates
**A cluster of entities and value objects with a consistency boundary**

- One entity is the **Aggregate Root**
- External objects can only reference the root
- Enforce invariants within the aggregate
- Transactional boundary

```python
class Order:  # Aggregate Root
    def __init__(self, order_id: OrderId, customer_id: CustomerId):
        self._order_id = order_id
        self._customer_id = customer_id
        self._items: List[OrderItem] = []  # Internal entities
        self._status = OrderStatus.DRAFT
    
    def add_item(self, product_id: ProductId, quantity: int, price: Money) -> None:
        # Enforce invariant: no duplicate products
        if any(item.product_id == product_id for item in self._items):
            raise ValueError("Product already in order")
        
        self._items.append(OrderItem(product_id, quantity, price))
    
    def place(self) -> None:
        # Enforce invariant: order must have items
        if not self._items:
            raise ValueError("Cannot place empty order")
        
        self._status = OrderStatus.PLACED
    
    def calculate_total(self) -> Money:
        return sum((item.price.multiply(item.quantity) for item in self._items),
                   Money(Decimal(0), "USD"))

# OrderItem is not exposed outside the Order aggregate
class OrderItem:
    def __init__(self, product_id: ProductId, quantity: int, price: Money):
        self.product_id = product_id
        self.quantity = quantity
        self.price = price
```

### Domain Services
**Operations that don't naturally belong to an entity or value object**

```python
class PricingService:
    """Domain service for complex pricing logic"""
    
    def __init__(self, discount_policy: DiscountPolicy):
        self._discount_policy = discount_policy
    
    def calculate_order_price(self, order: Order, customer: Customer) -> Money:
        base_price = order.calculate_total()
        discount = self._discount_policy.calculate_discount(customer, base_price)
        return base_price.subtract(discount)
```

### Domain Events
**Something meaningful that happened in the domain**

```python
@dataclass(frozen=True)
class OrderPlaced:
    order_id: OrderId
    customer_id: CustomerId
    total: Money
    occurred_at: datetime

class Order:
    def __init__(self, order_id: OrderId, customer_id: CustomerId):
        self._order_id = order_id
        self._customer_id = customer_id
        self._events: List[DomainEvent] = []
    
    def place(self) -> None:
        if not self._items:
            raise ValueError("Cannot place empty order")
        
        self._status = OrderStatus.PLACED
        
        # Record domain event
        self._events.append(OrderPlaced(
            order_id=self._order_id,
            customer_id=self._customer_id,
            total=self.calculate_total(),
            occurred_at=datetime.now()
        ))
    
    def collect_events(self) -> List[DomainEvent]:
        events = self._events.copy()
        self._events.clear()
        return events
```

### Repositories
**Abstraction for accessing aggregates**

```python
class OrderRepository(Protocol):
    """Repository interface (port)"""
    
    def save(self, order: Order) -> None:
        ...
    
    def find_by_id(self, order_id: OrderId) -> Optional[Order]:
        ...
    
    def find_by_customer(self, customer_id: CustomerId) -> List[Order]:
        ...

# Implementation is in infrastructure layer
class PostgresOrderRepository(OrderRepository):
    def save(self, order: Order) -> None:
        # Persist aggregate
        self._save_order_data(order)
        
        # Publish domain events
        for event in order.collect_events():
            self._event_bus.publish(event)
```

### Factories
**Create complex aggregates**

```python
class OrderFactory:
    def create_order(self, customer_id: CustomerId, items: List[OrderItemData]) -> Order:
        order = Order(
            order_id=OrderId.generate(),
            customer_id=customer_id
        )
        
        for item_data in items:
            order.add_item(
                product_id=item_data.product_id,
                quantity=item_data.quantity,
                price=item_data.price
            )
        
        return order
```

---

## Directory Structure

```
project/
├── domain/
│   ├── model/
│   │   ├── customer/
│   │   │   ├── customer.py          # Entity
│   │   │   ├── customer_id.py       # Value Object
│   │   │   └── email.py             # Value Object
│   │   └── order/
│   │       ├── order.py             # Aggregate Root
│   │       ├── order_item.py        # Entity
│   │       ├── order_id.py          # Value Object
│   │       └── money.py             # Value Object
│   ├── services/
│   │   └── pricing_service.py       # Domain Service
│   ├── events/
│   │   └── order_events.py          # Domain Events
│   └── repositories/
│       └── order_repository.py      # Repository Interface
├── application/
│   └── use_cases/
│       └── place_order.py           # Application Service
└── infrastructure/
    ├── persistence/
    │   └── postgres_order_repository.py
    └── messaging/
        └── event_publisher.py
```

---

## Implementation Guidelines

### Aggregate Design Rules

1. **Keep aggregates small**: Only include what needs to be consistent
2. **Reference by ID**: Aggregates reference other aggregates by ID, not object reference
3. **One transaction per aggregate**: Don't modify multiple aggregates in one transaction
4. **Use eventual consistency**: Between aggregates, use domain events

```python
# ✅ Good: Reference by ID
class Order:
    def __init__(self, order_id: OrderId, customer_id: CustomerId):
        self._customer_id = customer_id  # ID reference

# ❌ Bad: Direct object reference
class Order:
    def __init__(self, order_id: OrderId, customer: Customer):
        self._customer = customer  # Don't do this
```

### Enforce Invariants

Business rules must always be valid:

```python
class Order:
    def add_item(self, product_id: ProductId, quantity: int, price: Money) -> None:
        # Invariant: quantity must be positive
        if quantity <= 0:
            raise ValueError("Quantity must be positive")
        
        # Invariant: no duplicate products
        if any(item.product_id == product_id for item in self._items):
            raise ValueError("Product already in order")
        
        self._items.append(OrderItem(product_id, quantity, price))
```

### Use Domain Events for Decoupling

```python
# Order aggregate publishes event
class Order:
    def place(self) -> None:
        self._status = OrderStatus.PLACED
        self._events.append(OrderPlaced(...))

# Other contexts react to event
class InventoryService:
    def handle_order_placed(self, event: OrderPlaced) -> None:
        # Reserve inventory
        ...

class NotificationService:
    def handle_order_placed(self, event: OrderPlaced) -> None:
        # Send confirmation email
        ...
```

---

## Testing Strategy

### Domain Tests
Test business logic in isolation:

```python
def test_order_placement():
    order = Order(OrderId("123"), CustomerId("C1"))
    order.add_item(ProductId("P1"), 2, Money(Decimal("10.00"), "USD"))
    
    order.place()
    
    assert order.status == OrderStatus.PLACED
    assert order.calculate_total() == Money(Decimal("20.00"), "USD")

def test_cannot_place_empty_order():
    order = Order(OrderId("123"), CustomerId("C1"))
    
    with pytest.raises(ValueError, match="Cannot place empty order"):
        order.place()
```

### Integration Tests
Test with real repositories:

```python
def test_order_persistence(db):
    repo = PostgresOrderRepository(db)
    order = create_test_order()
    
    repo.save(order)
    retrieved = repo.find_by_id(order.order_id)
    
    assert retrieved.order_id == order.order_id
    assert retrieved.calculate_total() == order.calculate_total()
```

---

## Benefits

### Business Alignment
- Code reflects business reality
- Shared language reduces miscommunication
- Domain experts can understand code structure

### Maintainability
- Business logic isolated in domain layer
- Clear boundaries between contexts
- Changes localized to specific aggregates

### Flexibility
- Bounded contexts can evolve independently
- Easy to add new features within context
- Domain events enable loose coupling

---

## When to Use

### Good Fit:
- Complex business logic
- Long-term projects
- Domain expertise available
- Multiple teams or contexts
- Business rules change frequently

### Consider Alternatives:
- Simple CRUD applications
- Technical/infrastructure-focused systems
- Short-term projects
- When business logic is minimal

---

## Key Principles

1. **Focus on the domain** - Understand business before coding
2. **Use ubiquitous language** - Same terms in code and conversations
3. **Define bounded contexts** - Clear boundaries for models
4. **Model aggregates carefully** - Enforce invariants and consistency
5. **Use domain events** - Decouple contexts and enable eventual consistency
6. **Collaborate with experts** - Continuous learning about the domain

---
**Last Updated**: 2025-11-02
