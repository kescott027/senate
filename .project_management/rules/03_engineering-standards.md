---
law_id: LAW-003
title: Engineering Standards
status: active
enacted: "2026-03-13"
last_amended: null
origin_bill: null
sponsors: []
---

# LAW-003: Engineering Standards

## Requirements

- **CI must run on every PR.** No PR may be merged without a passing CI pipeline.
- **Lint + format enforced.** Code style is automated, not debated. Linting and formatting checks must pass in CI.
- **Tests required for logic changes.** Any PR that modifies business logic must include corresponding tests.
- **No TODOs without linked backlog item and owner.** Every TODO comment in code must reference a story or backlog item ID and have an assigned owner.
- **Dependencies must be pinned/locked.** All dependency versions must be locked via a lockfile. No floating versions in production.
- **Error handling: no silent failures.** All errors must be logged with correlation IDs. Swallowed exceptions are prohibited.
- **API contracts documented and versioned.** Where applicable, APIs must have documented contracts (OpenAPI, protobuf, etc.) and follow a versioning strategy.
