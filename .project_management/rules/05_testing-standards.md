---
law_id: LAW-005
title: Testing Standards
status: active
enacted: "2026-03-13"
last_amended: null
origin_bill: null
sponsors: []
---

# LAW-005: Testing Standards

## Minimum Test Requirements

- **Unit tests for core logic.** All core business logic must have unit test coverage.
- **Integration tests for chat-to-artifact-to-repo flow.** End-to-end workflows that span from chat interaction through artifact generation to repository changes must have integration tests.
- **Policy validation tests for backlog/doc schemas.** The structure and content of backlog items and documentation must be validated by automated tests against their required schemas.

## CI Enforcement

CI must fail if tests are missing for new modules. This applies within reason — trivial configuration files or static assets may be exempt, but any module containing logic must have tests.
