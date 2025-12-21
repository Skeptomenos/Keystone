### 4.4.1. Shadow File Pattern for Sustainable Updates
- **Learning:** Separating framework-managed logic from user-managed logic prevents update conflicts and preserves project-specific wisdom.
- **Mandate:** Always split directives into `.core` and `.custom` variants.
- **Outcome:** Framework can now be updated seamlessly without risk of data loss or customization breakage.

### 4.4.2. Conversational Onboarding (The Wizard)
- **Learning:** A single-file entry point with conversational logic is more effective than static documentation for complex framework setup.
- **Mandate:** Use `INITIATOR.md` as the primary delivery mechanism for framework features.
- **Outcome:** Reduced onboarding time from minutes to seconds.
