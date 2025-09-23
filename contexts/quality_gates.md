# Quality Gates

## Core Principle
**Tests are sacred - implementation must be fixed to make tests pass**

All SPECs must pass quality gates before completion.

## Mandatory Gates
- [ ] **All tests pass** - No broken existing functionality
- [ ] **Coverage ≥ 80%** - Minimum coverage requirement
- [ ] **New code tested** - Tests for new functionality
- [ ] **No linting violations** - Code style compliance

## Validation Commands
```bash
# Test execution with coverage
[test-command] --coverage --fail-under=80

# Code quality
[linter] [source-directory]
[type-checker] [source-directory]
```

## Test Failure Response
1. **Fix implementation** - Never modify tests to pass
2. **Add missing tests** - For insufficient coverage
3. **Refactor if needed** - For untestable code

## Exceptions (User explicit instruction only)
- Requirements change → Test updates allowed
- Test bugs → Test fixes allowed

---
**Created**: 2025-09-23
