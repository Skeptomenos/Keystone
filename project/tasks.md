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

- [ ] **TASK-001: Create INITIATOR.md Template**
    - **Dependencies:** None
    - **Status:** Open
    - **Workstream:** initiator
    - **Context/Constraints:** Must be a single file, easy to copy. Includes instructions for AI to handle setup.

- [ ] **TASK-002: Embed Minimal Viable Anamnesis (MVA) Templates**
    - **Dependencies:** TASK-001
    - **Status:** Backlog
    - **Workstream:** initiator
    - **Context/Constraints:** Embed essential templates (mission, tasks, problem) directly in INITIATOR.md for offline/first-turn setup.

- [ ] **TASK-003: Implement New Project Design Thinking Flow**
    - **Dependencies:** TASK-001
    - **Status:** Backlog
    - **Workstream:** initiator
    - **Context/Constraints:** AI instructions for guiding users through ideation/MVP scoping.

---

## Phase 2: The Archaeologist (Retrofit)

### Workstream: archaeologist

- [ ] **TASK-004: Implement Project Discovery & Mapping Logic**
    - **Dependencies:** None
    - **Status:** Open
    - **Workstream:** archaeologist
    - **Context/Constraints:** Logic for scanning files and generating a DISCOVERY.md map.

- [ ] **TASK-005: Implement Source Attribution Protocol**
    - **Dependencies:** TASK-004
    - **Status:** Backlog
    - **Workstream:** archaeologist
    - **Context/Constraints:** Requirements must cite source files/lines.

- [ ] **TASK-006: Implement Architecture Reality Check (Mermaid)**
    - **Dependencies:** TASK-004
    - **Status:** Backlog
    - **Workstream:** archaeologist
    - **Context/Constraints:** Generate current-state diagrams for user verification.

---

## Phase 3: The Weaver (Smart Updates)

### Workstream: weaver

- [ ] **TASK-007: Implement Shadow File Architecture**
    - **Dependencies:** None
    - **Status:** Open
    - **Workstream:** weaver
    - **Context/Constraints:** Split directives into `.core.md` and `.custom.md`. Update AGENTS.md to read both.

- [ ] **TASK-008: Implement Semantic Protocol Versioning**
    - **Dependencies:** TASK-007
    - **Status:** Backlog
    - **Workstream:** weaver
    - **Context/Constraints:** Add versioning to Markdown sections to prevent incompatible updates.

- [ ] **TASK-009: Implement Dry-Run Diff (MIGRATION_PREVIEW.md)**
    - **Dependencies:** TASK-008
    - **Status:** Backlog
    - **Workstream:** weaver
    - **Context/Constraints:** Show users exactly what will change before applying updates.

---

## Phase 4: Integration & Documentation

### Workstream: core

- [ ] **TASK-010: Update AGENTS.md for Zero-Friction Model**
    - **Dependencies:** TASK-001, TASK-007
    - **Status:** Backlog
    - **Workstream:** core
    - **Context/Constraints:** Ensure the root entry point supports the new wizard and shadow files.

- [ ] **TASK-011: Update MIGRATION.md for v4.4**
    - **Dependencies:** All previous tasks
    - **Status:** Backlog
    - **Workstream:** core
    - **Context/Constraints:** Document the transition to the Zero-Friction model.

---

## Archive

<!-- Completed tasks moved here for historical reference -->
