# STORY-0110: Define bill intake and triage workflow

## Phase
2

## Context
Document a step-by-step process for how proposals are submitted, triaged, scheduled for review, and moved into voting.

## User value
Constituents and maintainers benefit from define bill intake and triage workflow.

## Acceptance criteria
- [ ] A dedicated section (new doc or README section) defines proposal states and required labels.
- [ ] Entry criteria for review and voting are explicit and testable.
- [ ] Workflow references the bill issue templates and LAW-012.
- [ ] Triage expectations (who, when, how) are defined.

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
