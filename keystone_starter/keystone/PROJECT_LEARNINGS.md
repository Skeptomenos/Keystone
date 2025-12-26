# Project Learnings & Constraints

> **Telegraphic style:** Concise, bullet points, no grammar fluff.

---

## 1. Project Constraints (Invariants)

- [e.g., Target bundle size < 150MB]
- [e.g., API calls must route through proxy for security]
- [e.g., Local-first architecture; no cloud processing]

---

## 2. Patterns (The "How")

- [Successful implementation patterns worth repeating]
- [e.g., Stdin/Stdout IPC for sidecar processes]
- [e.g., Feature flags for major refactors]

---

## 3. Anti-Patterns (What Failed)

- [Specific failures to avoid in this codebase]
- [e.g., Hardcoded ports → Use IPC instead]
- [e.g., Blocking I/O → Use async/background workers]

---

## 4. Technical Notes

- [Deep technical context or library quirks]
- [e.g., PyInstaller on ARM64 requires `strip=False`]

---

## 5. Session-Specific Learnings

- **YYYY-MM-DD:** [Concise insight from a specific task]
