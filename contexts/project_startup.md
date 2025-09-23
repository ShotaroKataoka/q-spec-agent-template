# Project Setup Guidelines

## Essential Structure
```bash
mkdir -p {.kiro/{specs,steering},src/{core,utils},tests/{unit,integration,performance,fixtures},config,docs,scripts}
```

## Required Files
- `README.md` - Project overview
- `.kiro/steering/{product,structure,tech}.md` - Use KIRO_TEMPLATES.md
- `.kiro/specs/feature-name/{requirements,design,tasks,notes}.md` - Use KIRO_TEMPLATES.md
- `docs/METRICS.md` - Performance and quality metrics

## Development Workflow
1. **Create SPEC**: Use templates from KIRO_TEMPLATES.md
2. **Follow CODING_STANDARDS.md**: All rules and validation
3. **Apply QUALITY_VALIDATION.md**: Performance and coverage requirements
4. **Use DEVELOPMENT_PATTERNS.md**: Common patterns and best practices
5. **Implement**: Code exactly as specified
6. **Validate**: Run all quality gates before marking tasks complete

## Language Setup
### Python: 
```bash
# Setup
pip install pytest pytest-cov pydantic fastapi
# Test
pytest tests/ --cov=src --cov-report=term
# Config: pyproject.toml
[tool.coverage.run] source=["src"] fail_under=80
```

### JavaScript/TypeScript: 
```bash
# Setup
npm init -y && npm install --save-dev jest @types/jest
# Test
npm test -- --coverage --coverageThreshold='{"global":{"lines":80}}'
# Config: package.json
"jest": {"collectCoverageFrom": ["src/**/*.{js,ts}"]}
```

### Rust: 
```bash
# Setup
cargo init && cargo add --dev criterion
# Test
cargo test && cargo bench
# Config: Cargo.toml
[dev-dependencies] criterion = "0.5"
```

### Go: 
```bash
# Setup
go mod init project-name && go get github.com/stretchr/testify
# Test
go test -v -cover ./...
# Config: go.mod
require github.com/stretchr/testify v1.8.0
```

## Quality Setup (MANDATORY)
### Coverage Configuration:
```toml
[tool.coverage.run]
source = ["src"]
fail_under = 80

[tool.pytest.ini_options]
markers = [
    "performance: performance tests",
    "integration: integration tests"
]
```

### CI/CD Integration:
```yaml
# .github/workflows/quality.yml
- name: Run Tests
  run: pytest tests/ --cov=src --cov-report=term
- name: Performance Tests  
  run: pytest -m performance -v
```
