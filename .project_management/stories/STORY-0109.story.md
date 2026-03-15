# STORY-0109: Add onboarding FAQ

## Phase
1

## Context
Provide a concise FAQ addressing common bootstrap issues.

## User value
Constituents and maintainers benefit from add onboarding faq.

## Acceptance criteria
- [x] FAQ covers integrity failures, missing tokens, and `.project_management/` errors.
- [x] Linked from README.

## Non-functional requirements
- Security: No secret leakage; follow LAW-004 for token handling.
- Reliability: Documentation and scripts must be deterministic and repeatable.
- Performance: N/A (documentation/process).

## Implementation notes
Added onboarding FAQ and linked it from README quick links.

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
- [x] AC met
- [x] Tests added + passing (N/A — docs)
- [x] Lint/format/type checks pass (N/A — docs)
- [x] Security checks pass (N/A — docs)
- [x] Docs updated

## Evidence
- `docs/governance/onboarding_faq.md`
- `README.md` (Quick Links)
- PR: https://github.com/tecthulhu/senate/pull/21
