# Implementation Plan: Anamnesis Zero-Friction Refactor

## Overview

This plan outlines the refactor of the Anamnesis framework to reduce onboarding friction, enable intelligent retrofitting of existing projects, and implement a sustainable update mechanism.

---

## Phase 1: The Initiator (Quick Win)
**Goal:** Enable users to set up Anamnesis in seconds.

- **TASK-001: Create INITIATOR.md Template**
    - Create a single-file entry point that contains instructions for the AI to handle the setup process.
- **TASK-002: Embed Minimal Viable Anamnesis (MVA) Templates**
    - Embed essential templates directly in `INITIATOR.md` to allow for immediate setup without external dependencies.
- **TASK-003: Implement New Project Design Thinking Flow**
    - Add instructions for the AI to guide users through the initial ideation and MVP scoping phases.

---

## Phase 2: The Archaeologist (Retrofit)
**Goal:** Automatically map existing projects to the Anamnesis framework.

- **TASK-004: Implement Project Discovery & Mapping Logic**
    - Develop the "Scan -> Map -> Cite -> Spec" workflow.
    - AI scans the codebase and generates a `DISCOVERY.md` map of its findings.
- **TASK-005: Implement Source Attribution Protocol**
    - Ensure all generated requirements cite specific source files and lines as evidence.
- **TASK-006: Implement Architecture Reality Check**
    - Generate Mermaid diagrams of the *current* state for user verification before generating new designs.

---

## Phase 3: The Weaver (Smart Updates)
**Goal:** Enable framework updates without losing project-specific customizations.

- **TASK-007: Implement Shadow File Architecture**
    - Split directives into `.core.md` (framework) and `.custom.md` (user).
    - Update `AGENTS.md` to instruct AI to read both, with `.custom` taking precedence.
- **TASK-008: Implement Semantic Protocol Versioning**
    - Add versioning to Markdown sections to prevent incompatible updates.
- **TASK-009: Implement Dry-Run Diff**
    - Generate `MIGRATION_PREVIEW.md` to show users exactly what will change before applying an update.

---

## Phase 4: Integration & Documentation
**Goal:** Finalize the v4.4 release.

- **TASK-010: Update AGENTS.md for Zero-Friction Model**
    - Ensure the root entry point supports the new wizard and shadow files.
- **TASK-011: Update MIGRATION.md for v4.4**
    - Document the transition and provide clear instructions for existing users.

---

## Risk Mitigation Strategy

### Retrofit Risks
- **Hallucination:** Mitigated by **Source Attribution** (must cite code).
- **Context Blindness:** Mitigated by **Discovery Map** (user approves the scan).
- **Architecture Drift:** Mitigated by **Reality Check** (user confirms current state).

### Update Risks
- **Customization Loss:** Mitigated by **Shadow File Pattern** (separate core/custom).
- **Breaking Changes:** Mitigated by **Semantic Versioning**.
- **Update Anxiety:** Mitigated by **Dry-Run Diff**.

---

## Effort & Impact Summary

| Component | Effort | Impact | Risk |
| :--- | :--- | :--- | :--- |
| **INITIATOR.md** | Low | Extreme | Low |
| **Retrofit Engine** | High | High | Medium |
| **Smart Updates** | Medium | High | Low |
