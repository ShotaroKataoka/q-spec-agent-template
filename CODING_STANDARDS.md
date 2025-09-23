
## Complete Development Workflow

### Analyze User Instruction
- **Understand scope**: What needs to be built/changed/fixed?
- **Assess complexity**: Simple change vs architectural modification?
- **Identify dependencies**: What existing code will be affected?
- **Agent advantage**: Can analyze entire codebase context simultaneously


### SPEC-Driven Development Path

#### SPEC File Structure & Roles:
```
.kiro/specs/feature-name/
├── requirements.md  # What needs to be built (static)
├── design.md        # How it should be built (static)
├── tasks.md         # Implementation checklist (updated as completed)
├── notes.md         # Real-time development log (continuous updates)
└── report.md        # Final summary report (created at completion)
```

#### Option A: Use Existing SPEC
```bash
cd .kiro/specs/existing-feature/
# Review requirements.md - what needs to be built
# Review design.md - how it should be built  
# Review tasks.md - current progress
# Continue from current task
```

#### Option B: Create New SPEC
```bash
mkdir -p .kiro/specs/new-feature/
# Create requirements.md - detailed requirements
# Create design.md - architecture and implementation plan
# Create tasks.md - step-by-step implementation tasks
# Create notes.md - ongoing development log (use KIRO_TEMPLATES.md)
# Use KIRO_TEMPLATES.md for structure
```

### Implementation with Continuous Validation
```bash
# Create feature branch
git checkout -b feature/spec-name

# Record discoveries in notes.md throughout development (MANDATORY)
# Update notes.md when: investigating, implementing, testing, debugging
# Use timestamp format: [YYYY-MM-DD HH:MM] for each entry
# IMPORTANT: Include full context, thought process, and emotional reactions
# Write as if explaining to future self who has no memory of this work
# Record dead ends, surprises, gut feelings, and breakthrough moments

# DRY verification before coding (MANDATORY)
find . -name "*similar_name*"           # Check existing files
grep -r "function_name" src/            # Search existing functions
ls src/core/ src/utils/ src/services/   # Review existing modules

# Clean Architecture validation during development
grep -r "from src.core" src/handlers/   # ✅ OK: External → Internal
grep -r "from src.handlers" src/core/   # ❌ VIOLATION: Internal → External

# Continuous testing
pytest tests/ -v                        # All tests pass
pytest --cov=src --cov-report=term     # Coverage ≥80%
```

### Maintain Codebase Integrity
- Update  .kiro/steering/{structure.md|tech.md|product.md} documents if architecture changed (CRITICAL for future sessions)
- Ruthless cleanup (MANDATORY)
- Final validation

```bash
# Ruthless cleanup (MANDATORY) - Use automated tools for comprehensive detection
# Python
autoflake --remove-all-unused-imports --recursive src/  # Remove unused imports
vulture . --min-confidence 80                          # Detect unused code
unimport --check --diff .                              # Find unused imports
dead --exclude tests/                                  # Find dead code

# JavaScript/TypeScript
npx ts-prune                                           # Find unused exports
npx unimported                                         # Find unused files/dependencies
npx depcheck                                           # Find unused dependencies

# Rust
cargo machete                                          # Find unused dependencies
cargo udeps                                            # Find unused dependencies (nightly)

# Go
go mod tidy                                            # Remove unused dependencies
golangci-lint run --enable unused,deadcode            # Find unused code

# Remove obsolete files manually after tool analysis
# Update all references before deletion
# Verify removal with: git status, find . -name "*.orig"

# Final validation
pytest tests/ --cov=src --cov-report=term
```

### Optional Development Lifecycle Tools (Agent Knowledge)
**Use these tools when appropriate for project needs - not mandatory**

#### Security & Vulnerability Detection
```bash
# Python
bandit -r src/                    # Security vulnerability detection
safety check                     # Dependency vulnerability check
semgrep --config=auto src/        # Static analysis security check

# JavaScript/TypeScript  
npm audit                         # Dependency vulnerability check
eslint-plugin-security           # Security rules

# Rust
cargo audit                       # Vulnerability check

# Go
gosec ./...                       # Security vulnerability detection
```

#### Code Quality & Complexity Analysis
```bash
# Python
radon cc src/ -a                  # Cyclomatic complexity measurement
xenon --max-absolute B src/       # Complexity check
flake8 --max-complexity=10        # Complexity limits

# JavaScript/TypeScript
npx complexity-report             # Complexity reporting
eslint-plugin-complexity         # Complexity rules

# Multi-language
sonarqube                         # Comprehensive code quality analysis
```

#### Dependency Management & Updates
```bash
# Python
pip-audit                         # Dependency audit
pipdeptree                        # Dependency tree visualization
pip-check-updates                 # Update available packages check

# JavaScript/TypeScript
npm-check-updates                 # Package update check
bundlephobia                      # Bundle size analysis

# Rust
cargo outdated                    # Outdated dependencies check
cargo tree                        # Dependency tree

# Go
go mod graph                      # Dependency graph
```

#### Performance & Profiling
```bash
# Python
py-spy top -p <pid>              # Real-time profiling
memory_profiler                   # Memory usage analysis
line_profiler                     # Line-by-line performance

# JavaScript/TypeScript
clinic doctor -- node app.js     # Node.js performance diagnostics
0x                               # Flame graph generation

# Rust
cargo flamegraph                  # Flame graph generation
```

#### Documentation & API Quality
```bash
# Python
pydocstyle                        # Docstring quality check
interrogate                       # Documentation coverage

# JavaScript/TypeScript
jsdoc                            # API documentation generation
documentation.js                  # Modern documentation generation

# OpenAPI/REST
swagger-codegen                   # Code generation from API specs
redoc-cli                        # API documentation generation
```
