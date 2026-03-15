# STORY-0012: Bootstrap smoke test checklist

## Phase
1

## Context
Create a repeatable manual test checklist for the one-line bootstrap flow.

## User value
Constituents and maintainers benefit from bootstrap smoke test checklist.

## Acceptance criteria
- [x] Checklist covers empty repo, new repo, and existing repo flows.
- [x] Checklist verifies integrity checks and correct guide routing.
- [x] Checklist references expected artifacts in `.project_management/`.

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
- `docs/bootstrap_smoke_checklist.md`
