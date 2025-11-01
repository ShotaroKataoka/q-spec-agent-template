# Hexagonal Architecture (Ports and Adapters)

## Core Concept

Hexagonal Architecture separates core business logic from external dependencies by using **ports** (interfaces) and **adapters** (implementations).

The core communicates with the outside world only through well-defined boundaries, making it independent of frameworks, databases, and UI.

---

## Key Components

### 1. Core (Domain Logic)
**Contains**: Business rules and domain entities

- Pure business logic
- No dependencies on external systems
- Framework-agnostic
- Highly testable

```python
# Core domain entity
class Order:
    def __init__(self, order_id: str, items: List[OrderItem]):
        self.order_id = order_id
        self.items = items
        self.status = "pending"
    
    def calculate_total(self) -> Money:
        return sum(item.price * item.quantity for item in self.items)
    
    def confirm(self) -> None:
        if not self.items:
            raise ValueError("Cannot confirm empty order")
        self.status = "confirmed"
```

### 2. Ports (Interfaces)
**Define**: How core interacts with the outside world

**Inbound Ports** (Driving): External systems call the core
```python
class OrderService(Protocol):
    def create_order(self, request: CreateOrderRequest) -> Order:
        ...
    
    def get_order(self, order_id: str) -> Optional[Order]:
        ...
```

**Outbound Ports** (Driven): Core calls external systems
```python
class OrderRepository(Protocol):
    def save(self, order: Order) -> None:
        ...
    
    def find_by_id(self, order_id: str) -> Optional[Order]:
        ...

class PaymentGateway(Protocol):
    def process_payment(self, amount: Money) -> PaymentResult:
        ...
```

### 3. Adapters (Implementations)
**Implement**: Ports for specific technologies

**Inbound Adapters**: Receive requests from outside
```python
# HTTP adapter
class OrderController:
    def __init__(self, order_service: OrderService):
        self._service = order_service
    
    def post_order(self, request: HttpRequest) -> HttpResponse:
        order_data = request.json()
        order = self._service.create_order(
            CreateOrderRequest(**order_data)
        )
        return HttpResponse(status=201, body={"order_id": order.order_id})
```

**Outbound Adapters**: Implement external dependencies
```python
# Database adapter
class PostgresOrderRepository(OrderRepository):
    def __init__(self, db_connection):
        self._db = db_connection
    
    def save(self, order: Order) -> None:
        self._db.execute(
            "INSERT INTO orders (id, status, total) VALUES (?, ?, ?)",
            (order.order_id, order.status, order.calculate_total())
        )
    
    def find_by_id(self, order_id: str) -> Optional[Order]:
        row = self._db.query("SELECT * FROM orders WHERE id = ?", (order_id,))
        return self._map_to_order(row) if row else None
```

---

## Architecture Layers

```
┌─────────────────────────────────────────┐
│         Inbound Adapters                │
│  (HTTP, CLI, Message Queue)             │
└──────────────┬──────────────────────────┘
               │
               ▼
┌─────────────────────────────────────────┐
│         Inbound Ports                   │
│  (Service Interfaces)                   │
└──────────────┬──────────────────────────┘
               │
               ▼
┌─────────────────────────────────────────┐
│         Core Domain                     │
│  (Business Logic, Entities)             │
└──────────────┬──────────────────────────┘
               │
               ▼
┌─────────────────────────────────────────┐
│         Outbound Ports                  │
│  (Repository, Gateway Interfaces)       │
└──────────────┬──────────────────────────┘
               │
               ▼
┌─────────────────────────────────────────┐
│         Outbound Adapters               │
│  (Database, External APIs, File System) │
└─────────────────────────────────────────┘
```

---

## Directory Structure

```
project/
├── core/
│   ├── domain/
│   │   ├── entities/
│   │   │   └── order.py
│   │   └── value_objects/
│   │       └── money.py
│   └── ports/
│       ├── inbound/
│       │   └── order_service.py
│       └── outbound/
│           ├── order_repository.py
│           └── payment_gateway.py
├── adapters/
│   ├── inbound/
│   │   ├── http/
│   │   │   └── order_controller.py
│   │   └── cli/
│   │       └── order_cli.py
│   └── outbound/
│       ├── persistence/
│       │   └── postgres_order_repository.py
│       └── payment/
│           └── stripe_payment_gateway.py
└── main.py  # Dependency injection and wiring
```

---

## Implementation Guidelines

### Dependency Injection
Wire dependencies at application startup:

```python
# main.py
def create_app():
    # Outbound adapters
    db = create_database_connection()
    order_repo = PostgresOrderRepository(db)
    payment_gateway = StripePaymentGateway(api_key=config.stripe_key)
    
    # Core service
    order_service = OrderServiceImpl(
        repository=order_repo,
        payment_gateway=payment_gateway
    )
    
    # Inbound adapters
    order_controller = OrderController(order_service)
    
    return create_web_app(order_controller)
```

### Keep Core Pure
The core should have no knowledge of:
- HTTP requests/responses
- Database queries
- File system operations
- External API formats

```python
# ✅ Good: Core uses domain concepts
class OrderServiceImpl(OrderService):
    def create_order(self, request: CreateOrderRequest) -> Order:
        order = Order(
            order_id=generate_id(),
            items=request.items
        )
        order.confirm()
        self._repository.save(order)
        return order

# ❌ Bad: Core knows about HTTP
class OrderServiceImpl(OrderService):
    def create_order(self, http_request: HttpRequest) -> HttpResponse:
        # Don't do this!
        ...
```

### Testing Strategy

**Core Tests**: No mocks needed
```python
def test_order_confirmation():
    order = Order("123", [OrderItem("item1", Money(10))])
    order.confirm()
    assert order.status == "confirmed"
```

**Service Tests**: Mock ports
```python
def test_create_order_service():
    mock_repo = Mock(OrderRepository)
    service = OrderServiceImpl(repository=mock_repo)
    
    order = service.create_order(CreateOrderRequest(...))
    
    mock_repo.save.assert_called_once()
```

**Adapter Tests**: Test integration
```python
def test_postgres_repository(test_db):
    repo = PostgresOrderRepository(test_db)
    order = Order("123", [...])
    
    repo.save(order)
    retrieved = repo.find_by_id("123")
    
    assert retrieved.order_id == "123"
```

---

## Benefits

### Testability
- Core logic tested without external dependencies
- Easy to mock ports for service tests
- Fast unit tests

### Flexibility
- Swap implementations without changing core
- Support multiple adapters (HTTP + CLI + gRPC)
- Easy to add new external systems

### Maintainability
- Clear separation of concerns
- Business logic isolated from technical details
- Changes to external systems don't affect core

### Independent Development
- Teams can work on adapters independently
- Core can be developed without infrastructure
- Parallel development of different adapters

---

## When to Use

### Good Fit:
- Business logic is complex and valuable
- Multiple interfaces needed (web, CLI, API)
- External dependencies likely to change
- High testability requirements
- Long-term maintainability important

### Consider Alternatives:
- Simple CRUD applications
- Prototypes or MVPs
- Very small projects
- When simplicity is more important than flexibility

---

## Comparison with Clean Architecture

**Similarities:**
- Both separate core from infrastructure
- Both use dependency inversion
- Both emphasize testability

**Differences:**
- Hexagonal: Simpler, focuses on ports/adapters
- Clean: More layers (entities, use cases, adapters, frameworks)
- Hexagonal: Easier to understand and implement
- Clean: More granular separation of concerns

**Recommendation**: Start with Hexagonal Architecture. Add Clean Architecture layers if complexity demands it.

---

## Key Principles

1. **Core is independent** - No dependencies on external systems
2. **Ports define contracts** - Clear interfaces for all interactions
3. **Adapters are replaceable** - Swap implementations without changing core
4. **Dependency points inward** - External depends on core, not vice versa
5. **Test core in isolation** - Business logic tested without infrastructure

---
**Last Updated**: 2025-11-02
