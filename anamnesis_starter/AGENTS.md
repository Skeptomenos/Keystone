# [Project Name]

> **Root File:** Auto-loaded by AI CLI tools. Keep concise (<80 lines).

## Overview

[2-3 sentences: What is this? What problem does it solve?]

## Tech Stack

- **Language:** [e.g., Python 3.11+]
- **Framework:** [e.g., FastAPI]
- **Database:** [e.g., PostgreSQL]

## Structure

```
src/               # Source code
tests/             # Tests
anamnesis/         # AI framework
├── project/       # Session state
├── directives/    # THINKING.core.md, EXECUTION.core.md
├── standards/     # Code quality rules
├── specs/         # Feature specifications
└── templates/     # Recreatable file templates
```

---

## Protocol

### Golden Rules

1. **Wizard:** Use `INITIATOR.md` for setup and updates.
2. **Shadow Files:** Directives are split into `*.core.md` (framework) and `*.custom.md` (user). Read BOTH; `*.custom.md` takes precedence.
3. **State:** Read `anamnesis/project/mission.md` + `anamnesis/project/active_state.md` at session start.
4. **Specs:** Complex tasks (>1hr) require `anamnesis/specs/`. No code without spec.
5. **Consensus:** Present plan, WAIT for approval before coding.
6. **Epilogue:** MANDATORY after feature/design completion.
7. **NO IMPLEMENTATION WITHOUT APPROVAL:** ⚠️ CRITICAL ⚠️
   - Planning, reading, and research: ALWAYS allowed.
   - Writing, editing, or deleting files: REQUIRES explicit user approval.
   - You MUST present your plan and ask "Ready to proceed?" or similar.
   - WAIT for user to say "go", "proceed", "do it", "yes", or clear equivalent.
   - **HANDSHAKE RULE:** You CANNOT plan and implement in the same response.

> **ESCAPE HATCH:** Simple questions or read-only tasks → skip protocol, act immediately.

### When to Read

| Task | File |
|------|------|
| Session start | `anamnesis/project/mission.md` + `anamnesis/project/active_state.md` |
| New feature, refactor | `anamnesis/directives/THINKING.{core,custom}.md` |
| Complex bug | `anamnesis/directives/THINKING.{core,custom}.md` (T1-RCA) |
| Implementation | `anamnesis/directives/EXECUTION.{core,custom}.md` |
| Code review | `anamnesis/standards/INDEX.md` |
| Project constraints | `anamnesis/PROJECT_LEARNINGS.md` |

---

## Task Management

### Task Selection Rules

1. **Dependency Check:** Never start a task if its dependencies aren't `Done` or `Archive`.
2. **Status Flow:** Backlog → Open → In Progress → Done → Archive.
3. **Board Sync:** Regenerate `board.md` at session start, end, and on user command.

### User Commands

| Command | Action |
|---------|--------|
| "Generate board" | Regenerate board from tasks |
| "Next task" | Find and start next Open task |
| "Switch to [workstream]" | Change active workstream |
| "Archive done tasks" | Move Done tasks to Archive |

### When to Read (Task-Related)

| Task | File |
|------|------|
| Task selection | `anamnesis/project/tasks.md` (check dependencies) |
| Progress overview | `anamnesis/project/board.md` |
| Workstream context | `anamnesis/project/workstreams/[name].md` |

---

## Commands

```bash
# Build: [cmd]    Test: [cmd]    Lint: [cmd]    Run: [cmd]
```

## State Files

`anamnesis/project/active_state.md` (current) | `anamnesis/project/handover.md` (previous) | `anamnesis/project/tasks.md` (plan) | `anamnesis/project/board.md` (progress)
