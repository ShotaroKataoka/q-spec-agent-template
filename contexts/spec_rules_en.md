# What is SPEC
SPEC is the specification that AI agents must follow when performing work.

## Core Principles
- **ALL YOU NEED is SPEC**: Apply SPEC to all work including "feature development", "bug fixes", "research", "documentation", etc. Coding agents dramatically improve their task execution capabilities by utilizing SPECs.
- **SPEC as an Asset**: SPECs are reusable assets. They demonstrate their true value through utilization of `notes.md` and `reports.md`. By saving accidental discoveries and problem-solving processes as assets, past SPECs can be reused through `find` or `grep` when encountering the same problems.
- **Question-based SPEC-driven Development**: Create extremely high-quality SPECs while reducing user burden through user interviews using the SPEC-Q Framework.

# SPEC Creation
## SPEC Naming Convention
Create SPECs in the following directory format:
`.kiro/specs/YYYYMMDD-HHMM_spec-name/`
Always include the year, month, day, hour, and minute of SPEC creation.
Use detailed names for spec-name that represent the actual content of the SPEC to improve searchability and facilitate future reuse.

### spec-name Examples
✅ implement-user-authentication-system
✅ fix-api-rate-limiting
❌ auth (ambiguous)
❌ bug-fix (non-specific)

## SPEC Structure
Each SPEC directory contains the following files:
- requirements.md - Requirement specifications
- design.md - Design specifications  
- tasks.md - Implementation tasks
- notes.md - Development log (thought records, discovery records, problem-solving processes)

# SPEC Execution
## Creation Process
1. Interview using SPEC-Q Framework
2. Create requirements.md
3. Create design.md
4. Create tasks.md (implementation checklist)
5. Start implementation (record in notes.md)

## Completion Conditions
- [ ] All tasks completed
- [ ] Tests passed
- [ ] report.md created
- [ ] Or user instruction

# SPEC State Management
## Active SPEC
- Location: Under `.kiro/specs/`
- Status: Work in progress

## Completed SPEC
- Condition: `report.md` creation completed
- Destination: `.kiro/specs/closed/{SPEC-close-date:YYYYMMDD}/{SPEC-creation-time:YYYYMMDD-HHMM}_{spec-name}/`

The date in the destination path is the close date.
