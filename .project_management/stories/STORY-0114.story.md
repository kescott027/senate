# STORY-0114: Executive override integration

## Phase
2

## Context
Clarify how executive overrides interact with the normal voting pipeline.

## User value
Constituents and maintainers benefit from executive override integration.

## Acceptance criteria
- [ ] Executive override steps are documented and linked from the voting workflow.
- [ ] Clear rules define when override supersedes vote outcomes.
- [ ] Override records are stored consistently with other decision artifacts.

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
