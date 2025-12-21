# Changelog

All notable changes to this project will be documented in this file.

The format is based on [Keep a Changelog](https://keepachangelog.com/en/1.0.0/),
and this project adheres to [Semantic Versioning](https://semver.org/spec/v2.0.0.html).

## [4.4.0] - 2025-12-21

### Added
- **INITIATOR.md Wizard:** Single-file entry point for setup, retrofit, and updates.
- **Shadow File Architecture:** Directives split into `*.core.md` and `*.custom.md` to allow framework updates without breaking user customizations.
- **Intelligent Retrofit Engine:** "The Archaeologist" for mapping existing projects with source attribution and reality check gates.
- **Semantic Protocol Versioning:** Version headers in core directives to manage migrations.
- **MVA Templates:** Minimal Viable Keystone templates embedded in `INITIATOR.md` for offline setup.

### Changed
- **Directory Structure:** Renamed `.context/` to `project/` for better clarity and alignment with project-specific state.
- **AGENTS.md:** Updated to support Shadow Files and the Wizard onboarding flow.
- **Directives:** Updated `THINKING.core.md` and `EXECUTION.core.md` with versioning and new protocols.
- **Templates:** All templates updated to use the new `project/` directory paths.

### Removed
- **.context/ directory:** Replaced by `project/`.

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
