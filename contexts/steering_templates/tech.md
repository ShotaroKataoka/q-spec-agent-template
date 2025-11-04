<!-- Steering Tech Template -->

# Tech

## Technology Stack

### Core Technologies
List the main technologies used in this project.

**Example**:
```
Language: Python 3.11
Framework: FastAPI
Database: PostgreSQL 15
```

**Information to elicit through interview**:
- What language and version? Why that version?
- What frameworks/libraries?
- What database/storage?
- What other core technologies?

---

## Platform Support

Define supported platforms and environments.

**Example**:
```
Supported OS:
- Linux (Ubuntu 22.04+)
- macOS (13.0+)
- Windows (via WSL2)

Deployment:
- Docker containers
- AWS ECS
```

**Information to elicit through interview**:
- What platforms to support?
- What deployment environments?
- Any platform-specific constraints?

---

## Dependencies

Define the policy for external dependencies.

**Example**:
```
Dependency policy:
- Minimize external dependencies
- Use only actively maintained libraries
- Document reason for each major dependency

Major dependencies:
- pydantic: Data validation (type safety)
- httpx: HTTP client (async support)
```

**Information to elicit through interview**:
- What is the dependency policy?
- What are the major dependencies and why?
- Any restrictions on adding dependencies?

---

## Notes

**Important**: This file complements steering seeds.
- If tech stack seeds exist: Record only information not covered by seeds
- If no seeds: Record all technical decisions

**Do not duplicate**: Avoid recording information already in seeds.

---

**Created**: YYYY-MM-DD
