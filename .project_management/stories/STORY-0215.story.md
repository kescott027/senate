# STORY-0215: Phase-end assessment framework

## Phase
1

## Context
Phase transitions require a structured assessment covering testing, architecture, code quality, intent alignment, gap analysis, community friendliness, edge cases, security, cohesion, and backlog reprioritization.

## User value
Prevents moving to the next phase without evidence-backed readiness and governance alignment.

## Acceptance criteria
- [x] Phase-end report template exists with required assessment sections (including 90% coverage target) and HIL notification step.
- [x] Phase-end reports location and naming are documented.
- [x] Project management rules require phase-end report completion before phase progression.
- [x] Sprint template references phase-end report when closing a phase.

## Non-functional requirements
- Security: No secret leakage; follow LAW-004 for token handling.
- Reliability: Template is deterministic and auditable.
- Performance: N/A (process).

## Implementation notes
Create template under `docs/governance/` and update rules/templates accordingly.

## Test plan
- Unit: N/A
- Integration: Manual verification of template/rules
- E2E: N/A

## Observability
- Logs: Audit log entry
- Metrics: N/A
- Traces: N/A

## Rollback plan
Revert added templates and rules changes.

## Risks / edge cases
- Medium

## Definition of Done checklist
- [x] AC met
- [x] Tests added + passing (N/A — process)
- [x] Lint/format/type checks pass (N/A — process)
- [x] Security checks pass (N/A — process)
- [x] Docs updated

## Evidence
- `docs/governance/phase_end_report_template.md`
- `docs/governance/phase_end_reports/README.md`
- `.project_management/Rules.md`
- `project_management_skeleton/Rules.md`
- `.project_management/Sprint_TEMPLATE.md`
- `project_management_skeleton/Sprint_TEMPLATE.md`
