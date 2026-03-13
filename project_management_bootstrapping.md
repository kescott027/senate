# Project Management Bootstrapping Guide

## Purpose

This document provides step-by-step instructions for an AI agent to construct and execute `.project_management/` in a **new project** (empty or near-empty repository). It is the canonical reference for how to go from a raw `BOOTSTRAP.md` to a fully operational, governed development cycle.

> **Existing projects with code and history**: Use [`project_management_bootstrapping_existing.md`](project_management_bootstrapping_existing.md) instead. That guide includes codebase discovery, security baseline scans, architecture extraction, and existing governance reconciliation — all of which must happen before the standard bootstrap process below.

## Prerequisites

Before starting, ensure you have:

1. A `BOOTSTRAP.md` file in the project root (or a path referenced by the project's entrypoint) containing the project's vision, architecture, deliverables, and backlog.
2. Access to the `kescott027/senate` repository for governance laws and the project management skeleton.
3. Write access to the project repository.
4. A GitHub token with appropriate scopes (if GitHub API interaction is needed).

## Phase 1: Scaffold `.project_management/`

### Step 1.1 — Copy the skeleton

Copy the entire `project_management_skeleton/` directory from `kescott027/senate` into the project as `.project_management/`.

```
# If senate is cloned locally:
cp -r <senate_path>/project_management_skeleton/ ./.project_management/

# Or fetch via GitHub API:
# Download each file from kescott027/senate/project_management_skeleton/
```

### Step 1.2 — Verify directory structure

Confirm the following structure exists:

```
.project_management/
├── Backlog.md
├── Current_Sprint.md
├── Decision_Matrix.md
├── Project_Sprint_Log.md
├── Rules.md
├── Sprint_TEMPLATE.md
├── epics.md
├── adr/
│   └── ADR-000-template.md
├── blockers/
│   ├── BLOCKER_TEMPLATE.md
│   ├── README.md
│   ├── active/
│   └── closed/
├── completed_sprints/
├── log/
├── rules/
│   └── BLOCKER_MANAGEMENT_RULES.md
├── sprints/
├── state/
│   └── current_state.json
└── stories/
    └── TEMPLATE.story.md
```

### Step 1.3 — Initialize the audit log

Create the first log entry:

```
.project_management/log/story_management_<YYYY-MM-DD>.log
```

Append a JSON line:
```json
{"ts":"<ISO-8601>","actor":"ai","change_type":"add","entity_type":"pm-scaffold","entity_id":"PM-INIT","files_touched":["<list of all files created>"],"summary":"Seeded project management scaffold from senate skeleton.","rationale":"Initialize governance artifacts for structured planning and auditability.","links":[]}
```

## Phase 2: Senate Law Sync

### Step 2.1 — Fetch the senate manifest

Retrieve `sync/manifest.json` from `kescott027/senate` (via local clone or GitHub API).

### Step 2.2 — Download active laws

For each law in the manifest, download the law file and store it in `.project_management/rules/`. Map senate law files to local rule files:

| Senate law | Local rule file |
|---|---|
| `LAW-000_operating-principles.md` | `rules/00_operating-principles.md` |
| `LAW-001_planning-rules.md` | `rules/01_planning-rules.md` |
| ... | ... (maintain numbering alignment) |
| `LAW-011_blocker-management.md` | `rules/BLOCKER_MANAGEMENT_RULES.md` |
| `LAW-012_bill-submission-process.md` | `rules/12_bill-submission-process.md` |

### Step 2.3 — Create `.senate-sync.json`

In the project root, create:

```json
{
  "last_sync": "<ISO-8601>",
  "senate_repo": "kescott027/senate",
  "law_hashes": {
    "LAW-000": "<sha256>",
    "LAW-001": "<sha256>"
  },
  "pending_votes": []
}
```

### Step 2.4 — Log the sync

Append a log entry recording the senate sync.

## Phase 3: Parse BOOTSTRAP.md

Read the project's `BOOTSTRAP.md` and extract the following sections. Each section maps to specific `.project_management/` artifacts.

### Step 3.1 — Vision → Project context

The Vision section provides the "why" behind the project. Use it to:
- Write the project description in `AI_ENTRYPOINT.md`.
- Inform the sprint goal for Sprint-000.
- Set context in epic and story files.

### Step 3.2 — Architecture → Decision records and implementation notes

The Architecture section provides the "how". Use it to:
- Create ADR entries for key architectural decisions (in `adr/`).
- Populate implementation notes in story files.
- Record architectural constraints in `Decision_Matrix.md` if decisions have already been made.

### Step 3.3 — Critical Rules → Local laws

If `BOOTSTRAP.md` contains project-specific rules that go beyond senate laws:
- Create a `local-laws/` directory in the project root.
- Write each local rule as a markdown file.
- These do not require senate approval but must not contradict senate laws.

### Step 3.4 — Key Deliverables → Epics

Map each deliverable to an epic in `epics.md`:
- Assign sequential IDs: EPIC-001, EPIC-002, etc.
- Assign phase (0, 1, 2, or 3) based on deliverable scope.
- Define measurable exit criteria from the deliverable description.

### Step 3.5 — Backlog → Stories

For each backlog item in `BOOTSTRAP.md`:

1. Create a story file using `stories/TEMPLATE.story.md`.
2. Assign sequential IDs: STORY-0001, STORY-0002, etc.
3. Fill in all required sections (per LAW-002 backlog format):
   - Title, Phase, Context, User value, Acceptance criteria, NFRs, Implementation notes, Test plan, Observability, Rollback plan, Risks, DoD checklist.
4. If a story is too large (> 2 days), split it.
5. If requirements are unclear, create a SPIKE story.
6. Add each story to `Backlog.md` in priority order (P0 > P1 > P2).
7. Link stories to their parent epic.

### Step 3.6 — Dependencies and cross-references

After all stories are created:
- Verify dependency chains are explicit (no circular dependencies).
- Ensure every story has at least one acceptance criterion.
- Ensure security-impacting stories have NFR security fields populated.

## Phase 4: Plan Sprint-000

### Step 4.1 — Select stories

From the backlog, select the highest-priority stories that:
- Have no unresolved dependencies (or dependencies are also in the sprint).
- Fit within reasonable sprint scope (Phase 0 sprints should be focused).
- Align with the sprint goal derived from the Vision.

### Step 4.2 — Create the sprint file

Copy `Sprint_TEMPLATE.md` to `sprints/sprint-000.md`. Fill in:
- Sprint number, start date, goal.
- Included stories with IDs and titles.
- Architecture/security notes from the BOOTSTRAP.md Architecture section.

### Step 4.3 — Update Current_Sprint.md

Populate with the sprint number, goal, selected stories, rationale, and risks.

### Step 4.4 — Update current_state.json

```json
{
  "phase": 0,
  "active_sprint": "Sprint-000",
  "active_story_ids": ["STORY-0001", "..."],
  "blocked_story_ids": [],
  "pending_hitl_gate": null,
  "notes": "<brief status>",
  "last_updated": "<ISO-8601>"
}
```

### Step 4.5 — Log sprint creation

Append a log entry for the sprint kickoff.

## Phase 5: Create AI_ENTRYPOINT.md

Create `AI_ENTRYPOINT.md` in the project root. This is the canonical entrypoint for any AI agent resuming work. It must include:

### Required sections

1. **Purpose** — what this document is.
2. **Project Scope** — workspace root, primary repo, project management path.
3. **Quick Start Checklist** — numbered steps to orient a new agent (read rules, check state, read sprint, read stories, read scan docs if applicable).
4. **Rules and Governance** — paths to Rules.md, rules/, blocker rules.
5. **Senate Governance** — senate repo URL, membership status, sync protocol reference.
6. **GitHub API Access** — token file path, scopes, useful endpoints (if applicable).
7. **Current Sprint** — sprint number, goal, active stories.
8. **In-Progress Work** — per-story status, evidence, remaining actions.
9. **Change Management Requirements** — log rules, state sync rules, template references.
10. **Execution Constraints** — no sudo, no token logging, read CLAUDE.md first, etc.
11. **Escalation and External Dependencies** — what needs human action or elevated permissions.
12. **If You Need to Pause** — what to update before stopping.

### Adapt to project context

- If the project has a GitHub repo, include API access details.
- If the project has CI/CD, reference pipeline URLs.
- If the project has external dependencies, list them.
- Reference any additional data files mentioned in BOOTSTRAP.md.

## Phase 6: Validate and Begin Execution

### Step 6.1 — Self-check

Before beginning execution, verify:

- [ ] `.project_management/` directory is complete with all skeleton files.
- [ ] Senate laws are synced to `rules/`.
- [ ] `.senate-sync.json` exists with valid hashes.
- [ ] `Backlog.md` has stories in priority order.
- [ ] Story files exist for every story in the backlog.
- [ ] `epics.md` has at least one epic.
- [ ] `sprints/sprint-000.md` exists with included stories.
- [ ] `Current_Sprint.md` is populated.
- [ ] `current_state.json` reflects the active sprint and stories.
- [ ] `AI_ENTRYPOINT.md` exists and is complete.
- [ ] Audit log has entries for scaffold creation, senate sync, story creation, and sprint kickoff.
- [ ] No senate law conflicts exist with any local rules.

### Step 6.2 — Begin Sprint-000

Pick up the first story in the sprint by:
1. Reading the story file for acceptance criteria and implementation notes.
2. Reading any referenced architecture docs or ADRs.
3. Checking the HITL gate — if the story involves security posture changes, external integrations, production deploys, or policy waivers, set `pending_hitl_gate` and stop.
4. Implementing the story following LAW-009 (AI Workflows), Workflow C.
5. Recording evidence and updating the sprint file as work progresses.

## Appendix: Log Entry Format

All log entries are single-line JSON appended to `.project_management/log/story_management_YYYY-MM-DD.log`:

```json
{
  "ts": "<ISO-8601>",
  "actor": "ai",
  "change_type": "add|update|correct|remove",
  "entity_type": "pm-scaffold|story|sprint|blocker|rule|project",
  "entity_id": "<identifier>",
  "files_touched": ["<file paths>"],
  "summary": "<what changed>",
  "rationale": "<why>",
  "links": ["<optional references>"]
}
```

## Appendix: Common Bootstrap Pitfalls

1. **Skipping the senate sync.** Laws must be in place before stories are created — they govern story format, quality gates, and execution rules.
2. **Creating stories without acceptance criteria.** This violates LAW-002 and Rules.md. Every story must have testable acceptance criteria.
3. **Not logging scaffold creation.** The first log entry must document the scaffold. If missed, file a `change_type="correct"` entry.
4. **Overloading Sprint-000.** Phase 0 sprints should focus on foundations — scaffolding, scope definition, baseline scans. Don't try to build features in Sprint-000.
5. **Ignoring HITL gates.** If a story requires security posture changes or external service modifications, you must stop and set the gate. Do not proceed autonomously.
6. **Forgetting AI_ENTRYPOINT.md.** Without it, the next AI agent has no orientation. Always create it as the last step before execution.
