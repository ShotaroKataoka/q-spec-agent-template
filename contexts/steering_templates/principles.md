<!-- Steering Principles Template -->

# Principles

## Core Values
Describe the values the project prioritizes most, in order of priority.

**Example**:
```
1. **Simplicity**: Avoid complexity, prioritize understandable code
2. **User Experience**: Provide developer-friendly APIs
3. **Reliability**: Predictability and stability of behavior
4. **Performance**: Adequate speed (no excessive optimization)
```

**Information to elicit through interview**:
- What is most important for the project?
- If there are multiple values, what is the priority order?
- Why do you prioritize those values?

---

## Decision Framework
Describe the criteria for making decisions when adding new features or making design choices.

**Example**:
```
When adding a new feature:
1. Does it cover 80% of use cases?
2. Does it keep the API simple?
3. Is it consistent with existing features?

Add if all are Yes, skip if even one is No.

When selecting technology:
1. Can it be achieved with the standard library?
2. Is there value in adding an external dependency?
3. Is the maintenance cost acceptable?
```

**Information to elicit through interview**:
- How do you make decisions when uncertain?
- What are the criteria for judgment?
- Have you made wrong decisions in the past?

---

## Trade-off Priorities
Clarify priorities when trade-offs occur.

**Example**:
```
- Simplicity vs Features → Prioritize Simplicity (minimize features)
- Performance vs Readability → Prioritize Readability (optimize only bottlenecks)
- Flexibility vs Convention → Prioritize Convention (convention over configuration)
- Speed of Development vs Perfection → Prioritize Speed (don't seek perfection)
```

**Information to elicit through interview**:
- Simplicity vs feature richness, which do you prioritize?
- Performance vs readability, which do you prioritize?
- Flexibility vs convention, which do you prioritize?
- Development speed vs perfection, which do you prioritize?

---

## Consistency Rules
Describe rules to maintain design consistency.

**Example**:
```
Error handling:
- Errors must propagate via exceptions (no error representation in return values)
- Custom exceptions must inherit from standard exceptions
- Error messages must always be user-friendly

Configuration management:
- Configuration injected via environment variables (no global variables)
- Default values must always be defined
- Configuration priority: environment variables > config file > defaults

Coding conventions:
- All public APIs must have type hints
- Docstrings in Google format
- Tests must follow AAA (Arrange-Act-Assert) pattern
```

**Information to elicit through interview**:
- How will you standardize error handling?
- What is the configuration injection method?
- What is the logging policy?
- What coding conventions do you particularly emphasize?

---

**⚠️ Important: Clarify "Decision Criteria"**

In this file, record specific decision criteria that agents can reference when uncertain.

✅ Good examples:
- "Simplicity vs Features → Prioritize Simplicity" (clear priority)
- "Don't add features that don't cover 80% of use cases" (specific criteria)

❌ Bad examples:
- "Consider balance" (vague, cannot make decisions)
- "Judge according to situation" (no criteria)

---
**Created**: YYYY-MM-DD
