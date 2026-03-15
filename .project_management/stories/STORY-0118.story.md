# STORY-0118: Constituent identity canonicalization

## Phase
2

## Context
Define the canonical project identifier to use in votes to avoid mismatched naming.

## User value
Constituents and maintainers benefit from constituent identity canonicalization.

## Acceptance criteria
- [ ] Canonical format is documented (e.g., `org/repo`).
- [ ] `MEMBERSHIP.md` entries align with the canonical format.
- [ ] Voting instructions reference the canonical format.

## Non-functional requirements
- Security: No secret leakage; follow LAW-004 for token handling.
- Reliability: Documentation and scripts must be deterministic and repeatable.
- Performance: N/A (documentation/process).

## Implementation notes
See BOOTSTRAP_SENATE.md for detailed context and acceptance criteria.

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
- Medium

## Definition of Done checklist
- [ ] AC met
- [ ] Tests added + passing
- [ ] Lint/format/type checks pass
- [ ] Security checks pass
- [ ] Docs updated
