---
law_id: LAW-006
title: Release Standards
status: active
enacted: "2026-03-13"
last_amended: null
origin_bill: null
sponsors: []
---

# LAW-006: Release Standards

## Requirements

- **Versioning strategy must be defined in an ADR.** Each project must document its versioning approach (semver, calver, etc.) in an Architecture Decision Record.
- **Release pipeline must produce reproducible artifacts.** Given the same source commit, the build pipeline must produce identical artifacts.
- **Rollback steps must be documented for production.** Every production release must include documented rollback procedures that can be executed without the original release engineer.
- **Release notes required.** Every release must include release notes summarizing changes. Automated generation from PR labels is preferred where possible.
