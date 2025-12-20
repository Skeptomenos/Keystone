# Implementation Plan (The "When")

## Status Legend

| Status | Meaning | Next Action |
|--------|---------|-------------|
| `Backlog` | Idea captured, not prioritized | Prioritize or park |
| `Open` | Ready to work, dependencies met | Start work |
| `In Progress` | Currently being worked on | Complete or block |
| `Blocked` | Cannot proceed, waiting for dependency | Resolve blocker |
| `Done` | Verified and complete | Archive when ready |
| `Archive` | Historical reference | None |

---

## Workstreams

> **Purpose:** Organize tasks by feature or focus area. Use for parallel work contexts.

| Workstream | Description | Status |
|------------|-------------|--------|
| `main` | Framework development and maintenance | Active |
| `docs` | Documentation improvements | Active |

---

## Phase 1: v4.3 Migration

### Workstream: main

- [x] **TASK-001:** Implement v4.3 task management in anamnesis_starter
    - **Dependencies:** None
    - **Status:** Done
    - **Workstream:** main
    - **Context/Constraints:** Completed in previous session

- [x] **TASK-002:** Migrate meta-project to v4.3
    - **Dependencies:** TASK-001
    - **Status:** Done
    - **Workstream:** main
    - **Context/Constraints:** This migration

---

## Phase 2: Documentation

### Workstream: docs

- [x] **TASK-003:** Improve framework README clarity
    - **Dependencies:** None
    - **Status:** Done
    - **Workstream:** docs
    - **Context/Constraints:** Make onboarding smoother for new users

- [x] **TASK-004:** Add visual diagrams to directives
    - **Dependencies:** None
    - **Status:** Done
    - **Workstream:** docs
    - **Context/Constraints:** Mermaid.js flowcharts for THINKING.md and EXECUTION.md

---

## Archive

<!-- Completed tasks moved here for historical reference -->

- [x] **TASK-000:** Implement v4.2 Defense-in-Depth — *Completed: 2025-11-27*
    - **Dependencies:** None
    - **Status:** Archive
    - **Workstream:** main
