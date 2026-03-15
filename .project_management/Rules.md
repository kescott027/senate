# Project Management Rules

## Scope

These rules govern all planning, sprint execution, and backlog changes under `.project_management/`.

Canonical execution contract: `AI_ENTRYPOINT.md`.

## Source-of-Truth Rules

- `.project_management/Backlog.md` is authoritative for planned work.
- `.project_management/Current_Sprint.md` is authoritative for active sprint scope.
- Completed sprint files are authoritative for completed work evidence.
- `.project_management/Decision_Matrix.md` is authoritative for architectural/security/storage decisions.

## Non-Negotiable Quality Rules

- No story may enter sprint without acceptance criteria and dependencies.
- No story may be marked done without evidence (tests, docs, code refs).
- Security-impacting changes require explicit threat/risk note in sprint file.
- Architecture-impacting changes require a `Decision_Matrix.md` entry before implementation.
- Production/pre-prod readiness claims must include benchmark or test evidence.
- All PRs must be green before merge; no merges before all required checks complete.
- After merges, stale branches must be pruned and main must be clean.

## Sprint Lifecycle Rules

1. Plan sprint from highest priority stories only.
2. Freeze sprint scope after kickoff unless formally changed and logged.
3. Record daily progress and blockers in sprint notes.
4. Close sprint only when close checklist is complete.
5. Move closed sprint file to `.project_management/completed_sprints/`.

## Definition of Done (DoD)

A story is done only if all are true:

- Acceptance criteria are met.
- Tests are added/updated and passing.
- Documentation is updated where behavior/ops changed.
- Evidence is recorded in sprint file.
- Backlog state is updated.
- Audit log entry is appended the same day.

## Required Quality Checks per Sprint

- Unit/integration/regression test pass summary.
- Security checks (auth, secrets, dependency risk, endpoint protection).
- Performance checks for touched critical paths.
- Operational checks (health, logging, rollback, observability impact).

## Sprint Close Checklist

- [ ] Included stories marked Done/Not Done with rationale.
- [ ] Evidence links captured (commit hashes, PRs, reports, docs).
- [ ] Risks/debt updated.
- [ ] Phase/MVP progress status documented.
- [ ] `Project_Sprint_Log.md` appended.
- [ ] `Current_Sprint.md` reset for next sprint.
- [ ] Sprint file moved to `completed_sprints/`.
- [ ] Audit log entry appended.
- [ ] All PRs green; no merges before checks complete.
- [ ] Stale branches pruned; main is clean.

## Phase-End Assessment Requirements

When a phase is completed, a phase-end report is mandatory before moving to the next phase. The report must cover:

- Testing (including a 90% coverage target or explicit waiver with rationale).
- Architectural best practices (current state, gaps, and upgrades needed).
- Code quality assurance (beyond test pass status).
- Trueness to intent or HIL approval for any intent changes.
- Application gap analysis.
- Development community friendliness assessment.
- Critical edge cases assessment.
- Strict security adherence review.
- Cohesion of principles, design, and implementation.
- Backlog grooming and reprioritization for next phase.
- HIL notification with report link.

## Every 3 Sprints: Architecture Integrity Review

Every third sprint must include:

- Dependency and interface contract review.
- Data model and storage consistency review.
- AuthN/AuthZ boundary review.
- Performance trend review against agreed SLOs.
- Technical debt reprioritization with explicit owners.

## Feature Flag Expectations (if applicable)

- New risky behavior should be feature-flagged when practical.
- Flags must have owner, default state, rollback behavior, and removal date.
- Pre-prod and production flag states must be explicitly documented.

## No Log Entry, No Change

Any change to the following requires same-day audit log entry in `.project_management/log/story_management_YYYY-MM-DD.log`:

- `Backlog.md`
- `Current_Sprint.md`
- `Decision_Matrix.md`
- `Project_Sprint_Log.md`
- Sprint files
- `Rules.md`

If a change is unlogged, it is considered invalid and must be corrected with an appended `change_type="correct"` entry.

## State Sync Requirement

Any change to sprint scope or blocked status must update `.project_management/state/current_state.json` in the same change set.

## Blocker Management

- Blockers must follow `.project_management/rules/BLOCKER_MANAGEMENT_RULES.md`.
- Open blockers are tracked in `.project_management/blockers/active/`; resolved blockers move to `.project_management/blockers/closed/`.
- Every blocker open/close event requires same-day audit logging and updates to sprint/state artifacts.

## Manual Enforcement Until CI (if unavailable)

If CI checks are unavailable, reviewers must verify that any PR modifying `.project_management/*.md` also modifies a matching `story_management_*.log` file before merge.

## Senate Governance Integration

- At sprint start, sync with `kescott027/senate` laws per the sprint-sync protocol.
- Senate laws supersede local project rules where they conflict.
- Governance gaps or rule change proposals must be filed as bills on the senate repo.
- See LAW-010 (Continuous Improvement) and LAW-012 (Bill Submission Process).
