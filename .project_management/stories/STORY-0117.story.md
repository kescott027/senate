# STORY-0117: First vote walkthrough

## Phase
2

## Context
Provide a step-by-step example of submitting a valid vote comment.

## User value
Constituents and maintainers benefit from first vote walkthrough.

## Acceptance criteria
- [ ] Walkthrough references the correct vote format from LAW-012.
- [ ] Includes a worked example and how to verify it was counted.
- [ ] Clearly explains vote timing and labels.

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
