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
| `weaver` | Smart updates and Merging | Active |
| `core` | Framework-wide changes | Active |
| `testing` | Internal quality gates for starter | Active |

---

## Phase 5: Internal Testing (Meta-Project Only)

### Workstream: testing

*All tasks completed and moved to Archive.*

## Phase 6: Smart Merging Refactor

### Workstream: core

- [x] **TASK-015: Implement Smart Merge Protocol in INITIATOR.md** — *Completed: 2025-12-21*
    - **Dependencies:** TASK-007
    - **Status:** Archive
    - **Workstream:** core
- [x] **TASK-016: Consolidate Shadow Files into single directives** — *Completed: 2025-12-21*
    - **Dependencies:** TASK-015
    - **Status:** Archive
    - **Workstream:** core
- [x] **TASK-017: Update AGENTS.md and README.md for Smart Merging** — *Completed: 2025-12-21*
    - **Dependencies:** TASK-016
    - **Status:** Archive
    - **Workstream:** core
- [x] **TASK-018: Remove redundant root INITIATOR.md** — *Completed: 2025-12-21*
    - **Dependencies:** None
    - **Status:** Archive
    - **Workstream:** core

---

## Archive

- [x] **TASK-001: Create INITIATOR.md Template** — *Completed: 2025-12-21*
    - **Dependencies:** None
    - **Status:** Archive
    - **Workstream:** initiator
- [x] **TASK-002: Embed Minimal Viable Keystone (MVA) Templates** — *Completed: 2025-12-21*
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
- [x] **TASK-012: Implement Rigid Auditor Protocol** — *Completed: 2025-12-21*
    - **Dependencies:** None
    - **Status:** Archive
    - **Workstream:** testing
- [x] **TASK-013: Create Starter Health State File** — *Completed: 2025-12-21*
    - **Dependencies:** None
    - **Status:** Archive
    - **Workstream:** testing
- [x] **TASK-014: Execute First Full Starter Audit** — *Completed: 2025-12-21*
    - **Dependencies:** TASK-012, TASK-013
    - **Status:** Archive
    - **Workstream:** testing
