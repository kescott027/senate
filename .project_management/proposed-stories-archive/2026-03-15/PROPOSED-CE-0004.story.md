# PROPOSED-CE-0004: CI contract tests with PostgreSQL profile

## Phase
1

## Context
PostgreSQL contract tests are gated by `CONCORD_TEST_DATABASE_URL` and require a running DB. CI should cover both SQLite and PostgreSQL paths.

## User value
Avoid regressions in PostgreSQL adapter and data-path parity.

## Acceptance criteria
- [ ] CI job spins up a PostgreSQL service and runs `tests/contract` with `CONCORD_TEST_DATABASE_URL` set.
- [ ] CI runs both SQLite and PostgreSQL contract tests.
- [ ] Failures are surfaced as required checks.
- [ ] Documentation updated with CI coverage details.

## Non-functional requirements
- Security: DB credentials are ephemeral and scoped to CI.
- Reliability: Deterministic teardown and cleanup.
- Performance: Keep test run time bounded.

## Implementation notes
Use GitHub Actions service container or docker compose profile in CI.

## Test plan
- Unit: N/A
- Integration: Verify CI job passes and fails appropriately.
- E2E: N/A

## Observability
- Logs: CI logs
- Metrics: N/A
- Traces: N/A

## Rollback plan
Disable the CI job and document the reason.

## Risks / edge cases
- Medium

## Definition of Done checklist
- [ ] AC met
- [ ] Tests added + passing
- [ ] Lint/format/type checks pass
- [ ] Security checks pass
- [ ] Docs updated
