# Cleanup Rules

## Principle
**Dead code is liability, not asset**

Remove unused code immediately when detected. Git preserves history.

## Detection Strategy
1. **Use language-specific tools** for accurate detection
2. **Manual grep verification** for final confirmation
3. **Automated tools first** - comprehensive detection

## Safety Workflow
```bash
# 1. Commit current state
git add [files] && git commit -m "before cleanup message"

# 2. Run detection tools
[language-specific-tool] --detect-unused

# 3. Remove unused code
# 4. Test execution
[test-command]

# 5. Commit cleanup
git add [files] && git commit -m "cleanup message"
```

## Universal Targets
- Unused imports/functions/variables
- Empty directories
- Backup files (.bak, .orig, .tmp)
- Generated files not in .gitignore

## Prohibited Cleanup
- Tests (unless user explicitly requests)
- Configuration files
- Documentation
- External dependencies

## Recovery
```bash
git revert HEAD  # If issues found
```

---
**Created**: 2025-09-23
