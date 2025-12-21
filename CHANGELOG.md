# Changelog

All notable changes to the **Keystone** framework will be documented in this file.

The format is based on [Keep a Changelog](https://keepachangelog.com/en/1.0.0/),
and this project adheres to [Semantic Versioning](https://semver.org/spec/v2.0.0.html).

## [4.3.0] - 2025-12-09
### Added
- **Task Management (v4.3):** Enhanced task tracking with dependencies and workstreams
  - 6-status workflow: Backlog → Open → In Progress → Blocked → Done → Archive
  - Task dependencies with explicit `Dependencies:` field
  - Workstream support for parallel work contexts
  - Auto-generated kanban board (`board.md`)
- **User Commands:** "Generate board", "Next task", "Switch to [workstream]", "Archive done tasks"
- **Meta-project specs/:** Full specification directory (problem.md, product.md, requirements.md, design.md, options.md, tech.md, tasks.md)
- **Migration Guide:** `keystone/docs/MIGRATION.md` for v4.2 → v4.3 upgrades

### Changed
- **AGENTS.md:** Updated repository structure diagram, added Task Management section
- **specs/tasks.md:** New format with Status Legend, Workstreams table, Archive section
- **directives/EXECUTION.md:** Added Phase 0.1 (board generation) and Phase 2.1 (dependency checks)
- **directives/THINKING.md:** Added Phase T4.2 (AI-assisted task generation)
- **templates/active_state.md:** Added Active Workstream section

### Meta-Project
- Migrated meta-project (knowledge_base/) to v4.3 format
- Created `.context/workstreams/` and `.context/board.md`
- Full dogfooding of v4.3 task management

## [4.2.0] - 2025-12-07
### Added
- **Defense-in-Depth:** Multiple approval checkpoints in THINKING.md and EXECUTION.md
- **Handshake Rule:** Explicit ban on same-turn plan→implement transitions

### Changed
- **Golden Rule #6:** Enhanced with Handshake Rule enforcement
- **README.md:** Added Pro-Tips about Consensus Gate

## [4.1.0] - 2025-12-02
### Added
- **Elimination Test:** New mandatory checkpoint in T1 phase with three prompts:
  - "Who requested this?" (requirement accountability)
  - "What can be removed entirely?" (deletion forcing)
  - "Ruthless prioritization" (minimal problem worth solving)
- **Clean Slate Question:** Added "What would we build with zero legacy constraints?" to T1.2
- **Operational Mandates Section:** New Section 9 in `CODING_STANDARDS.md` consolidating reliability rules
- **Phase T-RFL (Reflection):** New lightweight phase in `THINKING_DIRECTIVES.md` for Epilogue synthesis:
  - T-RFL.1: Session Review (what worked, what didn't, what surprised)
  - T-RFL.2: Pattern Extraction (Learning/Mandate/Outcome format)
  - T-RFL.3: Decision Distillation (ADR triggers include "significant trade-off")
  - T-RFL.4: Handover Synthesis
- **Epilogue Enforcement:** Epilogue is now MANDATORY with explicit callout in EXECUTION_DIRECTIVES

### Changed
- **AGENTS.template.md:** Compressed from 112 to 63 lines (44% reduction)
  - Removed CLI Configuration (moved to README)
  - Compressed Common Commands to single line
  - Compressed State Files to inline format
  - Made Escape Hatch a prominent callout box
- **AGENTS.md:** Compressed from 107 to 77 lines (28% reduction)
- **EXECUTION_DIRECTIVES.md:** Compressed from 288 to 247 lines (14% reduction)
  - Moved Phase 1.5 (Operational Mandates) to CODING_STANDARDS.md
  - Compressed active_state template from 15 to 5 lines
  - Phase 4.2 now references T-RFL for reflective learning
- **THINKING_DIRECTIVES.md:** Added Phase T-RFL (~40 lines)
  - Compressed T4 artifact table and checklist
- **CODING_STANDARDS.md:** Added 30 lines for Section 9 (141 → 171 lines)
- **README.md:** Updated Mermaid diagram to show Thinking/Execution/Epilogue flow
- **Golden Rules:** Epilogue rule updated to emphasize mandatory reflective thinking

### Rationale
- Token frugality: Directive files are read repeatedly; compression saves context
- Consolidated mandates: All reliability rules now in one location
- Preserved enforcement: MUST, CRITICAL, STOP, WAIT keywords retained
- Reflective Epilogue: Ensures genuine insight extraction, not mechanical documentation

## [4.0.0] - 2025-12-02
### Added
- **Thinking Directives:** New `coding/THINKING_DIRECTIVES.md` for First Principles design work:
  - Phase T1: Recursive Decomposition of new features/refactors
  - Phase T1-RCA: Root Cause Analysis for complex bugs (with OODA Stop-Gap)
  - Phase T2: Design Thinking (Empathize, Define)
  - Phase T3: Solution Exploration (Generate Options, Evaluate, Consensus Gate)
  - Phase T4: Transition to Execution
- **OODA Stop-Gap:** After 3 failed debugging iterations, AI must assess confidence (0-100%):
  - <50%: Return to THINKING_DIRECTIVES
  - 50-80%: Consult user
  - >80%: Continue with justification
- **Problem & Options Templates:** Created `spec_problem.md` and `spec_options.md` for structured exploration.

### Changed
- **Execution Directives:** `coding/AI_CODING_DIRECTIVES.md` → `coding/EXECUTION_DIRECTIVES.md` (refactored for implementation focus).
- **Progressive Disclosure Routing:** Updated `AGENTS.md` and `AGENTS.template.md` with new decision table:
  - New features/refactors → `THINKING_DIRECTIVES.md`
  - Complex bugs → `THINKING_DIRECTIVES.md` (Phase T1-RCA)
  - Implementation → `EXECUTION_DIRECTIVES.md`
  - Code review → `CODING_STANDARDS.md`

### Removed
- **AI_CODING_DIRECTIVES.md:** Deprecated in favor of split Thinking/Execution model.

### Migration Notes
- **Breaking Change:** Projects using v3.x must update root files to reference new directive split.
- All content from `AI_CODING_DIRECTIVES.md` has been preserved in `EXECUTION_DIRECTIVES.md` with OODA Stop-Gap addition.

## [3.1.1] - 2025-12-01
### Added
- **Root File Templates:** Created `AGENTS.template.md`, `CLAUDE.template.md`, `GEMINI.template.md` for multi-CLI tool support (OpenCode, Gemini CLI, Claude Code).
- **Progressive Disclosure Architecture:** Root files are now slim (~100 lines) with pointers to detailed protocols. Reduces instruction budget consumption.
- **Design Spec Template:** Created `spec_design.md` for Mermaid.js diagrams (sequence, state, component, data flow).
- **CLI Tool Setup Guide:** Added comprehensive CLI configuration instructions to README.md.

### Changed
- **README.md Rewrite:** New structure with Quick Start, CLI Setup, Progressive Disclosure explanation, and full template listing.
- **Template Reorganization:** Moved `PROJECT_LEARNINGS_TEMPLATE.md` to `coding/templates/PROJECT_LEARNINGS.template.md` for consistency.
- **Directive Preambles:** Added progressive disclosure context to `AI_CODING_DIRECTIVES.md` and `CODING_STANDARDS.md`.
- **Project Root File:** Replaced `GEMINI.md` with `AGENTS.md` as canonical root file. Added `CLAUDE.md` wrapper.

### Removed
- **GEMINI.md:** Replaced by `AGENTS.md` (configure Gemini CLI to read AGENTS.md or use GEMINI.template.md).

## [3.1.0] - 2025-11-27
### Added
- **Harmonized Structure:** Consolidated all distributable framework files (Directives, Standards, Templates) into a single, portable `coding/` directory.
- **Decision Log Logic:** Defined "Fundamental Pivot" (Dependency/Schema/Deprecation) as the trigger for Decision Records. Added `coding/templates/decision_log.md`.
- **Project Learnings Template:** Created `coding/PROJECT_LEARNINGS_TEMPLATE.md` as a clean seed for new projects, separating framework meta-rules from project constraints.

### Changed
- **State Optimization:** Removed task duplication between `active_state.md` and `tasks.md`. `tasks.md` is now the Single Source of Truth for execution status.
- **File Layout:** Moved `DECISION_LOG.md` and `PROJECT_LEARNINGS.md` to the project root to distinguish "Project Instance" from "Distributable Framework".

## [3.0.0] - 2025-11-27
### Added
- **Pragmatic Spec-Driven Development (SDD):** A lightweight, context-first approach to specifications.
- **The Consensus Gate:** A mandatory "Stop-and-Wait" protocol where the agent must present a plan summary and await user approval before coding.
- **Template Suite:** Standardized `docs/templates/` for Product, Tech, Requirements, and Tasks.
- **EARS Syntax:** Enforced "Easy Approach to Requirements Syntax" in `requirements.md`.
- **Knowledge Preservation Rule:** Explicit mandate to append/refine docs rather than rewrite/delete.

### Changed
- **Directives Upgrade:** `AI_CODING_DIRECTIVES.md` updated to v3.
- **Task Workflow:** Shifted from "Atomic Units" to "Inlined Constraints" in `tasks.md`.
- **Documentation:** `README.md` now reflects the SDD workflow and tooling.

## [1.0.0] - 2025-11-20
### Added
- **AI Coding Directives v2:** A state-aware, First-Principle based protocol for AI agents.
    - Introduced `active_state.md` for persistent memory.
    - Introduced "Recursive Decomposition" for architecture.
    - Introduced "Epilogue Protocol" for documentation enforcement.
- **Coding Standards:** Comprehensive rules for Python, TS/JS, and Git.
- **Templates:** Standard templates for `.context/active_state.md` and `.context/handover.md`.
- **Project Learnings:** A seed file for tracking architectural wisdom.

### Changed
- **Architecture:** Shifted from "Task Logging" (v1) to "State Management" (v2).
- **Style:** Enforced "Telegraphic Style" for internal context files to save tokens.
