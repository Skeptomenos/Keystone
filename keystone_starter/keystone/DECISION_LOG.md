# Decision Log

This document tracks significant architectural decisions (ADRs) for the project.

## 2025-12-21 Zero-Friction Refactor
*   **Context:** Framework adoption was hindered by manual setup friction and update conflicts with user customizations.
*   **Decision:** Implemented a single-file `INITIATOR.md` wizard and a Smart Merging Protocol for directives. Renamed `.context/` to `project/`.
*   **Consequences:**
    *   (+) Instant onboarding for new and existing projects.
    *   (+) Sustainable framework updates without breaking user rules.
    *   (+) Higher trust through source attribution in retrofits.
    *   (+) Cleaner directory structure (single directive files).
    *   (-) Requires more rigorous AI instructions for merging.
