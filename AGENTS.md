# Keystone

> A stateful, spec-driven framework for AI-assisted software engineering.

> **⚠️ META-PROJECT:** This IS the framework source. Changes propagate to all downstream projects.

## Overview

Keystone solves core AI-assisted coding problems:
- **Amnesia** → Persistent state (`project/`)
- **Hallucination** → Spec-Driven Development (`specs/`)
- **Vibe Coding** → Consensus Gates
- **Monolithic Code** → Atomic decomposition

**Version:** 4.4

## Tech Stack

- **Format:** Markdown (.md)
- **Diagrams:** Mermaid.js
- **Version Control:** Git with Conventional Commits

## Repository Structure

```
knowledge_base/                    # META-PROJECT (this repo)
├── keystone_starter/             # DISTRIBUTABLE STARTER (copy to new projects)
│   ├── keystone/                 # The framework
│   │   ├── project/               # Project state
│   │   ├── directives/            # THINKING.md, EXECUTION.md
│   │   ├── standards/             # Code quality rules
│   │   ├── specs/                 # Feature specifications
│   │   ├── templates/             # Recreatable file templates
│   │   ├── DECISION_LOG.md
│   │   ├── PROJECT_LEARNINGS.md
│   │   └── README.md
│   ├── AGENTS.md                  # AI entry point
│   ├── CHANGELOG.md
│   └── INITIATOR.md               # Setup & Update Wizard
├── keystone/                     # This project's framework instance
│   ├── project/                   # Session state
│   ├── directives/                # THINKING.md, EXECUTION.md
│   ├── standards/                 # Code quality rules
│   ├── specs/                     # Feature specifications
│   └── templates/                 # Recreatable file templates
├── AGENTS.md                      # THIS FILE (meta-project entry)
├── CHANGELOG.md
├── DECISION_LOG.md
├── PROJECT_LEARNINGS.md
└── README.md
```

---

## Protocol

### Golden Rules

1. **Wizard:** Use `keystone_starter/INITIATOR.md` for setup and updates.
2. **Smart Merging:** Directives (`THINKING.md`, `EXECUTION.md`) are single files that merge framework logic with your custom rules. Read the whole file; custom rules are usually at the bottom.
3. **State:** Read `keystone/project/mission.md` + `keystone/project/active_state.md` at session start.
4. **Specs:** Complex tasks (>1hr) require `keystone/specs/`. No code without spec.
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
| Session start | `keystone/project/mission.md` + `keystone/project/active_state.md` |
| New feature, refactor | `keystone/directives/THINKING.md` |
| Complex bug | `keystone/directives/THINKING.md` (T1-RCA) |
| Implementation | `keystone/directives/EXECUTION.md` |
| Code review | `keystone/standards/INDEX.md` |
| Project constraints | `PROJECT_LEARNINGS.md` |

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
| Task selection | `keystone/project/tasks.md` (check dependencies) |
| Progress overview | `keystone/project/board.md` |
| Workstream context | `keystone/project/workstreams/[name].md` |

---

## Commands

```bash
git status                    # Check state
git diff                      # Review changes
ls keystone_starter/         # Inspect distributable framework
```

## State Files

`keystone/project/active_state.md` (current) | `keystone/project/handover.md` (previous) | `keystone/project/tasks.md` (plan) | `keystone/project/board.md` (progress)
