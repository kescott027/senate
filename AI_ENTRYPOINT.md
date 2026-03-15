# AI_ENTRYPOINT

## Purpose
This document orients AI agents to the Senate repository governance, current sprint, and execution constraints.

## Project Scope
- Workspace root: /home/tecthulhu/tecthulhu/senate
- Primary repo: this repository
- Project management path: .project_management/

## Quick Start Checklist
1. Read `CONSTITUTION.md` and `laws/active/` for governance context.
2. Read `.project_management/Rules.md` and `.project_management/rules/`.
3. Check `.project_management/state/current_state.json`.
4. Read `.project_management/Current_Sprint.md` and `sprints/sprint-000.md`.
5. Review story files in `.project_management/stories/` for active stories.
6. Review `docs/security/scan-findings.md` and `docs/architecture/summary.md`.

## Rules and Governance
- Rules index: `.project_management/Rules.md`
- Senate laws (local copies): `.project_management/rules/`
- Blocker rules: `.project_management/rules/BLOCKER_MANAGEMENT_RULES.md`

## Senate Governance
- Senate repo: `kescott027/senate` (this repo)
- Membership: `MEMBERSHIP.md`
- Sync protocol: `sync/README.md`
- Local sync state: `.senate-sync.json`

## GitHub API Access
- Token file: `~/.github_tokens_secure/.senate_tecthulhu_token` (do not echo).
- Scopes: If API actions are required, use least-privilege scopes.
- Useful endpoints: Issues, code/secret/dependabot alerts for constituent repos.

## Current Sprint
- Sprint: Sprint-001 (not yet planned)
- Goal: TBD
- Active stories: none

## In-Progress Work
- Sprint-000 closed. See `.project_management/completed_sprints/sprint-000.md`.

## Change Management Requirements
- Append audit log entries in `.project_management/log/story_management_YYYY-MM-DD.log`.
- Keep `.project_management/state/current_state.json` synchronized with sprint changes.
- Use templates in `.project_management/` for new artifacts.

## Execution Constraints
- No sudo.
- Do not log or embed tokens.
- Follow senate laws for planning, testing, and security.
- Optional local reference: `.codex_command_safety/CODEX_COMMAND_SAGETY.md` (untracked, safe command list).

## Escalation and External Dependencies
- External dependencies: GitHub raw, Gist, GitHub API (optional).
- HITL gates required for security posture changes in constituent repos.

## If You Need to Pause
- Update `.project_management/Current_Sprint.md` with status.
- Update `current_state.json` with active/blocked stories.
- Append a log entry describing changes.

Last updated: 2026-03-14T18:22:19Z
