# STORY-0002: Maintain bootstrap initiator as the single source of truth

## Phase
1

## Context
Ensure `bootstrap/initiator.md` contains the full, authoritative bootstrap workflow with integrity verification and environment detection.

## User value
Constituents and maintainers benefit from maintain bootstrap initiator as the single source of truth.

## Acceptance criteria
- [ ] Initiator includes integrity verification (primary and secondary).
- [ ] Initiator includes environment detection for new/existing/upgrade/empty.
- [ ] Initiator routes to the correct bootstrap guide based on project type.

## Non-functional requirements
- Security: No secret leakage; follow LAW-004 for token handling.
- Reliability: Documentation and scripts must be deterministic and repeatable.
- Performance: N/A (documentation/process).

## Implementation notes
The initiator is already present; perform consistency review against guides.

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
