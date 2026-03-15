# Sprint 000 — Foundation

## Sprint Number

Sprint-000

## Start Date

2026-03-14

## End Date

2026-03-14

## Goal

Validate and stabilize the one-line bootstrap flow and integrity pipeline; ensure laws, skeleton, and guides are consistent and synced.

## Included Stories

- STORY-0001 - Publish one-line bootstrap instruction in README
- STORY-0002 - Maintain bootstrap initiator as the single source of truth
- STORY-0003 - Integrity manifest and verification script
- STORY-0005 - Publish complete PM skeleton
- STORY-0006 - Ensure active laws and sync manifest are consistent
- STORY-0007 - Document the sprint sync protocol
- STORY-0008 - Provide bootstrap guides for new and existing projects
- STORY-0125 - Sprint review rating system
- STORY-0126 - Enable GitHub code scanning (CodeQL)

## Story Status

- STORY-0001: Done. Evidence: README contains single-line initiator instruction and no-web fallback.
- STORY-0002: Done. Evidence: `bootstrap/initiator.md` includes integrity verification and environment detection steps.
- STORY-0003: Done. Evidence: `./bootstrap/regenerate-integrity.sh --check-only` returns OK.
- STORY-0005: Done. Evidence: `project_management_skeleton/` contains required files plus ratings log templates.
- STORY-0006: Done. Evidence: `sync/manifest.json` hashes match active law files.
- STORY-0007: Done. Evidence: `sync/README.md` and `templates/sprint-sync-checklist.md` align; README links present.
- STORY-0008: Done. Evidence: bootstrap guides exist and match initiator routing.
- STORY-0125: Done. Evidence: sprint template updated; ratings log docs created in skeleton and `.project_management/ratings/`.
- STORY-0126: Done. Evidence: CodeQL workflow run succeeded; Code scanning enabled with 0 open alerts.

## Files Touched

- BOOTSTRAP_SENATE.md
- .project_management/**
- .senate-sync.json

## Notes (Architecture/Security)

- Architecture notes: Documentation-first governance; integrity verification is mandatory.
- Security notes: Do not log or embed tokens; follow LAW-004. Code scanning enabled; latest CodeQL run succeeded with 0 open alerts.
- Decision matrix references: .project_management/Decision_Matrix.md

## Test Results

- Unit tests: N/A (docs)
- Integration tests: Manual bootstrap smoke checklist; integrity manifest check
- Load/performance tests: N/A
- Security checks: CodeQL (actions) run succeeded; secret scanning and Dependabot enabled with 0 open alerts

## Review Summary

- What was completed: Sprint-000 foundational governance scope completed; CodeQL enabled and running; ratings log implemented.
- What was deferred: None.
- Risks discovered: Secondary verification gist needs updating when integrity.json changes.
- Debt introduced/resolved: Resolved manifest hash drift; no new debt.

## Sprint Review Rating

- Rating (0.0–1.0, one decimal): 0.8
- Rationale (tie to senate laws + sprint goal): Met LAW-001/LAW-002 planning and LAW-004 security requirements; minor process friction from repo rules and CodeQL configuration retry.
- Running average (from `.project_management/ratings/sprint_ratings.jsonl`): 0.8

## Close-out Checklist

- [x] All done stories have evidence.
- [x] Deferred stories returned to backlog with updated priority.
- [x] Sprint log appended in `Project_Sprint_Log.md`.
- [x] Sprint rating appended in `.project_management/ratings/sprint_ratings.jsonl`.
- [x] `Current_Sprint.md` reset.
- [x] Sprint file moved to `completed_sprints/`.
- [x] Audit log entry appended.

## Retro Notes

- What went well: Sprint scope stayed focused; integrity and security workflows stabilized.
- What did not go well: CodeQL initial configuration mismatch delayed baseline.
- Process changes for next sprint: Pre-check language targets for CodeQL based on repo contents.

## Closure Signature

Closed by: ai

Date: 2026-03-14

Reference: https://github.com/tecthulhu/senate/actions/runs/23095497184
