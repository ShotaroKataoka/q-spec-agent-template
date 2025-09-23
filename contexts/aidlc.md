# Universal Development Standards
**For AI Coding Agent Development**

## Agent Context & Memory Management

### AI Agent Development Reality:
- **No persistent memory**: Cannot remember previous sessions, requires comprehensive recovery
- **Exhaustive analysis capability**: Can check entire codebase when properly directed
- **Pattern consistency**: Excels at following established patterns uniformly

### Context Persistence Strategy:
- **Steering documents**: Single source of truth for all architectural decisions
- **SPEC documentation**: Complete implementation history and rationale
- **Detailed commit messages**: Session-to-session memory bridge
- **Code comments**: Critical decision explanations for future context

### Agent Commit Requirements - MANDATORY:
- **After code modifications**: Commit immediately after implementing features/fixes
- **After documentation updates**: Commit steering docs, SPEC updates separately
- **Atomic commits**: One logical change per commit for clear history
- **Never skip commits**: Essential for context preservation between sessions


# Framework Modification
`/path/to/dir/aidlc-agent/contexts/user_preferences.md`

- **"Update CODING_STANDARDS"** → Modify development workflow rules
- **"Update KIRO_TEMPLATES"** → Modify SPEC creation templates
- **"Update PROJECT_SETUP"** → Modify language setup instructions
