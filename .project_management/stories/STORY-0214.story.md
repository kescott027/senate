# STORY-0214: Sprint closeout governance enhancements

## Phase
1

## Context
Sprint closeouts must explicitly report progress toward phased MVP goals and enforce repo hygiene (green PRs, clean main, pruned branches).

## User value
Ensures sprint outcomes are traceable to phase goals and the repo remains clean and merge-safe.

## Acceptance criteria
- [x] Sprint template includes Phase/MVP progress status and repo hygiene confirmation.
- [x] Sprint close-out checklist requires all PRs green before merge and branch cleanup post-merge.
- [x] Project management rules explicitly require these closeout checks.

## Non-functional requirements
- Security: No secret leakage; follow LAW-004 for token handling.
- Reliability: Process updates must be deterministic and auditable.
- Performance: N/A (process).

## Implementation notes
Update both `project_management_skeleton/` and `.project_management/` templates/rules.

## Test plan
- Unit: N/A
- Integration: Manual review of templates/rules
- E2E: N/A

## Observability
- Logs: Audit log entry
- Metrics: N/A
- Traces: N/A

## Rollback plan
Revert template and rules changes.

## Risks / edge cases
- Low

## Definition of Done checklist
- [x] AC met
- [x] Tests added + passing (N/A — process)
- [x] Lint/format/type checks pass (N/A — process)
- [x] Security checks pass (N/A — process)
- [x] Docs updated

## Evidence
- `.project_management/Sprint_TEMPLATE.md`
- `project_management_skeleton/Sprint_TEMPLATE.md`
- `.project_management/Rules.md`
- `project_management_skeleton/Rules.md`
