# Changelog

All notable changes to the **Anamnesis** framework will be documented in this file.

The format is based on [Keep a Changelog](https://keepachangelog.com/en/1.0.0/),
and this project adheres to [Semantic Versioning](https://semver.org/spec/v2.0.0.html).

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
