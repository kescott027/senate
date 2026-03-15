# STORY-0010: Local laws template for constituents

## Phase
1

## Context
Provide a clear template for `local-laws/` in member repos.

## User value
Constituents and maintainers benefit from local laws template for constituents.

## Acceptance criteria
- [x] `templates/local-laws-readme.md` exists and documents format and conflict rules.
- [x] Bootstrap guides reference local law creation when needed.

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
- [x] AC met
- [x] Tests added + passing (N/A — docs-only)
- [x] Lint/format/type checks pass (N/A — docs-only)
- [x] Security checks pass (N/A — docs-only)
- [x] Docs updated

## Evidence
- `templates/local-laws-readme.md`
- `project_management_bootstrapping.md` (Step 3.3)
- `project_management_bootstrapping_existing.md` (Step 4.1)
