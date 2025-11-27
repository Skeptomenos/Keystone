# Decision Log

This document tracks significant architectural decisions (ADRs) for the Anamnesis framework.

## [2025-11-20] Pivot to State-Based Memory
*   **Context:** v1 used ephemeral log files per task (`logs/task_123.md`).
*   **Problem:** Logs were write-only. Agents rarely read old logs, leading to "Amnesia" and context fragmentation.
*   **Decision:** Replaced logs with a Singleton State pattern (`.context/active_state.md`).
*   **Consequences:**
    *   (+) Continuity is enforced.
    *   (+) Agents always know "Where am I?".
    *   (-) Requires explicit "Archival Rotation" step to prevent file bloat.

## [2025-11-20] Enforcement of Telegraphic Style
*   **Context:** LLMs generate verbose text ("I will now proceed to..."), wasting tokens and diluting information density.
*   **Decision:** Mandated "Telegraphic Style" (Caveman speak) for all internal context files.
*   **Consequences:**
    *   (+) Higher information density per token.
    *   (+) Faster reads for the next agent.
    *   (-) Risk of ambiguity if causal links are removed. (Mitigated by "Causality" rule).

## [2025-11-20] Removal of Feature Flags & DB Migrations from Core Directives
*   **Context:** v1 included specific instructions for DB migrations and Feature Flags.
*   **Problem:** These are domain-specific (Web Apps) and bloated the core directives for generic scripts/libraries.
*   **Decision:** Removed specific implementation details but added a high-level "Persistence & Safety" principle in Phase 2.3.
*   **Consequences:**
    *   (+) Directives are cleaner and more universal.
    *   (-) Developers of complex DB apps must manually add these constraints to their `PROJECT_LEARNINGS.md`.
