# Project Steering Setup

## Initialization Steps
1. **Create directory**: `mkdir -p .kiro/steering`
2. **Q-SPEC Framework interview**: Understand project requirements
3. **Create basic steering**: product.md, tech.md, structure.md
4. **Select and copy presets**: Choose appropriate steering_seeds

## steering_seeds Configuration

### Available seeds
```
steering_seeds/
├── design_philosophy/         # Project design philosophy and architecture patterns
│   └── *.md      # Design philosophy seed file
└── tech_stacks/               # Language-specific development tools, quality standards, best practices
    └── *.md                  # Language-specific development seed file
```

In interviews, design questions to enable judgment of which seeds should be used.
Based on interview results, copy appropriate seeds to `.kiro/steering/`.

## Basic Steering Creation
Use **Q-SPEC Framework**

### product.md Creation
**Purpose**: Define project vision, core features, and roadmap

Create directly from interview results, referencing steering_templates/product.md

### tech.md Creation
**Purpose**: Record technology stack, architecture decisions, and constraints

Describe technical decisions referencing steering_templates/tech.md
Check content of selected steering_seeds in advance to avoid duplication.

### structure.md Creation
**Purpose**: Define project structure, directory configuration, and module division

Describe project structure referencing steering_templates/structure.md, reflecting selected design philosophy

## Completion Checklist
- [ ] `.kiro/steering/product.md` creation completed
- [ ] `.kiro/steering/tech.md` creation completed  
- [ ] `.kiro/steering/structure.md` creation completed
- [ ] Appropriate steering_seeds copying completed
- [ ] Project-specific adjustments completed
