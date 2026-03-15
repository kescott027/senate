# STORY-0218: PR-only main rule governance update

## Phase
1

## Context
The governance contract now requires that only the initial repository bootstrap commit may push directly to `main`. All subsequent changes must go through PRs with green CI. This needs to be codified in rules and proposed as a bill.

## User value
Prevents premature or direct pushes to `main`, ensuring consistent review and CI validation.

## Acceptance criteria
- [x] `.project_management/Rules.md` and `project_management_skeleton/Rules.md` include the PR-only main rule.
- [x] Draft bill added to `docs/governance/bills/` and submitted per LAW-012 with issue link recorded.
- [x] Sprint scope and state updated to include this governance story with audit log entry.

## Non-functional requirements
- Security: No secret leakage; follow LAW-004 for token handling.
- Reliability: Governance requirements must be explicit and auditable.
- Performance: N/A (process).

## Implementation notes
Update rules, draft the bill amending LAW-003, and submit it as a GitHub issue.

## Test plan
- Unit: N/A
- Integration: Manual review of rules + bill
- E2E: N/A

## Observability
- Logs: Audit log entry
- Metrics: N/A
- Traces: N/A

## Rollback plan
Revert rule and bill updates.

## Risks / edge cases
- Low

## Definition of Done checklist
- [x] AC met
- [x] Tests added + passing (N/A — process)
- [x] Lint/format/type checks pass (N/A — process)
- [x] Security checks pass (N/A — process)
- [x] Docs updated

## Evidence
- `.project_management/Rules.md`
- `project_management_skeleton/Rules.md`
- `docs/governance/bills/BILL-2026-03-15_amend-law-003_pr-only-main.md`
- Bill issue: https://github.com/tecthulhu/senate/issues/8
