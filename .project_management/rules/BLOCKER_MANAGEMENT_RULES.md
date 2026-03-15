---
law_id: LAW-011
title: Blocker Management
status: active
enacted: "2026-03-13"
last_amended: null
origin_bill: null
sponsors: []
---

# LAW-011: Blocker Management

## Required Directory Structure

Every constituent project must maintain:

- `.project_management/blockers/active/` — Unresolved blockers only
- `.project_management/blockers/closed/` — Resolved blockers only

## Required Blocker File Creation Rule

For every blocker, create one document in `blockers/active/`.

Filename format: `BLOCKER_<YYYY-MM-DD>_Sprint-<NNN>_STORY-<NNNN>_<ShortName>.md`

## Required Blocker Content

Each blocker file must include:

- Full blocked story text and story ID
- Exact decision needed
- Architectural trade-offs for each option
- Dependencies impacted, security/performance/reliability constraints, downstream stories affected
- Recommended default option
- Explicit unblock criteria
- Decision log with timestamps

## Status Handling

- **Active**: File resides in `blockers/active/`, Status field is `Active`
- **Closed**: Update Status field to `Closed`, add decision timestamp, move file to `blockers/closed/`, update cross-documents

## Mandatory Cross-Document Updates

When a blocker opens or closes, update all of the following:

- `Current_Sprint.md`
- The relevant sprint file
- `Project_Sprint_Log.md`
- `Decision_Matrix.md`
- `current_state.json`
- Audit log

## Closure Procedure

1. Record decision in blocker file
2. Record in `Decision_Matrix.md`
3. Mark status as closed
4. Move file to `blockers/closed/`
5. Resume sprint execution

## Human-In-The-Loop Rule

If blocker resolution requires any of the following, set `pending_hitl_gate` in `current_state.json` and stop autonomous execution immediately:

- Security posture change
- New external integration
- Production deployment
- Policy waiver
