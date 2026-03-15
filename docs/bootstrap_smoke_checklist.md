# Bootstrap Smoke Test Checklist

Purpose: Validate the one-line bootstrap flow across three scenarios and confirm expected artifacts, integrity checks, and correct guide routing.

## Pre-Flight
- [ ] Start from a clean working directory.
- [ ] Confirm the target repo state matches the scenario below.
- [ ] Ensure `BOOTSTRAP.md` is present and complete in the target repo.

## Scenario A — Empty Repo (no code, minimal files)

### Setup
- [ ] Create an empty repo (only `.git/` or a blank README).
- [ ] Add a completed `BOOTSTRAP.md`.

### Execution
- [ ] Run the bootstrap initiator flow.
- [ ] Confirm the agent follows `project_management_bootstrapping.md` (new project guide).

### Validation
- [ ] `.project_management/` created with `Backlog.md`, `Current_Sprint.md`, `Rules.md`, `state/current_state.json`, and `stories/`.
- [ ] `AI_ENTRYPOINT.md` exists with project description and execution contract.
- [ ] `laws/active/` present and `sync/manifest.json` created if senate membership is `yes`.
- [ ] `BOOTSTRAP.md` remains unchanged (input-only).
- [ ] Integrity check passes for any repo-integrity system in use (e.g., `./bootstrap/regenerate-integrity.sh --check-only` if available).

## Scenario B — New Repo (basic structure, early code)

### Setup
- [ ] Create a repo with a basic structure (e.g., `src/`, `README.md`, initial config).
- [ ] Add a completed `BOOTSTRAP.md`.

### Execution
- [ ] Run the bootstrap initiator flow.
- [ ] Confirm the agent follows `project_management_bootstrapping.md` (new project guide).

### Validation
- [ ] `.project_management/` structure created and populated (backlog, sprint, rules, stories).
- [ ] Local rules, if specified, are placed under `local-laws/` with `local-laws/README.md`.
- [ ] `AI_ENTRYPOINT.md` references key existing artifacts (README, docs).
- [ ] Integrity check passes for any repo-integrity system in use.

## Scenario C — Existing Repo (active codebase and governance)

### Setup
- [ ] Use an existing repo with multiple files and current workflows.
- [ ] Add a completed `BOOTSTRAP.md` if missing.

### Execution
- [ ] Run the bootstrap initiator flow.
- [ ] Confirm the agent follows `project_management_bootstrapping_existing.md` (existing project guide).

### Validation
- [ ] Existing governance artifacts are preserved (no deletion/overwrite).
- [ ] `.project_management/` structure created and populated.
- [ ] `AI_ENTRYPOINT.md` references original governance files and key docs.
- [ ] Local laws are created when existing rules are stricter or extended.
- [ ] Integrity check passes for any repo-integrity system in use.

## Artifacts Verification (all scenarios)
- [ ] `.project_management/Backlog.md` populated with P0/P1/P2 items.
- [ ] `.project_management/sprints/sprint-000.md` created and referenced by `Current_Sprint.md`.
- [ ] `.project_management/Project_Sprint_Log.md` appended.
- [ ] `.project_management/log/story_management_YYYY-MM-DD.log` created with initial entries.
- [ ] `.project_management/ratings/` present (if sprint rating system is enabled).

## Output Capture
- [ ] Record which guide was used and why (new vs existing project).
- [ ] Capture any blockers or missing inputs.
- [ ] Attach evidence (file list, key file contents, or logs).
