# Changelog

All notable changes to this project will be documented in this file.

The format is based on [Keep a Changelog](https://keepachangelog.com/en/1.0.0/),
and this project adheres to [Semantic Versioning](https://semver.org/spec/v2.0.0.html).

## [4.7.0] - 2025-12-25

### Added
- **Task Lifecycle Tracking:** Added `Created`, `Started`, and `Completed` date fields to tasks.
- **Enhanced Aggregator:** `aggregate.py` now parses lifecycle dates and displays them with emojis (`📅`, `🚀`, `✅`) on the project board.
- **Auto-Date Fallback:** Aggregator intelligently defaults missing dates based on task status and current system time.
- **Beautiful Terminal Output:** Replaced standard logging with a formatted, high-visibility terminal summary.
- **Changelog Enforcement:** Added a super hard rule: **NO COMMIT WITHOUT CHANGELOG**. Changelogs must always be appended to the top and never overwritten.

### Changed
- **EXECUTION.md:** Added "Task Lifecycle Dates" protocol and AI fallback guidance for date tracking. Enforced mandatory Changelog updates in Epilogue.
- **INITIATOR.md:** Updated MVA templates to include task lifecycle date fields. Enhanced with Changelog awareness to explain version deltas to users.
- **Board Aggregator:** Improved regex patterns to support multi-hyphen task IDs (e.g., `TASK-UI-001`) and prevent cross-section matching.
- **AGENTS.md:** Added critical Golden Rule for Changelog consistency.

## [4.6.1] - 2025-12-22

### Changed
- **Version Bump:** Incremental update to 4.6.1.
- **Documentation:** Updated root and starter READMEs for better clarity.
- **Wizard:** Refined INITIATOR.md migration logic for flat-file workstreams.

## [4.6.0] - 2025-12-21

### Added
- **Unified Workstream Model:** Consolidated `tasks.md`, `active_state.md`, and `workstream.md` into a single `workstream.md` file per context.
- **Keystone Board Skill:** Agent skill (`aggregate.py`) that parses unified workstream files and generates a global project board with cross-workstream dependency resolution.
- **Keystone Init Skill:** Instruction-only skill for scaffolding new workstreams and registering them in the global registry.
- **Workstream Registry:** Centralized `registry.md` to track parallel session ownership and status.
- **Prefixed IDs:** Mandatory task ID prefixes (e.g., `AUTH-001`) to prevent collisions in parallel work.

### Changed
- **EXECUTION.md:** Fully refactored for the Unified Workstream Model. Added "Identity Anchor" protocol for session self-awareness.
- **THINKING.md:** Added "Delegation Planning" phase to design modular features for parallel execution.
- **INITIATOR.md:** Updated with "Sandbox Split" migration logic to graduate legacy projects to the unified model.
- **Templates:** Replaced split templates with `workstream_unified.md`.

### Removed
- **Global active_state.md:** Decentralized to workstream folders.
- **Global handover.md:** Deprecated in favor of "Context for Resume" section in unified workstream files.

## [4.4.0] - 2025-12-21

### Added
- **INITIATOR.md Wizard:** Single-file entry point for setup, retrofit, and updates.
- **Smart Merging Protocol:** Directives are now single files (`THINKING.md`, `EXECUTION.md`) that merge framework updates with user customizations.
- **Intelligent Retrofit Engine:** "The Archaeologist" for mapping existing projects with source attribution and reality check gates.
- **Semantic Protocol Versioning:** Version headers in core directives to manage migrations.
- **MVA Templates:** Minimal Viable Keystone templates embedded in `INITIATOR.md` for offline setup.

### Changed
- **Directory Structure:** Renamed `.context/` to `project/` for better clarity and alignment with project-specific state.
- **AGENTS.md:** Updated to support Smart Merging and the Wizard onboarding flow.
- **Directives:** Updated `THINKING.md` and `EXECUTION.md` with versioning and new protocols.
- **Templates:** All templates updated to use the new `project/` directory paths.

### Removed
- **.context/ directory:** Replaced by `project/`.
- **Shadow File Architecture:** Replaced by Smart Merging for reduced directory clutter.
## [4.3.0] - 2025-12-09

### Added
- **Enhanced Task Management:** Tasks now include Dependencies, Status, and Workstream fields
- **Status Workflow:** 6-status system (Backlog, Open, In Progress, Blocked, Done, Archive)
- **Kanban Board:** Auto-generated `board.md` for visual progress tracking
- **Workstreams:** Parallel work context management via `.context/workstreams/`
- **User Commands:** Explicit commands for board generation, task management, and workstream switching
- **AI-Assisted Task Generation:** Automatic task creation from requirements in THINKING.md Phase T4.2
- **Migration Guide:** `keystone/docs/MIGRATION.md` for upgrading from v4.2

### Changed
- **EXECUTION.md:** Enhanced Phase 0.1 with board generation, Phase 2.1 with dependency checks
- **THINKING.md:** Added Phase T4.2 for AI-assisted task generation
- **AGENTS.md:** Added Task Management section with selection rules and user commands
- **active_state.md template:** Added Active Workstream section
- **tasks.md template:** Complete restructure with Status Legend, Workstreams, and Archive sections

### Templates Added
- `keystone/templates/board.md` - Kanban board template
- `keystone/templates/workstream.md` - Workstream context template

### Directories Added
- `keystone/.context/workstreams/` - Directory for parallel work contexts
- `keystone/docs/` - Documentation directory

## [4.2.0] - 2025-11-27

### Added
- Initial release with Spec-Driven Development framework
- THINKING.md and EXECUTION.md directives
- Template system for active_state, handover
- Standards framework (global, python, typescript, rust)
- Spec files (problem, options, requirements, design, tasks, tech, product)
