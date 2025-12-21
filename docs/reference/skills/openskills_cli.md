# OpenSkills CLI Reference

> **Source:** [numman-ali/openskills](https://github.com/numman-ali/openskills)
> **Status:** Tooling Reference for Keystone

## 1. Overview
OpenSkills is a CLI tool for managing, creating, and sharing Agent Skills. It provides a standardized way to scaffold and validate skills against the Anthropic specification.

## 2. Key Commands
- `openskills create [name]`: Scaffolds a new skill directory with `SKILL.md` and standard folders.
- `openskills validate [path]`: Checks a skill for spec compliance (frontmatter, naming, description length).
- `openskills list`: Lists discovered skills in the current environment.
- `openskills export [name]`: Packages a skill for sharing (e.g., as a zip for Claude.ai).

## 3. Scaffolding Structure
Standard output of `openskills create`:
```text
my-skill/
├── SKILL.md
├── instructions/
├── scripts/
├── examples/
└── README.md
```

## 4. Use in Keystone
- We can use `openskills` (or its patterns) to ensure that the skills we generate for Keystone are perfectly compliant and portable.
- It serves as a "Linter" for our skill-based capabilities.
