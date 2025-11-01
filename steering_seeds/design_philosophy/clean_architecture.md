# Clean Architecture

## Core Principles

### The Dependency Rule
**Dependencies point inward** toward business rules.

- Outer layers depend on inner layers
- Inner layers have no knowledge of outer layers
- Business rules are independent of technical details

### Independence Goals
The system should be:

- **Independent of Frameworks**: Business rules don't depend on frameworks
- **Independent of UI**: UI changes don't affect business logic
- **Independent of Database**: Data storage can be swapped without changing business rules
- **Independent of External Services**: Business logic doesn't depend on external APIs
- **Testable**: Business rules can be tested in isolation

---

## Architecture Layers

### Domain Layer (Core)
**Contains**: Enterprise-wide business rules

- Entities and value objects
- Domain events
- Business invariants
- Pure business logic with no external dependencies

### Application Layer (Use Cases)
**Contains**: Application-specific business rules

- Use case implementations
- Application workflows
- Orchestration of domain objects
- Interfaces (ports) for external dependencies

### Interface Adapters
**Contains**: Data format conversion

- Controllers (input)
- Presenters (output)
- Repository implementations
- API clients
- Transforms data between use cases and external systems

### Infrastructure Layer
**Contains**: Technical implementation details

- Web frameworks
- Database implementations
- External service integrations
- Configuration and startup logic

---

## Code Organization

### Component-Based Structure (Recommended)

Organize around business capabilities:

```
Policies/
  ├── IPoliciesComponent      # Public interface
  ├── PoliciesComponent       # Implementation (internal)
  ├── RenewPolicyHandler      # Internal
  └── PolicyRepository        # Internal
```

**Key principle**: Only the component interface is public. All implementation details are internal.

**Benefits**:
- Strong encapsulation
- Clear business boundaries
- Prevents unintended dependencies
- Easy to extract into separate services

### Feature-Based Structure (Alternative)

Organize around features:

```
Policies/
  ├── RenewPolicy/
  │   ├── Command
  │   ├── Handler
  │   └── Validator
  └── ViewHistory/
      ├── Query
      └── Handler
```

**Benefits**:
- Features are explicit
- Related code stays together
- Easy navigation

---

## Ports and Adapters

### Input Ports (Use Case Interfaces)
Define what the application can do:

```python
class CreateOrderUseCase(Protocol):
    def execute(self, request: CreateOrderRequest) -> CreateOrderResponse:
        ...
```

### Output Ports (External Dependencies)
Define what the application needs:

```python
class OrderRepository(Protocol):
    def save(self, order: Order) -> None:
        ...
    
    def find_by_id(self, order_id: str) -> Optional[Order]:
        ...
```

### Data Transfer Objects
Cross boundary data:

```python
@dataclass
class CreateOrderRequest:
    customer_id: str
    items: List[OrderItem]
```

**Important**: Use DTOs at boundaries. Never expose domain entities directly.

---

## Implementation Guidelines

### Dependency Direction
```
Infrastructure → Adapters → Application → Domain
```

All dependencies point toward the domain.

### Use Case Structure
```python
class RenewPolicyUseCase:
    def __init__(self, repository: PolicyRepository):
        self._repository = repository
    
    def execute(self, request: RenewPolicyRequest) -> RenewPolicyResponse:
        # 1. Load domain object
        policy = self._repository.find_by_id(request.policy_id)
        
        # 2. Execute business logic
        policy.renew(request.renewal_date)
        
        # 3. Persist changes
        self._repository.save(policy)
        
        # 4. Return result
        return RenewPolicyResponse(policy.id, policy.status)
```

### Validation Strategy
- **Format validation**: Controllers (outer layer)
- **Business validation**: Domain entities and use cases (inner layers)

### Error Handling
- Use cases return domain-meaningful results
- Adapters translate to appropriate formats (HTTP codes, error messages)

### Cross-Cutting Concerns
Handle via decorators or middleware:
- Logging
- Transactions
- Auditing
- Performance monitoring

Keep these separate from business logic.

---

## Directory Structure Example

```
project/
├── domain/
│   ├── entities/
│   ├── value_objects/
│   └── policies/
├── application/
│   ├── use_cases/
│   ├── ports/
│   └── dtos/
├── adapters/
│   ├── controllers/
│   ├── presenters/
│   ├── repositories/
│   └── gateways/
└── infrastructure/
    ├── web/
    ├── persistence/
    └── config/
```

---

## Testing Strategy

### Domain Tests
- Test business rules in isolation
- No mocks needed
- Fast and deterministic

```python
def test_policy_renewal():
    policy = Policy(id="P123", status="active")
    policy.renew(date.today())
    assert policy.is_renewed()
```

### Use Case Tests
- Mock output ports
- Test workflows and business logic
- Verify port interactions

```python
def test_renew_policy_use_case():
    repository = Mock(PolicyRepository)
    use_case = RenewPolicyUseCase(repository)
    
    result = use_case.execute(RenewPolicyRequest("P123"))
    
    assert result.status == "renewed"
    repository.save.assert_called_once()
```

### Adapter Tests
- Test data transformation
- May use test doubles for external systems

### Integration Tests
- Test complete scenarios
- Verify real system integration

---

## Best Practices

### Encapsulation
Use access modifiers to enforce boundaries:
- Public: Component interfaces only
- Internal: Implementation details
- Private: Internal helpers

### Single Responsibility
Each layer has one reason to change:
- Domain: Business rules change
- Application: Use cases change
- Adapters: External format changes
- Infrastructure: Technology changes

### Dependency Inversion
Inner layers define interfaces. Outer layers provide implementations.

```python
# Domain defines what it needs
class PaymentGateway(Protocol):
    def process(self, amount: Money) -> PaymentResult:
        ...

# Infrastructure provides implementation
class StripeGateway(PaymentGateway):
    def process(self, amount: Money) -> PaymentResult:
        # Stripe-specific implementation
        ...
```

### Keep It Simple
Start simple. Add complexity only when needed. Not every project needs full Clean Architecture.

---

## Key Principles

1. **Dependencies point inward** toward business rules
2. **Organize by business capabilities** or features
3. **Use strong encapsulation** via access modifiers
4. **Business rules are independent** of technical details
5. **Test business logic in isolation** without external dependencies
6. **Use interfaces** to define boundaries between layers
