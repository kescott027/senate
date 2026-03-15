# Sprint 003 — Law Proposal + Voting Core

## Sprint Number

Sprint-003

## Start Date

2026-03-15

## End Date

TBD

## Goal

Define the core proposal intake and voting workflow, including decision recording and executive override integration.

## Included Stories

- STORY-0110 - Define bill intake and triage workflow
- STORY-0111 - Standardize voting lifecycle and decision recording
- STORY-0112 - Publish vote tally procedure and archival format
- STORY-0113 - Update contributor guidance for proposing and voting
- STORY-0114 - Executive override integration
- STORY-0218 - PR-only main rule governance update

## Story Status

- STORY-0110: Done.
- STORY-0111: Done.
- STORY-0112: Done.
- STORY-0113: Done.
- STORY-0114: Done.
- STORY-0218: Done — PR #9 merged.

## Blockers

None.

## Files Touched

- docs/governance/proposal_intake_workflow.md
- docs/governance/voting_lifecycle.md
- docs/governance/contributor_guide.md
- templates/vote_tally.md
- templates/decision_record.md
- votes/README.md
- votes/decisions/.gitkeep
- votes/tallies/.gitkeep
- executive/README.md
- README.md

## Notes (Architecture/Security)

- Architecture notes: Governance workflow documentation and artifact storage.
- Security notes: Ensure voting workflow does not weaken LAW-004 requirements.
- Decision matrix references: .project_management/Decision_Matrix.md

## Test Results

- Unit tests: N/A (docs)
- Integration tests: Manual verification of workflow documentation
- Load/performance tests: N/A
- Security checks: N/A (docs)

## Review Summary

- What was completed: TBD
- What was deferred: TBD
- Risks discovered: TBD
- Debt introduced/resolved: TBD

## Phase/MVP Progress

- Current phase: Phase 2 (Production readiness)
- Phase goals status (on-track / at-risk / blocked): TBD
- Critical path status: Law proposal + voting system definition
- Phase gate checklist status (if phase-ending): N/A
- Phase-end report link (if phase-ending): N/A

## Sprint Review Rating

- Rating (0.0–1.0, one decimal):
- Rationale (tie to senate laws + sprint goal):
- Running average (from `.project_management/ratings/sprint_ratings.jsonl`):

## Close-out Checklist

- [ ] All done stories have evidence.
- [ ] Deferred stories returned to backlog with updated priority.
- [ ] Phase/MVP progress status documented.
- [ ] Sprint log appended in `Project_Sprint_Log.md`.
- [ ] Sprint rating appended in `.project_management/ratings/sprint_ratings.jsonl`.
- [ ] `Current_Sprint.md` reset.
- [ ] Sprint file moved to `completed_sprints/`.
- [ ] Audit log entry appended.
- [ ] All PRs green; no merges before checks complete.
- [ ] Stale branches pruned; main is clean.

## Retro Notes

- What went well:
- What did not go well:
- Process changes for next sprint:

## Closure Signature

Closed by: <name_or_system>

Date: YYYY-MM-DD

Reference: <commit_or_pr_or_ticket>
