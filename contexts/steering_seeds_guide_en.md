# Steering Seeds Guide

## 📚 What are Steering Seeds?

Steering Seeds are template files that define **standards and best practices** for technology stacks and design philosophies.
By copying them to your project's `.kiro/steering/`, agents will follow these standards during development.

---

## 🌱 Available Seeds

Available seeds are displayed in the **"Available Steering Seeds"** section when the agent starts.

### Types of Seeds:

**`design_philosophy/`** - Design philosophies and architecture patterns
- Examples: `clean_architecture.md`, `simplicity-first.md`

**`tech_stacks/`** - Language and technology stack specific standards
- Examples: `python.md`, `javascript.md`, `go.md`

---

## 📋 Selecting and Applying Seeds

### Selection During Initialization

During project initialization, select seeds based on:

1. **Technology Stack**: Seed corresponding to the language you're using
   - Python project → `python.md`
   - JavaScript project → `javascript.md`

2. **Design Philosophy**: Seed matching your project's design approach
   - Clean Architecture focus → `clean_architecture.md`
   - Simplicity focus → `simplicity-first.md`

### Adding Seeds Mid-Project

You can add new seeds even while the project is in progress:

**When to add:**
- Introducing a new technology stack
- Adding or deepening design philosophy
- Standardizing team practices

---

## 🔧 How to Copy Seeds

### Steps:

1. **Check available seeds**
   - Refer to "Available Steering Seeds" section

2. **Read seed file contents**
   - Use `fs_read` tool (e.g., `steering_seeds/tech_stacks/python.md`)

3. **Copy to project steering directory**
   - `cp steering_seeds/tech_stacks/python.md .kiro/steering/`

4. **Customize seeds as needed**
   - Copied seeds are templates and can be freely modified to fit your project requirements

5. **Automatic loading on next agent start**
   - All `.md` files in `.kiro/steering/` are loaded as context

---

## ⚠️ Important Notes

### Avoid Duplication with tech.md

In `.kiro/steering/tech.md`, write **only project-specific technical decisions**.

- ✅ **tech.md**: Project-specific settings, constraints, tool selection rationale
- ✅ **steering seeds**: General standards and best practices for languages/frameworks

**Example:**
- `python.md` (seed): General Python coding conventions, testing methods
- `tech.md`: Python version used in this project, specific library selection rationale

### Combining Multiple Seeds

You can use multiple seeds simultaneously:
```
.kiro/steering/
├── product.md
├── tech.md
├── structure.md
├── python.md              # Technology stack
└── clean_architecture.md  # Design philosophy
```

---

## 🎯 Best Practices

1. **Start minimal**: Copy only essential seeds during initialization
2. **Add as needed**: Add seeds as the project grows
3. **Customize freely**: Seeds are templates, so edit them to fit your project
4. **Separate concerns**: Seeds for standard rules, tech.md for project-specific decisions
