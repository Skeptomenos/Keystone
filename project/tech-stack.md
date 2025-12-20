# Tech Stack

> **Purpose:** Approved tools and libraries for this project. Check here before adding dependencies.
> **Rule:** If not listed here, ask before adding. Document reason when adding new tools.

---

## Languages

- **Markdown:** Primary format for all framework files and state.
- **Mermaid.js:** For architectural diagrams and reality checks.
- **Bash:** For automation scripts and installation.

## Frameworks

- **Anamnesis v4.4 (Zero-Friction):** The framework being developed.

## Architecture Patterns

- **Shadow Files:** Separation of `.core.md` (framework) and `.custom.md` (user).
- **Spec-Driven Development (SDD):** Requirements-first implementation.
- **OODA Loop:** Observe, Orient, Decide, Act for debugging and recovery.
- **Source Attribution:** Linking specs to source code evidence.

## Development Tools

- **OpenCode:** Primary AI CLI for development.
- **Git:** Version control and migration tracking.
- **GitHub API:** For dynamic template fetching.

---

## Adding New Dependencies

Before adding a new dependency, verify:

1. **Is it maintained?** — Last commit < 6 months ago
2. **Is it widely used?** — Reasonable GitHub stars/downloads
3. **Is it necessary?** — Can we achieve this with existing tools?
4. **Size impact?** — Consider bundle size for client-side code

When adding, document:
- What it's for
- Why this one over alternatives
- Date added
