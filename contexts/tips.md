# Tips:

## Codebase Search

### Search Strategy
- Search before modifying to understand existing implementations
- Use specific patterns to avoid false positives
- Combine file and content searches for comprehensive analysis

### Exclude Package Directories
**IMPORTANT**: Always exclude package directories to avoid extremely slow searches:
- `grep -r "pattern" . --exclude-dir=node_modules --exclude-dir=.venv --exclude-dir=.git`
- `find . -name "*.py" -not -path "*/node_modules/*" -not -path "*/.venv/*"`
