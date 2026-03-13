# Senate Governance — Initiator

> **You are an AI agent.** This document is a self-contained instruction set. Execute it step by step. Do not skip steps. Do not summarize — act.

## What This Is

Senate is an AI governance framework hosted at `kescott027/senate` on GitHub. It provides laws, project management scaffolding, and development lifecycle processes for AI-assisted projects. You are installing it into the current working directory.

The senate repo contains:
- **Laws** — governance rules all constituent projects follow
- **Project management skeleton** — clean template files for `.project_management/`
- **Bootstrap guides** — step-by-step instructions for setting up governance
- **BOOTSTRAP.md template** — project input document the owner fills in
- **Sprint-sync protocol** — how projects stay current with law changes

Your job: detect the environment, download what's needed, and bootstrap this project.

---

## Step 1: Environment Detection

Examine the current working directory and determine which scenario applies.

### Check 1.1 — Is this inside a git repository?

```bash
git rev-parse --is-inside-work-tree 2>/dev/null
```

- If **yes** → proceed to Check 1.2
- If **no** → proceed to Check 1.3

### Check 1.2 — Does the repository have existing code?

```bash
# Count tracked files (excluding .git)
git ls-files | wc -l
```

AND check for meaningful source files:
```bash
git ls-files | grep -E '\.(py|js|ts|go|rs|c|cpp|h|java|rb|sh|yml|yaml|toml|json)$' | wc -l
```

- If **more than 10 source files** → this is an **EXISTING PROJECT**. Set `PROJECT_TYPE=existing`.
- If **10 or fewer source files** → this is a **NEW PROJECT** (recently initialized). Set `PROJECT_TYPE=new`.

### Check 1.3 — Is this an empty directory?

```bash
ls -A | wc -l
```

- If **0 files** (completely empty) → Set `PROJECT_TYPE=empty`.
- If **some files but no git repo** → Ask the user:
  > "This directory has files but is not a git repository. Should I:
  > (a) Initialize a new git repo here and bootstrap governance on these files, or
  > (b) Treat this as a fresh start — create a new repo and begin?"

  Wait for the user's answer before proceeding.

### Check 1.4 — Does `.project_management/` already exist?

```bash
test -d .project_management && echo "exists" || echo "missing"
```

- If **exists** → this is a **GOVERNANCE UPGRADE**. Set `PROJECT_TYPE=upgrade`.

### Record the result

Tell the user what you detected:

> **Environment detected: `<PROJECT_TYPE>`**
> - Git repo: yes/no
> - Source files: N
> - .project_management/: exists/missing
> - Path: `<current working directory>`

---

## Step 2: Download Senate Files

You need files from `kescott027/senate`. Determine the best fetch method.

### Method A — GitHub API (preferred if you have web/API access)

Base URL: `https://raw.githubusercontent.com/kescott027/senate/main/`

### Method B — Clone (if git is available and API is not)

```bash
git clone --depth 1 https://github.com/kescott027/senate.git /tmp/senate-bootstrap
```

### Files to download

Download all of these to a temporary working location. Adapt the fetch method to what's available.

**Always needed:**
| File | Purpose |
|------|---------|
| `project_management_skeleton/` (all files recursively) | `.project_management/` template |
| `sync/manifest.json` | Law manifest with hashes |
| `laws/active/LAW-000_operating-principles.md` through `LAW-012_bill-submission-process.md` | Senate laws (13 files) |
| `BOOTSTRAP.md` | Project input template |

**Needed based on PROJECT_TYPE:**
| File | When needed |
|------|-------------|
| `project_management_bootstrapping.md` | `PROJECT_TYPE=new` or `PROJECT_TYPE=empty` |
| `project_management_bootstrapping_existing.md` | `PROJECT_TYPE=existing` or `PROJECT_TYPE=upgrade` |
| `templates/sprint-sync-checklist.md` | Always |
| `templates/local-laws-readme.md` | Always |

If fetching individual files via raw URL, the skeleton files are:
```
project_management_skeleton/Backlog.md
project_management_skeleton/Current_Sprint.md
project_management_skeleton/Decision_Matrix.md
project_management_skeleton/Project_Sprint_Log.md
project_management_skeleton/Rules.md
project_management_skeleton/Sprint_TEMPLATE.md
project_management_skeleton/epics.md
project_management_skeleton/adr/ADR-000-template.md
project_management_skeleton/blockers/BLOCKER_TEMPLATE.md
project_management_skeleton/blockers/README.md
project_management_skeleton/rules/BLOCKER_MANAGEMENT_RULES.md
project_management_skeleton/state/current_state.json
project_management_skeleton/stories/TEMPLATE.story.md
```

Confirm download success before proceeding:
> **Downloaded N files from kescott027/senate.**

---

## Step 3: Route to Bootstrap Path

Based on `PROJECT_TYPE`, follow the appropriate path:

### Path A: `PROJECT_TYPE=empty` — No repo, no code

1. Ask the user:
   > "No git repository found. Should I:
   > (a) Create a new GitHub repo? If so, what should it be named and under which org/user?
   > (b) Just initialize a local git repo here?"

2. If creating a GitHub repo, check for a token:
   - Look for token files in `~/.github_tokens_secure/` or ask the user.
   - **HITL gate**: Creating a repo is an external service change. Ask the user for explicit confirmation before proceeding.
   - Create the repo via GitHub API.
   - Clone it into the current directory (or initialize in place and add remote).

3. Once a git repo exists, set `PROJECT_TYPE=new` and continue to Path B.

### Path B: `PROJECT_TYPE=new` — Repo exists, minimal code

1. Copy the project management skeleton into `.project_management/`:
   ```bash
   cp -r <downloaded_skeleton>/ ./.project_management/
   ```
   Create empty directories that git needs:
   ```bash
   mkdir -p .project_management/blockers/active .project_management/blockers/closed
   mkdir -p .project_management/completed_sprints .project_management/log .project_management/sprints
   ```

2. Copy senate laws into `.project_management/rules/`:
   - `LAW-000` → `rules/00_operating-principles.md`
   - `LAW-001` → `rules/01_planning-rules.md`
   - `LAW-002` → `rules/02_backlog-format.md`
   - `LAW-003` → `rules/03_engineering-standards.md`
   - `LAW-004` → `rules/04_security-standards.md`
   - `LAW-005` → `rules/05_testing-standards.md`
   - `LAW-006` → `rules/06_release-standards.md`
   - `LAW-007` → `rules/07_observability-standards.md`
   - `LAW-008` → `rules/08_review-cadence.md`
   - `LAW-009` → `rules/09_ai-workflows.md`
   - `LAW-010` → `rules/10_continuous-improvement.md`
   - `LAW-011` → already present as `rules/BLOCKER_MANAGEMENT_RULES.md`
   - `LAW-012` → `rules/12_bill-submission-process.md`

3. Create `.senate-sync.json` in the project root with law hashes from `manifest.json`.

4. Initialize the audit log (`.project_management/log/story_management_<today>.log`) with the scaffold entry.

5. Present `BOOTSTRAP.md` to the user:
   > "Governance scaffold is installed. Now I need project details to generate your backlog and sprint plan.
   >
   > Please fill in `BOOTSTRAP.md` — I've placed a copy in your project root. At minimum, fill in:
   > - Section 2 (Vision)
   > - Section 5 (Key Deliverables)
   > - Section 6 (Backlog)
   >
   > Or, describe your project to me and I'll help you fill it in."

6. Once BOOTSTRAP.md is complete, follow `project_management_bootstrapping.md` starting from **Phase 3** (Phase 1-2 are already done).

### Path C: `PROJECT_TYPE=existing` — Repo with code and history

1. Copy the skeleton and laws (same as Path B, steps 1-4).

2. **Do NOT proceed to BOOTSTRAP.md yet.** Tell the user:
   > "This is an existing project with code and history. Before generating a backlog, I need to run discovery and safety checks to understand what's here.
   >
   > This includes:
   > - Codebase structure and technology scan
   > - Security baseline (GitHub scan features, dependency audit)
   > - Architecture extraction
   > - Existing governance reconciliation
   >
   > Shall I proceed with the discovery phase?"

3. Wait for user confirmation, then follow `project_management_bootstrapping_existing.md` starting from **Phase 0**.

4. After discovery (Phases 0-5), generate or present BOOTSTRAP.md for owner review per Phase 6.

5. Once BOOTSTRAP.md is reviewed, follow `project_management_bootstrapping.md` from Phase 3.

### Path D: `PROJECT_TYPE=upgrade` — `.project_management/` already exists

1. Tell the user:
   > "This project already has `.project_management/`. I'll integrate it with senate governance rather than replacing it.
   >
   > This means:
   > - Existing logs, sprints, and state are preserved
   > - Missing skeleton files will be added
   > - Senate laws will be synced to your rules directory
   > - Conflicts between existing rules and senate laws will be flagged
   >
   > Shall I proceed?"

2. Wait for user confirmation, then follow the **Governance Upgrade Path** appendix in `project_management_bootstrapping_existing.md`.

---

## Step 4: Post-Bootstrap Verification

After bootstrap is complete (regardless of path), verify:

- [ ] `.project_management/` directory is complete
- [ ] Senate laws are present in `rules/`
- [ ] `.senate-sync.json` exists with valid hashes
- [ ] `Backlog.md` has stories in priority order
- [ ] Story files exist for every backlog item
- [ ] `Current_Sprint.md` is populated
- [ ] `current_state.json` reflects the active sprint
- [ ] `AI_ENTRYPOINT.md` exists and is complete
- [ ] Audit log has entries for all bootstrap actions
- [ ] No senate law conflicts with local rules

Tell the user:

> **Senate governance installed successfully.**
>
> - Project type: `<PROJECT_TYPE>`
> - Laws synced: 13
> - Stories created: N
> - Sprint-000: `<goal summary>`
> - Entrypoint: `AI_ENTRYPOINT.md`
>
> Ready to begin Sprint-000. Shall I start?

---

## Reference: Senate Repository Structure

```
kescott027/senate/
├── CONSTITUTION.md              — Foundational governance (voting, executive power)
├── MEMBERSHIP.md                — Constituent project register
├── BOOTSTRAP.md                 — Project input template
├── project_management_bootstrapping.md           — New project guide
├── project_management_bootstrapping_existing.md  — Existing project guide
├── project_management_skeleton/                  — Clean .project_management/ templates
├── bootstrap/
│   ├── initiator.md             — THIS FILE
│   └── prompts/
│       └── install-prompt.md    — Copy-paste command block
├── laws/active/                 — 13 active laws (LAW-000 through LAW-012)
├── sync/manifest.json           — Law manifest with sha256 hashes
├── executive/overrides/         — Executive override records
├── templates/                   — Sprint-sync checklist, local-laws template
└── .github/ISSUE_TEMPLATE/      — Bill, feedback, and override issue templates
```

## Reference: Senate Laws

| ID | Title | Scope |
|----|-------|-------|
| LAW-000 | Operating Principles | Git-as-truth, PRs, evidence, human gates |
| LAW-001 | Planning Rules | Phase gates, objectives, evidence |
| LAW-002 | Backlog Format | Epic/story schema, sizing, SPIKE rules |
| LAW-003 | Engineering Standards | CI, lint, tests, deps, error handling |
| LAW-004 | Security Standards | Scans, least privilege, audit logging |
| LAW-005 | Testing Standards | Unit, integration, policy validation |
| LAW-006 | Release Standards | Versioning, artifacts, rollback, notes |
| LAW-007 | Observability Standards | Logs, metrics, audit events, alerting |
| LAW-008 | Review Cadence | Security, architecture, usability, debt reviews |
| LAW-009 | AI Workflows | Chat→Docs→Backlog→Execution→Review, HITL checkpoints |
| LAW-010 | Continuous Improvement | File bills for governance gaps |
| LAW-011 | Blocker Management | Blocker lifecycle, HITL gates, cross-doc updates |
| LAW-012 | Bill Submission Process | Propose, review, vote, enact laws |
