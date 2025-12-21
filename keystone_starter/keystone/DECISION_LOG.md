# Decision Log

This document tracks significant architectural decisions (ADRs) for the project.

## 2025-12-21 Zero-Friction Refactor
*   **Context:** Framework adoption was hindered by manual setup friction and update conflicts with user customizations.
*   **Decision:** Implemented a single-file `INITIATOR.md` wizard and a Shadow File architecture (`.core.md` vs `.custom.md`). Renamed `.context/` to `project/`.
*   **Consequences:**
    *   (+) Instant onboarding for new and existing projects.
    *   (+) Sustainable framework updates without breaking user rules.
    *   (+) Higher trust through source attribution in retrofits.
    *   (-) Slightly more complex directive structure (two files instead of one).
