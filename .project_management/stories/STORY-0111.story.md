# STORY-0111: Standardize voting lifecycle and decision recording

## Phase
2

## Context
Define how votes are opened, closed, tallied, and recorded as decisions.

## User value
Constituents and maintainers benefit from standardize voting lifecycle and decision recording.

## Acceptance criteria
- [x] Voting-open and voting-closed criteria are defined and documented.
- [x] Decision record format is specified (outcome, tally, quorum, timestamps).
- [x] Decision records are stored in a documented location (e.g., `votes/`).
- [x] Executive override interaction is linked but not duplicated.

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
- [x] AC met
- [x] Tests added + passing (N/A — docs)
- [x] Lint/format/type checks pass (N/A — docs)
- [x] Security checks pass (N/A — docs)
- [x] Docs updated

## Evidence
- `docs/governance/voting_lifecycle.md`
- `templates/decision_record.md`
- `votes/decisions/`
- `votes/README.md`
