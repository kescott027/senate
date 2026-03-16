# STORY-0202: Add example constituent repo

## Phase
1

## Context
Publish a minimal example repo that has been bootstrapped.

## User value
Constituents and maintainers benefit from add example constituent repo.

## Acceptance criteria
- [x] Example repo contains `.project_management/` and `.senate-sync.json`.
- [x] README links back to this repo.

## Non-functional requirements
- Security: No secret leakage; follow LAW-004 for token handling.
- Reliability: Documentation and scripts must be deterministic and repeatable.
- Performance: N/A (documentation/process).

## Implementation notes
Created `tecthulhu/senate-forum` and populated it with the bootstrap scaffold and law sync state.

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
- [x] Tests added + passing (manual verification)
- [x] Lint/format/type checks pass (N/A — docs)
- [x] Security checks pass (N/A — docs)
- [x] Docs updated

## Evidence
- Repo: https://github.com/tecthulhu/senate-forum
- Contains `.project_management/` and `.senate-sync.json` on main.
- README links back to senate repo.
