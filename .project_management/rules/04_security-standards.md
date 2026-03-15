---
law_id: LAW-004
title: Security Standards
status: active
enacted: "2026-03-13"
last_amended: null
origin_bill: null
sponsors: []
---

# LAW-004: Security Standards

## Requirements

- **Secrets scanning required.** All repositories must have automated secrets scanning enabled to prevent accidental credential exposure.
- **Dependency scanning required.** Automated scanning for known vulnerabilities in dependencies must be active and run in CI.
- **Principle of least privilege for tokens/roles.** All tokens, API keys, and IAM roles must be scoped to the minimum permissions necessary.
- **Input validation for all externally supplied data.** Every input from users, APIs, or external systems must be validated before processing.
- **Authentication required for non-public actions.** Any action that modifies state or accesses non-public data must require authentication.
- **Audit logging for privileged operations.** All privileged operations (admin actions, data access, configuration changes) must produce immutable audit log entries.
- **Security exceptions require ADR + expiry date.** Any deviation from these standards must be documented in an Architecture Decision Record with a clear expiry date for revisiting the exception.
