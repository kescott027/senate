# STORY-0125: Sprint review rating system

## Phase
1

## Context
Add a structured sprint review rating (0.0–1.0, one decimal) that evaluates adherence to senate laws and sprint intent, and records a running average.

## User value
Constituents and maintainers benefit from sprint review rating system.

## Acceptance criteria
- [ ] Sprint review includes a rating (0.0–1.0, one decimal) and a brief rationale tied to senate laws and sprint goal.
- [ ] Sprint template is updated to include the rating section and running average.
- [ ] An append-only ratings log is created and updated for every sprint closeout.
- [ ] The running average is computed from the log and included in the sprint review.
- [ ] Location and format of the ratings log are documented.

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
- Low

## Definition of Done checklist
- [ ] AC met
- [ ] Tests added + passing
- [ ] Lint/format/type checks pass
- [ ] Security checks pass
- [ ] Docs updated
