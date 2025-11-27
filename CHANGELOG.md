# Changelog

All notable changes to the **Anamnesis** framework will be documented in this file.

The format is based on [Keep a Changelog](https://keepachangelog.com/en/1.0.0/),
and this project adheres to [Semantic Versioning](https://semver.org/spec/v2.0.0.html).

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
