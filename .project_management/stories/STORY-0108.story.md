# STORY-0108: Clarify executive override process

## Phase
0

## Context
Expand documentation for executive overrides to reduce ambiguity.

## User value
Constituents and maintainers benefit from clarify executive override process.

## Acceptance criteria
- [x] `executive/README.md` clearly describes override workflow.
- [x] Example override records are included or templated.

## Non-functional requirements
- Security: No secret leakage; follow LAW-004 for token handling.
- Reliability: Documentation and scripts must be deterministic and repeatable.
- Performance: N/A (documentation/process).

## Implementation notes
Expanded override workflow documentation and added a template override record.

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
- `executive/README.md`
- `executive/overrides/EXEC-000_template.md`
- PR: https://github.com/tecthulhu/senate/pull/21
