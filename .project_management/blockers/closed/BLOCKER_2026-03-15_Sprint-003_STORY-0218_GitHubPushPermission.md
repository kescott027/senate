# BLOCKER-2026-03-15-Sprint-003-STORY-0218-GitHubPushPermission

Status: Closed

## Blocked Story

- Story ID: STORY-0218
- Story title: PR-only main rule governance update
- Sprint: Sprint-003
- Current state: blocked

### Story text

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

## Decision Needed

Provide GitHub credentials or org permissions with write access to `tecthulhu/senate` so the PR branch can be pushed and a PR opened.

## Options and Trade-offs

### Option A
- Summary: Provide a new token with write access to `tecthulhu/senate`, SSO authorized if required.
- Pros: Fastest unblock; explicit scoping.
- Cons: Requires generating and distributing a new token.

### Option B
- Summary: Authorize or elevate the existing token for org write access.
- Pros: Avoids new token creation.
- Cons: Requires org admin action; timing uncertain.

## Constraints

- Dependencies impacted: PR creation and merge for STORY-0218; Sprint-003 progression.
- Security constraints: Token must be least-privilege and protected per LAW-004.
- Performance constraints: N/A.
- Reliability constraints: CI must run and pass before merge.
- Downstream stories affected: All Sprint-003 stories that require PR merges.
- Recommended default option: Option B if org SSO/permissions can be updated quickly; otherwise Option A.

## Unblock Criteria

- [x] Decision approved by required owner
- [x] Decision captured in Decision_Matrix and/or ADR
- [x] PR branch push succeeds
- [x] PR opened and CI checks running

## Decision Log

- 2026-03-15T18:16:18Z tecthulhu.senate.ai-worker-01.ai: blocker opened
- 2026-03-15T20:24:35Z tecthulhu.senate.ai-worker-01.ai: resolved by pushing via SSH key and opening PR #9

## Cross-Document Updates

- [x] `.project_management/Current_Sprint.md`
- [x] `.project_management/sprints/sprint-003.md`
- [x] `.project_management/Project_Sprint_Log.md`
- [x] `.project_management/Decision_Matrix.md`
- [x] `.project_management/state/current_state.json`
- [x] `.project_management/log/story_management_2026-03-15.log`
