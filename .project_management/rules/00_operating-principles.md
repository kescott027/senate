---
law_id: LAW-000
title: Operating Principles
status: active
enacted: "2026-03-13"
last_amended: null
origin_bill: null
sponsors: []
---

# LAW-000: Operating Principles

These principles govern all work within constituent projects of the senate.

## Principles

1. **Git is source of truth.** No "hidden state" outside the repo for requirements, decisions, or backlog. All project state must be tracked in version-controlled files.

2. **All changes happen via PRs.** No direct commits to protected branches. Every change must go through a pull request with appropriate review.

3. **Security and quality are default.** If something is skipped, it must be explicitly justified and time-boxed. Exceptions require an ADR documenting the rationale and an expiry date for revisiting.

4. **Small batches.** Prefer frequent, reviewable PRs. Large, monolithic changes increase risk and reduce reviewability.

5. **Evidence-driven.** Every claim of completion links to tests, logs, screenshots, or reproducible steps. "It works on my machine" is not evidence.

6. **Human approval gates for sensitive actions.** Security posture changes, deployments, and new integrations require explicit human approval before proceeding.
