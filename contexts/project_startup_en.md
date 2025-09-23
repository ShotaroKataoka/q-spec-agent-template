# Project Steering Setup

## Initialization Steps
1. **Create directory**: `mkdir -p .kiro/steering`
2. **SPEC-Q Framework interview**: Understand project requirements
3. **Create basic steering**: product.md, tech.md, structure.md
4. **Select and copy presets**: Choose appropriate steering_seeds

## steering_seeds Configuration

### Available seeds
```
steering_seeds/
├── design_philosophy/         # Project design philosophy and architecture patterns
│   └── clean_architecture.md      # Clean architecture design philosophy
└── tech_stacks/               # Language-specific development tools, quality standards, best practices
    └── python.md                  # Python development environment and tool configuration
```

In interviews, design questions to enable judgment of which seeds should be used.
Based on interview results, copy appropriate seeds to `.kiro/steering/`.

## Basic Steering Creation

### product.md Creation
**Purpose**: Define project vision, core features, and roadmap

**SPEC-Q Question Examples**:
- **Scope**: "Is this web application development, or is it closer to [CLI/API/Library]?"
- **Priority**: "Among MVP features [User Authentication/Data Management/Reporting], which is the highest priority?"
- **Example**: "Are the target users primarily [Developers/General Users/Administrators]?"
- **Constraint**: "Is the release target approximately [1 month/3 months/6 months]?"
- **Quality**: "Which success metric do you prioritize: [User count/Processing speed/Maintainability]?"

Create directly from interview results, referencing steering_templates/product.md

### tech.md Creation
**Purpose**: Record technology stack, architecture decisions, and constraints

**SPEC-Q Question Examples**:
- **Scope**: "We're assuming Python/FastAPI configuration, but do you have preferences for other languages or frameworks?"
- **Priority**: "For development speed, we'd use lightweight configuration; for maintainability, robust configuration. Which is appropriate?"
- **Example**: "Which database [SQLite/PostgreSQL/MySQL] is suitable for your environment?"
- **Constraint**: "Are there any existing system integrations or prohibited technologies?"
- **Quality**: "What test coverage level: [Basic/Standard(80%)/Strict(90%+)]?"

Describe technical decisions referencing steering_templates/tech.md
Check content of selected steering_seeds in advance to avoid duplication.

### structure.md Creation
**Purpose**: Define project structure, directory configuration, and module division

**SPEC-Q Question Examples**:
- **Scope**: "We're assuming simple configuration for small projects, but do you plan to expand to [medium/large] scale?"
- **Priority**: "For early development, is [speed-focused flat structure/maintainability-focused hierarchical structure] more appropriate?"
- **Example**: "What's the team development scale: [1-2 people/3-5 people/6+ people]?"
- **Constraint**: "Are there existing project structures or coding standards?"
- **Quality**: "What level of code review: [None/Lightweight/Strict]?"

Describe project structure referencing steering_templates/structure.md, reflecting selected design philosophy

## Completion Checklist
- [ ] `.kiro/steering/product.md` creation completed
- [ ] `.kiro/steering/tech.md` creation completed  
- [ ] `.kiro/steering/structure.md` creation completed
- [ ] Appropriate steering_seeds copying completed
- [ ] Project-specific adjustments completed
