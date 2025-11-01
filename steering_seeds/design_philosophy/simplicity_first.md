# Simplicity-First Design

## Core Philosophy

Start simple. Add complexity only when needed. Optimize for clarity and speed of development.

This approach is ideal for small projects, MVPs, prototypes, and when you need to deliver quickly.

---

## Guiding Principles

### YAGNI (You Aren't Gonna Need It)
**Don't build features until you actually need them**

```python
# ✅ Good: Implement what's needed now
class User:
    def __init__(self, name: str, email: str):
        self.name = name
        self.email = email

# ❌ Bad: Over-engineering for future needs
class User:
    def __init__(self, name: str, email: str):
        self.name = name
        self.email = email
        self.preferences = {}  # Not needed yet
        self.metadata = {}     # Not needed yet
        self.cache = {}        # Not needed yet
```

### KISS (Keep It Simple, Stupid)
**Choose the simplest solution that works**

```python
# ✅ Good: Simple and clear
def calculate_total(items: List[Item]) -> float:
    return sum(item.price * item.quantity for item in items)

# ❌ Bad: Unnecessary complexity
class TotalCalculator:
    def __init__(self, strategy: CalculationStrategy):
        self._strategy = strategy
    
    def calculate(self, items: List[Item]) -> float:
        return self._strategy.execute(items)
```

### DRY (Don't Repeat Yourself)
**Avoid duplication, but don't over-abstract**

```python
# ✅ Good: Extract when there's real duplication
def validate_email(email: str) -> bool:
    return "@" in email and "." in email.split("@")[1]

def create_user(name: str, email: str) -> User:
    if not validate_email(email):
        raise ValueError("Invalid email")
    return User(name, email)

def update_email(user: User, new_email: str) -> None:
    if not validate_email(new_email):
        raise ValueError("Invalid email")
    user.email = new_email

# ❌ Bad: Premature abstraction
class EmailValidator:
    def __init__(self, rules: List[ValidationRule]):
        self._rules = rules
    
    def validate(self, email: str) -> ValidationResult:
        # Too complex for simple validation
        ...
```

---

## Simple Architecture Patterns

### Flat Structure
**Keep directory structure simple**

```
project/
├── main.py           # Entry point
├── models.py         # Data models
├── services.py       # Business logic
├── database.py       # Database access
├── api.py            # API endpoints
└── tests/
    ├── test_models.py
    └── test_services.py
```

**When to use:**
- Small projects (< 1000 lines)
- Single developer
- Short-term projects

### Simple Layering
**Basic separation of concerns**

```
project/
├── app/
│   ├── models/       # Data models
│   ├── services/     # Business logic
│   ├── api/          # API layer
│   └── db/           # Database
├── tests/
└── main.py
```

**When to use:**
- Medium projects (1000-5000 lines)
- 2-3 developers
- Need some organization

---

## Implementation Guidelines

### Start with Functions
**Use functions before classes**

```python
# ✅ Good: Start simple with functions
def create_order(user_id: str, items: List[dict]) -> dict:
    total = sum(item['price'] * item['quantity'] for item in items)
    return {
        'order_id': generate_id(),
        'user_id': user_id,
        'items': items,
        'total': total,
        'status': 'pending'
    }

# Only create classes when you need state or behavior
class Order:
    def __init__(self, order_id: str, user_id: str, items: List[dict]):
        self.order_id = order_id
        self.user_id = user_id
        self.items = items
        self.status = 'pending'
    
    def calculate_total(self) -> float:
        return sum(item['price'] * item['quantity'] for item in self.items)
```

### Use Simple Data Structures
**Dictionaries and dataclasses are often enough**

```python
from dataclasses import dataclass

# ✅ Good: Simple dataclass
@dataclass
class User:
    id: str
    name: str
    email: str

# ✅ Good: Plain dictionary for simple data
user = {
    'id': '123',
    'name': 'John',
    'email': 'john@example.com'
}

# ❌ Bad: Over-engineered for simple data
class User:
    def __init__(self, id: str, name: str, email: str):
        self._id = id
        self._name = name
        self._email = email
    
    @property
    def id(self) -> str:
        return self._id
    
    # Unnecessary getters/setters for simple data
```

### Direct Database Access
**No repository pattern until you need it**

```python
# ✅ Good: Direct database access
def get_user(user_id: str) -> dict:
    return db.query("SELECT * FROM users WHERE id = ?", (user_id,))

def create_user(name: str, email: str) -> str:
    user_id = generate_id()
    db.execute(
        "INSERT INTO users (id, name, email) VALUES (?, ?, ?)",
        (user_id, name, email)
    )
    return user_id

# Add repository only when you need to:
# - Switch databases
# - Mock for testing
# - Share logic across multiple places
```

### Inline Validation
**Validate where you use the data**

```python
# ✅ Good: Simple inline validation
def create_user(name: str, email: str) -> User:
    if not name:
        raise ValueError("Name is required")
    if "@" not in email:
        raise ValueError("Invalid email")
    
    return User(id=generate_id(), name=name, email=email)

# Add separate validators only when:
# - Validation logic is complex
# - Same validation used in multiple places
# - Validation rules change frequently
```

---

## When to Add Complexity

### Refactor When You Feel Pain

**Signs you need more structure:**
- Files are getting too large (> 500 lines)
- Hard to find where logic lives
- Lots of duplication
- Tests are difficult to write
- Multiple developers stepping on each other

**Refactoring steps:**
1. Extract functions from large functions
2. Group related functions into modules
3. Create classes when you need state
4. Add layers when boundaries become clear
5. Introduce patterns when you see repeated problems

### Gradual Evolution

```python
# Step 1: Start simple
def process_order(order_data: dict) -> dict:
    # All logic in one place
    ...

# Step 2: Extract functions
def validate_order(order_data: dict) -> None:
    ...

def calculate_total(items: List[dict]) -> float:
    ...

def process_order(order_data: dict) -> dict:
    validate_order(order_data)
    total = calculate_total(order_data['items'])
    ...

# Step 3: Create class when state is needed
class OrderProcessor:
    def __init__(self, pricing_rules: dict):
        self._pricing_rules = pricing_rules
    
    def process(self, order_data: dict) -> dict:
        ...

# Step 4: Add layers when boundaries are clear
# - Separate API from business logic
# - Extract database access
# - Add domain models
```

---

## Testing Strategy

### Test What Matters
**Focus on business logic, not implementation details**

```python
# ✅ Good: Test behavior
def test_create_order():
    order = create_order(
        user_id="U1",
        items=[{"price": 10, "quantity": 2}]
    )
    
    assert order['total'] == 20
    assert order['status'] == 'pending'

# ❌ Bad: Testing implementation
def test_order_class_initialization():
    order = Order("O1", "U1", [])
    assert order._order_id == "O1"  # Testing internal state
```

### Keep Tests Simple
**Tests should be easy to read and maintain**

```python
# ✅ Good: Clear and simple
def test_user_creation():
    user = create_user("John", "john@example.com")
    assert user.name == "John"
    assert user.email == "john@example.com"

# ❌ Bad: Over-engineered test setup
class TestUserCreation:
    @pytest.fixture
    def user_factory(self):
        return UserFactory()
    
    @pytest.fixture
    def email_validator(self):
        return EmailValidator()
    
    def test_create_user(self, user_factory, email_validator):
        # Too much setup for simple test
        ...
```

---

## Common Patterns

### Configuration
**Simple config file or environment variables**

```python
# config.py
DATABASE_URL = os.getenv("DATABASE_URL", "sqlite:///app.db")
SECRET_KEY = os.getenv("SECRET_KEY", "dev-secret")
DEBUG = os.getenv("DEBUG", "false").lower() == "true"

# Use directly
from config import DATABASE_URL
db = connect(DATABASE_URL)
```

### Error Handling
**Use exceptions for errors**

```python
# ✅ Good: Simple exception handling
def get_user(user_id: str) -> User:
    user = db.query("SELECT * FROM users WHERE id = ?", (user_id,))
    if not user:
        raise ValueError(f"User {user_id} not found")
    return User(**user)

# Use in API
try:
    user = get_user(user_id)
    return {"user": user}
except ValueError as e:
    return {"error": str(e)}, 404
```

### Logging
**Use standard logging module**

```python
import logging

logger = logging.getLogger(__name__)

def process_order(order_data: dict) -> dict:
    logger.info(f"Processing order: {order_data['id']}")
    try:
        result = _do_process(order_data)
        logger.info(f"Order processed: {result['id']}")
        return result
    except Exception as e:
        logger.error(f"Failed to process order: {e}")
        raise
```

---

## Benefits

### Speed
- Faster development
- Less code to write and maintain
- Quick iterations

### Clarity
- Easy to understand
- New developers onboard quickly
- Less cognitive overhead

### Flexibility
- Easy to change
- Refactor when needed
- No premature optimization

---

## When to Use

### Perfect For:
- MVPs and prototypes
- Small tools and scripts
- Personal projects
- Proof of concepts
- Time-constrained projects
- 1-3 person teams

### Consider Alternatives When:
- Project will grow large (> 10k lines)
- Multiple teams involved
- Complex business logic
- Long-term maintenance expected
- High reliability requirements

---

## Key Principles

1. **Start simple** - Add complexity only when needed
2. **YAGNI** - Don't build what you don't need
3. **KISS** - Choose the simplest solution
4. **Refactor when you feel pain** - Not before
5. **Test behavior, not implementation** - Focus on what matters
6. **Flat is better than nested** - Keep structure simple

---
**Last Updated**: 2025-11-02
