# Problem Statement

## Core Problem

AI-assisted coding suffers from four fundamental issues:

1. **Amnesia** - AI loses context between sessions
2. **Hallucination** - AI generates plausible but incorrect solutions
3. **Vibe Coding** - Proceeding without explicit approval leads to unwanted changes
4. **Monolithic Code** - Complex features become unmanageable blobs
5. **Friction** - Setting up and updating the framework is manual and error-prone

## Impact

Without a framework or with a high-friction one:
- Developers repeat context every session
- AI confidently builds wrong solutions
- Code quality degrades over time
- Technical debt accumulates rapidly
- Users abandon the framework due to setup complexity

## Success Criteria

A solution must:
- Persist state across sessions
- Ground AI in specifications before implementation
- Require explicit consensus before changes
- Decompose work into atomic, verifiable units
- **Zero-Friction Setup:** Initialize in seconds with a single file.
- **Retrofit Capability:** Automatically map existing projects to Anamnesis.
- **Sustainable Updates:** Update framework without losing customizations.
