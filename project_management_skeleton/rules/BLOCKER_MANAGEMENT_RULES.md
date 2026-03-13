# Blocker Management Rules

## Purpose
Define the required process for documenting, tracking, and closing blockers in accelerated sprint execution.

Canonical sprint path convention in this repository:
- Active sprint files live under `.project_management/sprints/` (for example `sprint-000.md`).

## Required Directory Structure
- `.project_management/blockers/active/`
  - Unresolved blockers only.
- `.project_management/blockers/closed/`
  - Resolved/unblocked blockers only.
- `.project_management/blockers/README.md`
  - Naming and folder conventions.

## Required Blocker File Creation Rule
For every blocker point, create one blocker document in `.project_management/blockers/active/`.

Required filename format:
- `BLOCKER_<YYYY-MM-DD>_Sprint-<NNN>_STORY-<NNNN>_<ShortName>.md`

Filename notes:
- `<ShortName>` must be lowercase kebab-case.
- Use ASCII letters, numbers, and hyphens only.

## Required Blocker Content
Every blocker document must include:
- Full blocked story text and story ID.
- Exact decision needed or problem to solve.
- Architectural trade-offs for each viable option.
- Critical decision data:
  - dependencies impacted
  - security/performance/reliability constraints
  - downstream stories affected
  - recommended default option (if applicable)
- Explicit unblock criteria.
- Decision log with timestamps.
- Links to related ADR or `Decision_Matrix.md` row when applicable.

## Status Handling Rules
- Active blocker:
  - File is in `blockers/active/`
  - `Status: Active` in document.
  - Current sprint may be marked `Blocked (Decision Required)`.
- Closed blocker:
  - Update document `Status: Closed`.
  - Add decision timestamp and chosen option.
  - Move file to `blockers/closed/`.
  - Update `Current_Sprint.md`, sprint file, and `Decision_Matrix.md`.

## Mandatory Cross-Document Updates
When a blocker opens or closes, update:
- `.project_management/Current_Sprint.md`
- current sprint file (e.g., `.project_management/sprints/sprint-000.md`)
- `.project_management/Project_Sprint_Log.md`
- `.project_management/Decision_Matrix.md`
- `.project_management/state/current_state.json`
- `.project_management/log/story_management_YYYY-MM-DD.log`

## Closure Procedure
1. Record approved decision in blocker file.
2. Record approved decision in `Decision_Matrix.md`.
3. Mark blocker document status closed.
4. Move blocker document to `blockers/closed/`.
5. Resume blocked sprint and update timestamps/status.

## Auditability Rule
No blocker may be considered resolved unless the blocker file has been moved to `blockers/closed/` and references the final decision.

## Human-In-The-Loop Rule

If blocker resolution requires any of the following, set `pending_hitl_gate` in `.project_management/state/current_state.json` and stop autonomous execution:
- security posture change
- new external integration
- production deployment
- policy waiver
