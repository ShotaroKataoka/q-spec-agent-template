# Git Rules for SPEC-Driven Development

## Core Principles
- **SPEC-aligned commits**: Each commit is associated with a specific SPEC
- **Atomic commits**: One logical change = One commit
- **Context preservation**: Preserve sufficient context for future agent sessions

## Agent Commit Requirements:
- **After code modifications**: Commit immediately after implementing features/fixes
- **After documentation updates**: Commit steering docs, SPEC updates separately
- **Atomic commits**: One logical change per commit for clear history
- **Never skip commits**: Essential for context preservation between sessions

## File Selection Rules
- **Create appropriate .gitignore**
- **Check `git status` before `git add`**
- **Prohibit `git add .`** - Force intentional file selection
- **SPEC-based file selection** - Include only files related to the same SPEC
- **Multi-agent support** - Prevent mixing changes from other SPECs

## Commit Format
```bash
✨ feat(spec-name): description     # New feature
🐛 fix(spec-name): description      # Bug fix  
♻️ refactor(spec-name): description # Code restructuring
🧹 cleanup(spec-name): description  # Remove obsolete files
📚 docs(spec-name): description     # Documentation updates
🔧 config(spec-name): description   # Configuration changes
🎯 perf(spec-name): description     # Performance improvements
🔒 spec(spec-name): description     # SPEC files update
```

**scope = SPEC name** (excluding timestamp)
Example: `feat(user-auth): implement login endpoint`

## Branch Strategy
- **main**: Production-ready code only
- **develop**: Regular development work (multiple SPECs in parallel)
- **feature/SPEC-name**: Only for breaking changes or experimental implementations

## SPEC-Linked Commit Process

### Regular Commits
```bash
git add [only SPEC-related files]
git commit -m "✨ feat(user-auth): implement password validation

SPEC: 20240923-1100_implement-user-auth
Progress: requirements.md, design.md completed
Next: Start tasks.md implementation"
```

### SPEC Completion Commits
1. Create report.md
2. Move SPEC to closed
3. Completion commit
