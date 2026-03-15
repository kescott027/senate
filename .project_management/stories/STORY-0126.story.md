# STORY-0126: Enable GitHub code scanning (CodeQL)

## Phase
0

## Context
Enable GitHub code scanning for the senate repo to satisfy LAW-004 security standards.

## User value
Constituents and maintainers benefit from enable github code scanning (codeql).

## Acceptance criteria
- [ ] Code scanning is enabled in GitHub security settings for this repo.
- [ ] A baseline scan completes with results visible in GitHub.
- [ ] Any alerts are triaged or captured as backlog items.
- [ ] Change is logged with HITL approval evidence.

## Non-functional requirements
- Security: No secret leakage; follow LAW-004 for token handling.
- Reliability: Documentation and scripts must be deterministic and repeatable.
- Performance: N/A (documentation/process).

## Implementation notes
Requires HITL approval before enabling security posture changes.

## Test plan
- Unit: N/A (docs/process)
- Integration: Manual verification of referenced files/steps
- E2E: If applicable, run end-to-end bootstrap smoke checklist

## Observability
- Logs: N/A (documentation)
- Metrics: N/A
- Traces: N/A

## Rollback plan
Revert the changes to restore prior governance documentation.

## Risks / edge cases
- High

## Definition of Done checklist
- [ ] AC met
- [ ] Tests added + passing
- [ ] Lint/format/type checks pass
- [ ] Security checks pass
- [ ] Docs updated
