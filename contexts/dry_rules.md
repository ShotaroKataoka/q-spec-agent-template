# DRY Rules (Don't Repeat Yourself)

## Principle
**Every piece of knowledge must have single, unambiguous, authoritative representation**

Search existing code before implementing. Refactor immediately when duplication found.

## Pre-Implementation Search
```bash
# File names
find . -name "*similar_name*"

# Function/class names
grep -r "function_name\|ClassName" src/

# Functionality patterns
grep -r "validate\|auth\|config" src/

# Review existing modules
ls src/core/ src/utils/ src/services/
```

## Duplication Response
1. **Immediate refactoring** - Don't leave duplicates
2. **Extract to common module** - Single source of truth
3. **Follow existing patterns** - Maintain consistency

## Allowed Duplication
- **Tests** - Readability over DRY
- **Config files** - Environment-specific values
- **Documentation** - Different contexts

## Rule of Three
Extract common code after 3+ repetitions of complex logic.

---
**Created**: 2025-09-23
