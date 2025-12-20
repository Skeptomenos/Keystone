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
| `initiator` | INITIATOR.md development | Active |
| `archaeologist` | Retrofit engine logic | Active |
| `weaver` | Smart updates and Shadow Files | Active |
| `core` | Framework-wide changes | Active |

---

## Phase 1: The Initiator (Quick Win)

### Workstream: initiator

*All tasks completed and moved to Archive.*

---

## Phase 2: The Archaeologist (Retrofit)

### Workstream: archaeologist

- [x] **TASK-004: Implement Project Discovery & Mapping Logic** — *Completed: 2025-12-21*
    - **Dependencies:** None
    - **Status:** Done
    - **Workstream:** archaeologist
    - **Context/Constraints:** Logic for scanning files and generating a DISCOVERY.md map.

- [x] **TASK-005: Implement Source Attribution Protocol** — *Completed: 2025-12-21*
    - **Dependencies:** TASK-004
    - **Status:** Done
    - **Workstream:** archaeologist
    - **Context/Constraints:** Requirements must cite source files/lines.

- [x] **TASK-006: Implement Architecture Reality Check (Mermaid)** — *Completed: 2025-12-21*
    - **Dependencies:** TASK-004
    - **Status:** Done
    - **Workstream:** archaeologist
    - **Context/Constraints:** Generate current-state diagrams for user verification.

---

## Phase 3: The Weaver (Smart Updates)

### Workstream: weaver

- [x] **TASK-007: Implement Shadow File Architecture** — *Completed: 2025-12-21*
    - **Dependencies:** None
    - **Status:** Done
    - **Workstream:** weaver
    - **Context/Constraints:** Split directives into `.core.md` and `.custom.md`. Update AGENTS.md to read both.

- [x] **TASK-008: Implement Semantic Protocol Versioning** — *Completed: 2025-12-21*
    - **Dependencies:** TASK-007
    - **Status:** Done
    - **Workstream:** weaver
    - **Context/Constraints:** Add versioning to Markdown sections to prevent incompatible updates.

- [x] **TASK-009: Implement Dry-Run Diff (MIGRATION_PREVIEW.md)** — *Completed: 2025-12-21*
    - **Dependencies:** TASK-008
    - **Status:** Done
    - **Workstream:** weaver
    - **Context/Constraints:** Show users exactly what will change before applying updates.

---

## Phase 4: Integration & Documentation

### Workstream: core

*All tasks completed and moved to Archive.*

---

## Archive

- [x] **TASK-001: Create INITIATOR.md Template** — *Completed: 2025-12-21*
    - **Dependencies:** None
    - **Status:** Archive
    - **Workstream:** initiator
- [x] **TASK-002: Embed Minimal Viable Anamnesis (MVA) Templates** — *Completed: 2025-12-21*
    - **Dependencies:** TASK-001
    - **Status:** Archive
    - **Workstream:** initiator
- [x] **TASK-003: Implement New Project Design Thinking Flow** — *Completed: 2025-12-21*
    - **Dependencies:** TASK-001
    - **Status:** Archive
    - **Workstream:** initiator
- [x] **TASK-004: Implement Project Discovery & Mapping Logic** — *Completed: 2025-12-21*
    - **Dependencies:** None
    - **Status:** Archive
    - **Workstream:** archaeologist
- [x] **TASK-005: Implement Source Attribution Protocol** — *Completed: 2025-12-21*
    - **Dependencies:** TASK-004
    - **Status:** Archive
    - **Workstream:** archaeologist
- [x] **TASK-006: Implement Architecture Reality Check (Mermaid)** — *Completed: 2025-12-21*
    - **Dependencies:** TASK-004
    - **Status:** Archive
    - **Workstream:** archaeologist
- [x] **TASK-007: Implement Shadow File Architecture** — *Completed: 2025-12-21*
    - **Dependencies:** None
    - **Status:** Archive
    - **Workstream:** weaver
- [x] **TASK-008: Implement Semantic Protocol Versioning** — *Completed: 2025-12-21*
    - **Dependencies:** TASK-007
    - **Status:** Archive
    - **Workstream:** weaver
- [x] **TASK-009: Implement Dry-Run Diff (MIGRATION_PREVIEW.md)** — *Completed: 2025-12-21*
    - **Dependencies:** TASK-008
    - **Status:** Archive
    - **Workstream:** weaver
- [x] **TASK-010: Update AGENTS.md for Zero-Friction Model** — *Completed: 2025-12-21*
    - **Dependencies:** TASK-001, TASK-007
    - **Status:** Archive
    - **Workstream:** core
- [x] **TASK-011: Update MIGRATION.md for v4.4** — *Completed: 2025-12-21*
    - **Dependencies:** All previous tasks
    - **Status:** Archive
    - **Workstream:** core
