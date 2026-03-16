# STORY-0203: Provide multilingual bootstrap prompts

## Phase
1

## Context
Provide translated bootstrap instructions for non-English teams.

## User value
Constituents and maintainers benefit from provide multilingual bootstrap prompts.

## Acceptance criteria
- [x] Translations include the single-line prompt and no-web fallback.
- [x] Each translation references the same initiator URL.

## Non-functional requirements
- Security: No secret leakage; follow LAW-004 for token handling.
- Reliability: Documentation and scripts must be deterministic and repeatable.
- Performance: N/A (documentation/process).

## Implementation notes
Published translations in a dedicated governance doc and linked it from README.

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
- `docs/governance/bootstrap_translations.md`
- `README.md` (Quick Links)
- PR: https://github.com/tecthulhu/senate/pull/28
