# STORY-0011: Integrity CI workflow

## Phase
0

## Context
Ensure integrity checks run automatically on changes.

## User value
Constituents and maintainers benefit from integrity ci workflow.

## Acceptance criteria
- [x] GitHub Actions workflow runs on PRs and pushes to `main`.
- [x] Workflow fails if integrity.json is out of date.
- [x] Auto-regeneration only runs on `main` pushes and commits the updated file.

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
- [x] Tests added + passing (N/A — CI workflow)
- [x] Lint/format/type checks pass (N/A — CI workflow)
- [x] Security checks pass (N/A — CI workflow)
- [x] Docs updated

## Evidence
- `.github/workflows/integrity-check.yml`
