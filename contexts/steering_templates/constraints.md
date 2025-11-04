<!-- Steering Constraints Template -->

# Constraints

## Technical Boundaries
Clearly define the boundaries of support scope.

**Example**:
```
- **Language Version**: Python 3.10 or higher (type hint features required)
- **Platform**: Linux/macOS/Windows (cross-platform required)
- **Use Case**: CLI tools only (GUI out of scope)
- **Scale**: Small to medium projects (large enterprise out of scope)
```

**Information to elicit through interview**:
- What language and version? Why that version?
- What platforms to support?
- What is the scope of target use cases?
- What scale is assumed?

---

## Prohibited Practices
Clearly define what must not be done.

**Example**:
```
Code quality:
- Use of global state (damages testability)
- Implicit type conversion (only explicit conversion)
- Magic numbers (define as constants)

Architecture:
- Circular dependencies (module dependencies must be unidirectional)
- God classes (consider splitting if over 300 lines per class)
- Tight coupling (maintain loose coupling via interfaces)

Performance:
- Blocking in synchronous processing (don't use async, avoid complexity)
- Excessive optimization (prioritize readability unless bottleneck is clear)
```

**Information to elicit through interview**:
- What must absolutely not be done?
- Are there patterns that have caused problems in the past?
- What items are pointed out in code reviews?

---

## Dependency Policy
Define the policy for external dependencies.

**Example**:
```
Basic policy:
- Prioritize standard library
- Minimize external dependencies (always document reason when adding)
- Use only widely-used libraries (for maintainability)

Criteria for addition:
1. Cannot be achieved with standard library?
2. Is the cost of in-house implementation unacceptable?
3. Is the library actively maintained?
4. Is the license acceptable?

Consider addition only if all are Yes.
```

**Information to elicit through interview**:
- What is the policy on external dependencies?
- What criteria determine when to add dependencies?
- Are there dependencies to avoid?

---

## Compatibility Requirements
Define compatibility requirements.

**Example**:
```
Backward compatibility:
- Breaking changes only in major version updates
- Deprecation warnings one version in advance
- Always provide migration guide

Forward compatibility:
- Configuration files support addition of new fields
- Can read data created by older versions

Platform compatibility:
- Use os.path.join for path separators
- Line endings not platform-dependent
```

**Information to elicit through interview**:
- How far will you maintain backward compatibility?
- How will breaking changes be handled?
- What about cross-platform compatibility?

---

**⚠️ Important: Clarify "Boundaries"**

In this file, clearly record technical constraints and prohibitions.

✅ Good examples:
- "Python 3.10 or higher (type hint features required)" (boundary with reason)
- "Prohibit use of global state (damages testability)" (prohibition with reason)

❌ Bad examples:
- "Use as new a version as possible" (vague)
- "Avoid bad code" (not specific)

---
**Created**: YYYY-MM-DD
