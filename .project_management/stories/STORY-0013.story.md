# STORY-0013: Membership onboarding guidance

## Phase
1

## Context
Define how new projects register as constituents in `MEMBERSHIP.md`.

## User value
Constituents and maintainers benefit from membership onboarding guidance.

## Acceptance criteria
- [x] README (or separate doc) explains how to request membership updates.
- [x] Provide a minimal template or process (issue or PR) for adding a member.
- [x] Guidance includes when to sync laws and update `.senate-sync.json`.

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
- [x] Tests added + passing (N/A — docs-only)
- [x] Lint/format/type checks pass (N/A — docs-only)
- [x] Security checks pass (N/A — docs-only)
- [x] Docs updated

## Evidence
- `docs/governance/membership_onboarding.md`
- `MEMBERSHIP.md`
