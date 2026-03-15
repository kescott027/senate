# PROPOSED-CE-0003: Concord testbed bootstrap runbook

## Phase
1

## Context
We need a repeatable, isolated testbed workflow for Concord that does not alter the primary repo. Current setup depends on tribal knowledge (Docker profiles, env files, venv).

## User value
Faster, safer local validation and fewer environment-related failures.

## Acceptance criteria
- [ ] A runbook documents isolated clone setup, env file creation, and Docker profiles.
- [ ] Includes clean-up steps to stop outdated containers and remove conflicts.
- [ ] Defines when to use SQLite vs PostgreSQL contract tests.
- [ ] Lists required prerequisites (Docker, Python, network access).

## Non-functional requirements
- Security: No secrets committed; env handling described.
- Reliability: Steps are deterministic and reproducible.
- Performance: N/A.

## Implementation notes
Document commands like `make dev-install`, `make validate-local`, `docker compose --profile postgres ...`.

## Test plan
- Unit: N/A
- Integration: Follow runbook end-to-end on clean machine
- E2E: N/A

## Observability
- Logs: N/A
- Metrics: N/A
- Traces: N/A

## Rollback plan
Revert doc changes if incorrect.

## Risks / edge cases
- Low

## Definition of Done checklist
- [ ] AC met
- [ ] Tests added + passing
- [ ] Lint/format/type checks pass
- [ ] Security checks pass
- [ ] Docs updated
