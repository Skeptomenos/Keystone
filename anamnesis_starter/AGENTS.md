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
├── .context/      # Session state
├── directives/    # THINKING.md, EXECUTION.md
├── standards/     # Code quality rules
├── specs/         # Feature specifications
└── templates/     # Recreatable file templates
```

---

## Protocol

### Golden Rules

1. **State:** Read `anamnesis/.context/mission.md` + `anamnesis/.context/active_state.md` at session start
2. **Specs:** Complex tasks (>1hr) require `anamnesis/specs/`. No code without spec.
3. **Consensus:** Present plan, WAIT for approval before coding
4. **Epilogue:** MANDATORY after feature/design completion.
5. **NO IMPLEMENTATION WITHOUT APPROVAL:** ⚠️ CRITICAL ⚠️
   - Planning, reading, and research: ALWAYS allowed
   - Writing, editing, or deleting files: REQUIRES explicit user approval
   - You MUST present your plan and ask "Ready to proceed?" or similar
   - WAIT for user to say "go", "proceed", "do it", "yes", or clear equivalent
   - Do NOT interpret your own confidence or plan completeness as approval
   - **HANDSHAKE RULE:** You CANNOT plan and implement in the same response.
     If you just finished planning → STOP. Do not continue to implementation.

> **Models prone to eager execution:** This means YOU. Plan. Present. Ask. Wait.

> **ESCAPE HATCH:** Simple questions or read-only tasks → skip protocol, act immediately.

### When to Read

| Task | File |
|------|------|
| Session start | `anamnesis/.context/mission.md` + `anamnesis/.context/active_state.md` |
| New feature, refactor | `anamnesis/directives/THINKING.md` |
| Complex bug | `anamnesis/directives/THINKING.md` (T1-RCA) |
| Implementation | `anamnesis/directives/EXECUTION.md` |
| Code review | `anamnesis/standards/INDEX.md` |
| Python code | `anamnesis/standards/global.md` + `anamnesis/standards/python.md` |
| Rust/Tauri code | `anamnesis/standards/global.md` + `anamnesis/standards/rust.md` |
| Project constraints | `anamnesis/PROJECT_LEARNINGS.md` |

---

## Task Management

> **Task Awareness:** AI must check dependencies and status before selecting tasks.

### Task Selection Rules

1. **Dependency Check:** Never start a task if its dependencies aren't `Done` or `Archive`
2. **Status Flow:** Backlog → Open → In Progress → Done → Archive
3. **Blocked Handling:** Mark tasks as `Blocked` if dependencies are unmet
4. **Board Sync:** Regenerate `board.md` at session start, end, and on user command

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
| Task selection | `anamnesis/specs/tasks.md` (check dependencies) |
| Progress overview | `anamnesis/.context/board.md` |
| Workstream context | `anamnesis/.context/workstreams/[name].md` |

---

## Commands

```bash
# Build: [cmd]    Test: [cmd]    Lint: [cmd]    Run: [cmd]
```

## Constraints

- [Project-specific constraint 1]
- [Project-specific constraint 2]

## State Files

`anamnesis/.context/active_state.md` (current) | `anamnesis/.context/handover.md` (previous) | `anamnesis/specs/tasks.md` (plan) | `anamnesis/.context/board.md` (progress)
