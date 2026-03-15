# STORY-0008: Provide bootstrap guides for new and existing projects

## Phase
1

## Context
Maintain comprehensive guides for both new and existing repos.

## User value
Constituents and maintainers benefit from provide bootstrap guides for new and existing projects.

## Acceptance criteria
- [ ] `project_management_bootstrapping.md` is complete and accurate.
- [ ] `project_management_bootstrapping_existing.md` includes discovery, security baseline, and HITL gates.
- [ ] Initiator references these guides consistently.

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
