# STORY-0114: Executive override integration

## Phase
2

## Context
Clarify how executive overrides interact with the normal voting pipeline.

## User value
Constituents and maintainers benefit from executive override integration.

## Acceptance criteria
- [x] Executive override steps are documented and linked from the voting workflow.
- [x] Clear rules define when override supersedes vote outcomes.
- [x] Override records are stored consistently with other decision artifacts.

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
- `executive/README.md`
- `votes/decisions/`
