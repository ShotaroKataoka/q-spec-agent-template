# Python Development Standards

## Python Version
- Use **Python 3.12+** for new projects
- Avoid Python 2 (no longer supported)
- Don't use OS-bundled Python installations

## Package Management

### Modern Tools (Choose One)
- **uv** - Fast, Rust-based (recommended for new projects)
- **Poetry** - Most popular, well-established
- **PDM** - Modern, follows latest standards
- **Hatch** - Integrated build and test features

### Project Configuration
Use `pyproject.toml` for all project metadata and dependencies:
```toml
[project]
name = "your-project"
version = "0.1.0"
requires-python = ">=3.12"
dependencies = [
    "httpx",
    "pydantic>=2.0"
]

[tool.pytest.ini_options]
addopts = "-v"
```

## Code Quality

### Formatting & Linting
Use **Ruff** for both formatting and linting (replaces Black + flake8):
```bash
# Format code
ruff format .

# Lint code
ruff check .

# Fix auto-fixable issues
ruff check --fix .
```

### Type Checking
Use type hints with **mypy** or **pyright**:
```python
def greet(name: str) -> str:
    return f"Hello, {name}"
```

Check types:
```bash
mypy src/
# or
pyright src/
```

## Testing

### Framework
Use **pytest** as the standard testing framework:
```bash
pytest tests/ -v
```

### Test Structure
```
project/
├── src/
│   └── mypackage/
└── tests/
    ├── unit/
    └── integration/
```

### Coverage
```bash
pytest --cov=src tests/
```

## Project Structure

### Recommended Layout (src/ layout)
```
project/
├── pyproject.toml
├── README.md
├── src/
│   └── mypackage/
│       ├── __init__.py
│       └── core.py
└── tests/
    └── test_core.py
```

### Benefits of src/ Layout
- Prevents accidental imports from development directory
- Ensures tests run against installed package
- Industry standard for Python packages

## Coding Standards

### PEP 8 Naming Conventions
- **Functions/variables**: `snake_case`
- **Classes**: `PascalCase`
- **Constants**: `UPPER_SNAKE_CASE`
- **Private**: `_leading_underscore`

### Import Organization
```python
# Standard library
import os
import sys

# Third-party
import httpx
import pydantic

# Local
from .core import MyClass
```

### Docstrings
Use docstrings for public APIs:
```python
def calculate(x: int, y: int) -> int:
    """Calculate the sum of two numbers.
    
    Args:
        x: First number
        y: Second number
        
    Returns:
        Sum of x and y
    """
    return x + y
```

## Async Programming

### Modern Async Patterns
Use **asyncio.TaskGroup** for structured concurrency:
```python
import asyncio

async def main():
    async with asyncio.TaskGroup() as tg:
        task1 = tg.create_task(fetch_data())
        task2 = tg.create_task(process_data())
    # Both tasks complete here
```

### HTTP Clients
Use **httpx** for async HTTP:
```python
import httpx

async def fetch(url: str) -> dict:
    async with httpx.AsyncClient() as client:
        response = await client.get(url)
        response.raise_for_status()
        return response.json()
```

## Best Practices

### General Principles
- **Explicit is better than implicit** (Zen of Python)
- Keep functions small and focused
- Use context managers for resource management
- Avoid global state
- Write self-documenting code with clear names

### Error Handling
```python
# Good: Specific exceptions
try:
    result = risky_operation()
except ValueError as e:
    logger.error(f"Invalid value: {e}")
    raise

# Avoid: Bare except
try:
    result = risky_operation()
except:  # Don't do this
    pass
```

### Resource Management
Always use context managers:
```python
# Good
with open("file.txt") as f:
    data = f.read()

# Good (async)
async with httpx.AsyncClient() as client:
    response = await client.get(url)
```

## Development Workflow

### Pre-commit Hooks
Use **pre-commit** to run checks automatically:
```yaml
# .pre-commit-config.yaml
repos:
  - repo: https://github.com/astral-sh/ruff-pre-commit
    rev: v0.1.0
    hooks:
      - id: ruff
      - id: ruff-format
```

### CI/CD Checks
Run these in your CI pipeline:
1. Ruff format check
2. Ruff lint check
3. Type checking (mypy/pyright)
4. Tests with coverage
5. Security scan (optional)

---
**Last Updated**: 2025-11-02
