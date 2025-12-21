# [Project Name]

> **Root File:** Auto-loaded by AI CLI tools. Keep concise (<80 lines).

## Overview

[2-3 sentences: What is this? What problem does it solve?]

## Tech Stack

- **Language:** [e.g., Python 3.11+]
- **Framework:** [e.g., FastAPI]

## Structure

```
src/               # Source code
keystone/         # AI framework
├── project/       # Session state
│   ├── workstreams/ # Distributed tasks
│   └── board.md   # Consolidated view
├── directives/    # THINKING.md, EXECUTION.md
├── standards/     # Code quality rules
├── specs/         # Feature specifications
└── templates/     # Recreatable file templates
```

---

## Protocol

### Golden Rules

1. **Wizard:** Use `INITIATOR.md` for setup and updates.
2. **Smart Merging:** Directives are single files that merge framework logic with custom rules.
3. **State:** Read `keystone/project/mission.md` + `registry.md` at session start.
4. **Consensus:** Present plan, WAIT for approval before coding.
5. **Epilogue:** MANDATORY after task completion. Call `skills_keystone_board`.
6. **NO IMPLEMENTATION WITHOUT APPROVAL:** ⚠️ CRITICAL ⚠️

> **ESCAPE HATCH:** Simple questions or read-only tasks → skip protocol, act immediately.

### When to Read

| Task | File |
|------|------|
| Session start | `keystone/project/mission.md` + `registry.md` |
| New feature | `keystone/directives/THINKING.md` |
| Implementation | `keystone/directives/EXECUTION.md` |
| Project constraints | `keystone/PROJECT_LEARNINGS.md` |

---

## Task Management

### Task Selection Rules

1. **Isolation**: Only edit tasks in your assigned workstream folder.
2. **Prefixes**: Use workstream-specific prefixes for all task IDs.
3. **Board Sync**: Call `skills_keystone_board` to update the global view.

### User Commands

| Command | Action |
|---------|--------|
| "Generate board" | Call `skills_keystone_board` |
| "Next task" | Find and start next Open task in workstream |
| "Switch to [ws]" | Change active workstream focus |

### When to Read (Task-Related)

| Task | File |
|------|------|
| Task selection | `keystone/project/workstreams/[ws]/tasks.md` |
| Progress overview | `keystone/project/board.md` |
| Registry | `keystone/project/workstreams/registry.md` |

---

## Commands

```bash
# Build: [cmd]    Test: [cmd]    Lint: [cmd]    Run: [cmd]
```

## State Files

`active_state.md` | `handover.md` | `tasks.md` | `board.md`
