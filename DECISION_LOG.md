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

## [2025-12-01] Root File Template Integration (v3.1)
*   **Context:** AI CLI tools (OpenCode, Gemini CLI, Claude Code) auto-load root files (`AGENTS.md`, `GEMINI.md`, `CLAUDE.md`) into every conversation. This is the highest leverage point for AI context.
*   **Problem:** The framework lacked a root file template. Users had to manually prompt with `@coding/AI_CODING_DIRECTIVES.md` each session. The 215-line directives file exceeded the ~150-200 instruction budget recommended by research.
*   **Decision:** Implement Progressive Disclosure architecture:
    *   Created slim `AGENTS.template.md` (~90 lines) as canonical root file
    *   Created `CLAUDE.template.md` and `GEMINI.template.md` as single-line wrappers (`@AGENTS.md`)
    *   Added preambles to `AI_CODING_DIRECTIVES.md` and `CODING_STANDARDS.md` clarifying their progressive disclosure role
*   **Alternatives Considered:**
    *   (Rejected) Embed full directives in root file - Exceeds instruction budget
    *   (Rejected) Symlinks between root files - Platform compatibility issues
    *   (Rejected) Tool-specific root files - Violates DRY principle
*   **Consequences:**
    *   (+) Auto-loaded context without manual prompting
    *   (+) Respects instruction budget limits
    *   (+) Single source of truth (`AGENTS.md`) with thin wrappers for other CLIs
    *   (-) Requires Gemini CLI configuration for non-default file name
    *   (-) Progressive disclosure means agents must read additional files for complex tasks

## [2025-12-01] Addition of spec_design.md Template
*   **Context:** `AI_CODING_DIRECTIVES.md` references `design.md` for Mermaid diagrams, but no template existed.
*   **Decision:** Created `coding/templates/spec_design.md` with Mermaid diagram placeholders (flowchart, sequence, state, component).
*   **Consequences:**
    *   (+) Fills gap in template coverage
    *   (+) Standardizes visual documentation approach

## [2025-12-02] Cognitive Mode Separation: Thinking vs. Execution (v4.0)
*   **Context:** AI agents were mixing "What should we build?" (design thinking) with "How do we build it?" (implementation) in a single 215-line directive file. This created cognitive overload and led to premature implementation without proper exploration.
*   **Problem:** 
    *   Agents skipped First Principles decomposition and jumped straight to coding
    *   Complex bugs lacked root cause analysis - agents would iterate blindly
    *   No structured framework for generating and evaluating solution alternatives
    *   `AI_CODING_DIRECTIVES.md` exceeded instruction budget (~215 lines vs. ~150-200 recommended)
*   **Decision:** Split into two distinct cognitive modes:
    *   `THINKING_DIRECTIVES.md` (247 lines) - Exploratory, divergent thinking
    *   `EXECUTION_DIRECTIVES.md` (287 lines) - Convergent, implementation-focused
*   **Alternatives Considered:**
    *   (Rejected) Keep single unified directive - Cognitive overload, exceeded instruction budget
    *   (Rejected) Create three-way split (Explore/Design/Build) - Overhead without clear benefit
    *   (Rejected) Use Phase prefixes (e.g., E0, D0, B0) - Confusing numbering, harder to navigate
*   **Implementation Details:**
    *   Added OODA Stop-Gap to Phase T1-RCA: After 3 failed debugging attempts, assess confidence (0-100%)
    *   Created `spec_problem.md` and `spec_options.md` templates for structured exploration
    *   Updated Progressive Disclosure routing in `AGENTS.md` to route by task type
    *   Preserved all content from `AI_CODING_DIRECTIVES.md` in `EXECUTION_DIRECTIVES.md`
*   **Consequences:**
    *   (+) Clear separation of concerns: "Should we?" vs. "How do we?"
    *   (+) Prevents premature implementation
    *   (+) OODA Stop-Gap prevents infinite debugging loops
    *   (+) Each directive file stays within instruction budget when loaded individually
    *   (+) Forces explicit Consensus Gate before coding begins
    *   (-) Agents must switch between files (mitigated by Progressive Disclosure routing)
    *   (-) Requires v4 migration for existing projects (breaking change)
