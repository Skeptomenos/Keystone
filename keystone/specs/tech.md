# Technical Specification

## Technology Stack

| Component | Technology | Rationale |
|-----------|------------|-----------|
| Format | Markdown (.md) | Universal, AI-readable, version-controllable |
| Diagrams | Mermaid.js | Embeds in Markdown, renders in GitHub |
| Version Control | Git | Industry standard, diff-friendly |
| Commits | Conventional Commits | Structured, parseable history |

## File Naming Conventions

| Type | Convention | Example |
|------|------------|---------|
| Root files | UPPERCASE.md | AGENTS.md, CHANGELOG.md |
| Templates | UPPERCASE.md or lowercase.md | active_state.md, board.md |
| Specs | lowercase.md | tasks.md, design.md |
| State files | lowercase.md | mission.md, backlog.md |

## Integration Points

- **AI Entry:** AGENTS.md (or CLAUDE.md/GEMINI.md for specific models)
- **Wizard Entry:** INITIATOR.md (Setup & Update)
- **State Read:** `project/mission.md`, `project/active_state.md`
- **Task Source:** `project/tasks.md`
- **Board Output:** `project/board.md`

## Smart Merging Pattern

To support seamless updates while preserving customizations:
- Directives (`THINKING.md`, `EXECUTION.md`) are single files.
- The `INITIATOR.md` wizard performs a surgical merge of framework updates into local files.
- User-added rules (typically at the bottom of files) are strictly preserved.
- Shared files (`AGENTS.md`, `README.md`) use a section-based merge strategy.
