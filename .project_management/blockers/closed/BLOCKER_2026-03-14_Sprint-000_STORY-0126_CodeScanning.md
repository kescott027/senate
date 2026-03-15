# Blocker: Enable GitHub Code Scanning (CodeQL)

Status: Closed
Opened: 2026-03-14
Closed: 2026-03-14
Closed: 2026-03-14
Sprint: Sprint-000
Story ID: STORY-0126

## Blocked Story (Full Text)

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


## Decision Needed

Approve enabling GitHub Code Scanning (CodeQL) for the senate repository.

## Options

1. Enable CodeQL now (recommended)
2. Defer enablement to a later sprint
3. Decline enablement (requires ADR with expiry per LAW-004)

## Recommended Default Option

Option 1: Enable CodeQL now.

## Constraints / Considerations

- LAW-004 requires automated security scanning.
- Enabling CodeQL is a security posture change and requires HITL approval.
- Requires GitHub repository admin permissions.

## Dependencies Impacted

- STORY-0126 cannot complete until approval is granted.
- Security baseline remains incomplete without CodeQL.

## Unblock Criteria

- Explicit HITL approval to enable CodeQL.
- Confirmation that CodeQL is enabled and a baseline scan has run.

## Decision Log

- 2026-03-14: Blocker opened pending HITL approval.
- 2026-03-14: HITL approved. CodeQL workflow added; baseline scan pending first run.
- 2026-03-14: HITL approved. CodeQL workflow added; baseline scan pending first run.
