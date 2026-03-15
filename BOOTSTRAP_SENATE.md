# BOOTSTRAP_SENATE.md — Project Bootstrap (Senate Repo)

> This is a project-specific bootstrap draft for the **Senate** repository. It does not replace the generic `BOOTSTRAP.md` template used by downstream projects.

---

## 1. Project Identity

- **Project name:** Senate (AI governance framework)
- **Repository:** `kescott027/senate`
- **Owner / stakeholder:** `kescott027`
- **Senate membership:** n/a (this repo is the senate source of truth)

---

## 2. Vision

**Problem statement:**
AI-assisted development needs consistent, enforceable governance to avoid quality drift, security gaps, and process inconsistency. Teams need a repeatable, auditable way to bootstrap a project with structured planning, laws, and sprint execution rules.

**Target users / audience:**
- Project owners adopting AI-assisted development
- AI coding agents responsible for governance bootstrap and execution
- Contributors needing clear rules for planning, review, and compliance

**Success criteria:**
- A new or existing project can bootstrap governance by executing a single line of text from `README.md`.
- The bootstrap flow produces a complete `.project_management/` scaffold with synced laws, logs, and an `AI_ENTRYPOINT.md` in < 10 minutes of agent time.
- Integrity verification prevents tampered bootstrap instructions from being used.
- Laws and manifest hashes are consistent and verifiable across platforms.
- Constituents can sync laws at sprint start using a clear, repeatable protocol.

**Non-goals:**
- Building product-specific features for constituent projects.
- Enforcing laws at runtime inside other repos (this repo provides the rules and guidance only).
- Replacing human review for security or policy-impacting changes.

---

## 3. Architecture

**System overview:**
Senate is a documentation-first governance framework. It provides a bootstrap initiator, an integrity-verified law set, and a project management skeleton for constituent projects. An AI agent is expected to fetch the initiator from GitHub raw, verify integrity, copy the skeleton, sync laws into `.project_management/rules/`, and then execute sprint planning based on a project’s BOOTSTRAP inputs. A GitHub Action ensures integrity of critical files.

**Component inventory:**

| Component | Purpose | Technology | Repository path |
|-----------|---------|------------|-----------------|
| Bootstrap initiator | Single-file bootstrap instructions for agents | Markdown | `bootstrap/initiator.md` |
| Integrity manifest | Hashes for critical files | JSON | `bootstrap/integrity.json` |
| Integrity generator | Recompute/verify hashes | Bash + Python + sha256sum | `bootstrap/regenerate-integrity.sh` |
| Laws | Active governance rules | Markdown | `laws/active/` |
| Law manifest | Hashes + metadata for law sync | JSON | `sync/manifest.json` |
| Sync protocol | Sprint start sync steps | Markdown | `sync/README.md` |
| PM skeleton | `.project_management/` scaffold | Markdown + JSON | `project_management_skeleton/` |
| Bootstrap guides | Step-by-step bootstrap procedures | Markdown | `project_management_bootstrapping*.md` |
| Templates | Checklists, local law templates | Markdown | `templates/` |
| Governance docs | Constitution, membership, executive | Markdown | `CONSTITUTION.md`, `MEMBERSHIP.md`, `executive/` |
| Integrity CI | Verifies integrity on changes | GitHub Actions | `.github/workflows/integrity-check.yml` |

**Data flow:**
1. Agent fetches `bootstrap/initiator.md` from GitHub raw.
2. Agent verifies integrity using `bootstrap/integrity.json` and the secondary verification gist.
3. Agent determines environment (new vs existing vs upgrade).
4. Agent copies `project_management_skeleton/` into the target repo as `.project_management/`.
5. Agent downloads laws per `sync/manifest.json` and writes them into `.project_management/rules/`.
6. Agent reads project BOOTSTRAP input and generates backlog, epics, sprint-000, and `AI_ENTRYPOINT.md`.
7. At each sprint start, the agent performs the sync protocol.

**Infrastructure:**
- GitHub repo and raw content hosting.
- GitHub Actions for integrity verification.
- Gist for out-of-band hash verification.
- Optional GitHub API for fetching files and posting issues/votes.

**Key architectural decisions already made:**

| Decision | Rationale | Constraints |
|----------|-----------|-------------|
| Single-file initiator | Minimizes copy/paste errors and keeps bootstrapping consistent | Must be integrity-verified |
| Hash-based integrity manifest | Prevents tampering and drift across critical files | Requires consistent hashing across platforms |
| Markdown-first governance | Human-readable, easy to review and diff | No runtime enforcement |
| Skeleton templates | Consistent PM structure across projects | Must be kept in sync with laws |
| Secondary verification gist | Out-of-band confirmation for integrity | Requires gist availability |

**Architecture diagrams or references (optional):**
- `README.md`
- `project_management_bootstrapping.md`
- `sync/README.md`

---

## 4. Critical Rules (optional)

**Security rules:**
- Integrity verification is mandatory before executing any bootstrap instruction.
- Do not embed or log tokens in docs, scripts, or logs.

**Technical constraints:**
- Hashing must be consistent across platforms (CRLF normalization).
- Bootstrap must work with no web access (curl + paste fallback).

**Process constraints:**
- Any security posture change in a constituent repo requires HITL approval.
- `project_management_bootstrapping_existing.md` must be used for existing projects.

**Coding conventions:**
- Maintain clear, minimal, copy-paste friendly instructions.

---

## 5. Key Deliverables

### Deliverable 1: One-Line Bootstrap Flow (MVP)
- **Description:** A single-line instruction in `README.md` that allows any AI agent to bootstrap governance safely and reliably.
- **Phase:** 1
- **Exit criteria:**
  - README includes a copy-paste instruction that fetches and executes `bootstrap/initiator.md`.
  - Initiator performs integrity verification and environment detection.
  - At least three smoke tests (empty repo, new repo, existing repo) pass end-to-end.
- **Dependencies:** Integrity manifest, bootstrap guides, skeleton, laws.

### Deliverable 2: Governance Artifact Set
- **Description:** Complete, versioned laws, constitution, and sync manifest suitable for automation.
- **Phase:** 0
- **Exit criteria:**
  - 13 active laws exist in `laws/active/` with hashes in `sync/manifest.json`.
  - `CONSTITUTION.md` and `MEMBERSHIP.md` are present and referenced in README.
  - Integrity checks cover all critical files.
- **Dependencies:** None.

### Deliverable 3: Project Management Skeleton
- **Description:** A complete `.project_management/` template for constituent projects.
- **Phase:** 0
- **Exit criteria:**
  - Skeleton includes all required files and empty directories with `.gitkeep`.
  - Story and sprint templates match LAW-002 and LAW-001.
  - BLOCKER management rules present and mapped to LAW-011.
- **Dependencies:** Governance Artifact Set.

### Deliverable 4: Bootstrap Guides and Templates
- **Description:** Clear, step-by-step guides and templates for new and existing projects.
- **Phase:** 1
- **Exit criteria:**
  - `project_management_bootstrapping.md` and `project_management_bootstrapping_existing.md` are complete.
  - Templates for sprint sync and local laws exist and are referenced.
  - Guides include HITL gate guidance for security posture changes.
- **Dependencies:** Governance Artifact Set, Project Management Skeleton.

### Deliverable 5: Law Proposal and Voting System
- **Description:** A structured, collaborative process for proposing laws, collecting votes, and recording decisions.
- **Phase:** 2
- **Exit criteria:**
  - Proposal intake and triage workflow is documented end-to-end (proposal → review → voting → decision).
  - Voting format and tally rules are standardized and referenced by templates.
  - Decision artifacts are recorded with outcome, quorum, and enactment status.
  - Executive override pathway is clearly integrated with the voting process.
- **Dependencies:** Governance Artifact Set, Bootstrap Guides and Templates.

### Deliverable 6: Self-Analysis and Automated Bill Submission
- **Description:** A system that can self-audit governance gaps, draft bills, and submit them for review.
- **Phase:** 3
- **Exit criteria:**
  - Self-audit checklist or script identifies governance gaps and conflicts.
  - Bill draft generator produces structured proposals aligned with LAW-012.
  - Submission flow supports GitHub Issue creation with HITL gating.
- **Dependencies:** Law Proposal and Voting System.

---

## 6. Backlog

### P0 — Critical (must be done first)

#### STORY-0001 — Publish one-line bootstrap instruction in README
- **Description:** Ensure `README.md` includes a single-line, copy-paste instruction that fetches and executes the initiator from GitHub raw.
- **Acceptance criteria:**
  - README contains an instruction that references `bootstrap/initiator.md` on the `main` branch.
  - Instruction is a single line and safe to paste into AI agents.
  - README also includes a no-web-access fallback (curl + paste).
- **Parent deliverable:** One-Line Bootstrap Flow (MVP)
- **Dependencies:** STORY-0002
- **Risk:** Medium
- **Architectural impact:** Low
- **Notes:** Existing README already has this; verify clarity and keep in sync with initiator path.

#### STORY-0002 — Maintain bootstrap initiator as the single source of truth
- **Description:** Ensure `bootstrap/initiator.md` contains the full, authoritative bootstrap workflow with integrity verification and environment detection.
- **Acceptance criteria:**
  - Initiator includes integrity verification (primary and secondary).
  - Initiator includes environment detection for new/existing/upgrade/empty.
  - Initiator routes to the correct bootstrap guide based on project type.
- **Parent deliverable:** One-Line Bootstrap Flow (MVP)
- **Dependencies:** STORY-0003, STORY-0005
- **Risk:** High
- **Architectural impact:** Medium
- **Notes:** The initiator is already present; perform consistency review against guides.

#### STORY-0003 — Integrity manifest and verification script
- **Description:** Provide a deterministic hash manifest and script to verify it.
- **Acceptance criteria:**
  - `bootstrap/integrity.json` includes all critical files.
  - `bootstrap/regenerate-integrity.sh --check-only` exits 0 in CI.
  - Hashing normalizes CRLF to ensure cross-platform consistency.
- **Parent deliverable:** Governance Artifact Set
- **Dependencies:** None
- **Risk:** High
- **Architectural impact:** Medium
- **Notes:** Implemented; keep CI coverage and update as files change.

#### STORY-0004 — Secondary verification gist alignment
- **Description:** Ensure the out-of-band verification gist matches initiator and integrity manifest hashes.
- **Acceptance criteria:**
  - Gist contains hashes for `bootstrap/initiator.md` and `bootstrap/integrity.json`.
  - Initiator verifies both hashes against the gist.
  - Documented recovery behavior if gist is unreachable.
- **Parent deliverable:** One-Line Bootstrap Flow (MVP)
- **Dependencies:** STORY-0003
- **Risk:** Medium
- **Architectural impact:** Low
- **Notes:** Requires maintaining gist updates whenever integrity.json changes.

#### STORY-0005 — Publish complete PM skeleton
- **Description:** Ensure `project_management_skeleton/` contains all required files and directories.
- **Acceptance criteria:**
  - Skeleton includes Backlog, Sprint, Rules, ADR template, blockers, state, and story template.
  - Empty directories include `.gitkeep`.
  - Skeleton matches paths expected in bootstrap guides.
- **Parent deliverable:** Project Management Skeleton
- **Dependencies:** None
- **Risk:** Medium
- **Architectural impact:** Low
- **Notes:** Verify file list aligns with `project_management_bootstrapping.md`.

#### STORY-0006 — Ensure active laws and sync manifest are consistent
- **Description:** Keep `laws/active/` and `sync/manifest.json` aligned with correct hashes.
- **Acceptance criteria:**
  - 13 active laws exist and are referenced in the manifest.
  - Manifest hashes match actual file hashes.
  - Manifest `last_updated` reflects changes.
- **Parent deliverable:** Governance Artifact Set
- **Dependencies:** STORY-0003
- **Risk:** Medium
- **Architectural impact:** Low
- **Notes:** Use integrity script + manual verification.

#### STORY-0126 — Enable GitHub code scanning (CodeQL)
- **Description:** Enable GitHub code scanning for the senate repo to satisfy LAW-004 security standards.
- **Acceptance criteria:**
  - Code scanning is enabled in GitHub security settings for this repo.
  - A baseline scan completes with results visible in GitHub.
  - Any alerts are triaged or captured as backlog items.
  - Change is logged with HITL approval evidence.
- **Parent deliverable:** Governance Artifact Set
- **Dependencies:** None
- **Risk:** High
- **Architectural impact:** Low
- **Notes:** Requires HITL approval before enabling security posture changes.

#### STORY-0007 — Document the sprint sync protocol
- **Description:** Provide clear steps for constituents to sync laws at sprint start.
- **Acceptance criteria:**
  - `sync/README.md` describes the full protocol.
  - `templates/sprint-sync-checklist.md` aligns with the protocol.
  - README links to the sync protocol.
- **Parent deliverable:** Bootstrap Guides and Templates
- **Dependencies:** STORY-0006
- **Risk:** Low
- **Architectural impact:** Low

#### STORY-0008 — Provide bootstrap guides for new and existing projects
- **Description:** Maintain comprehensive guides for both new and existing repos.
- **Acceptance criteria:**
  - `project_management_bootstrapping.md` is complete and accurate.
  - `project_management_bootstrapping_existing.md` includes discovery, security baseline, and HITL gates.
  - Initiator references these guides consistently.
- **Parent deliverable:** Bootstrap Guides and Templates
- **Dependencies:** STORY-0002, STORY-0005
- **Risk:** Medium
- **Architectural impact:** Low

#### STORY-0009 — Provide BOOTSTRAP input template for constituents
- **Description:** Provide a well-structured `BOOTSTRAP.md` template for project owners.
- **Acceptance criteria:**
  - Template includes identity, vision, architecture, deliverables, backlog, dependencies.
  - Instructions clarify that the file is input-only.
  - Template is referenced by bootstrap guides.
- **Parent deliverable:** Bootstrap Guides and Templates
- **Dependencies:** None
- **Risk:** Low
- **Architectural impact:** Low

#### STORY-0010 — Local laws template for constituents
- **Description:** Provide a clear template for `local-laws/` in member repos.
- **Acceptance criteria:**
  - `templates/local-laws-readme.md` exists and documents format and conflict rules.
  - Bootstrap guides reference local law creation when needed.
- **Parent deliverable:** Bootstrap Guides and Templates
- **Dependencies:** STORY-0007
- **Risk:** Low
- **Architectural impact:** Low

#### STORY-0011 — Integrity CI workflow
- **Description:** Ensure integrity checks run automatically on changes.
- **Acceptance criteria:**
  - GitHub Actions workflow runs on PRs and pushes to `main`.
  - Workflow fails if integrity.json is out of date.
  - Auto-regeneration only runs on `main` pushes and commits the updated file.
- **Parent deliverable:** Governance Artifact Set
- **Dependencies:** STORY-0003
- **Risk:** Medium
- **Architectural impact:** Low

#### STORY-0012 — Bootstrap smoke test checklist
- **Description:** Create a repeatable manual test checklist for the one-line bootstrap flow.
- **Acceptance criteria:**
  - Checklist covers empty repo, new repo, and existing repo flows.
  - Checklist verifies integrity checks and correct guide routing.
  - Checklist references expected artifacts in `.project_management/`.
- **Parent deliverable:** One-Line Bootstrap Flow (MVP)
- **Dependencies:** STORY-0002, STORY-0005, STORY-0006
- **Risk:** Medium
- **Architectural impact:** Low

#### STORY-0013 — Membership onboarding guidance
- **Description:** Define how new projects register as constituents in `MEMBERSHIP.md`.
- **Acceptance criteria:**
  - README (or separate doc) explains how to request membership updates.
  - Provide a minimal template or process (issue or PR) for adding a member.
  - Guidance includes when to sync laws and update `.senate-sync.json`.
- **Parent deliverable:** One-Line Bootstrap Flow (MVP)
- **Dependencies:** STORY-0007
- **Risk:** Medium
- **Architectural impact:** Low

### P1 — Important (do after P0)

#### STORY-0101 — Provide automated bootstrap verification script
- **Description:** Add a script to validate that a freshly bootstrapped repo contains all required artifacts.
- **Acceptance criteria:**
  - Script checks for `.project_management/` structure, laws, sync file, and AI entrypoint.
  - Script exits non-zero on missing or malformed files.
  - Document how to run it after bootstrap.
- **Parent deliverable:** One-Line Bootstrap Flow (MVP)
- **Dependencies:** STORY-0005, STORY-0006
- **Risk:** Medium
- **Architectural impact:** Low

#### STORY-0102 — Provide example bootstrap transcript
- **Description:** Create a short, real example showing a bootstrap session and resulting files.
- **Acceptance criteria:**
  - Example shows the single-line instruction used.
  - Example lists resulting files and key outputs.
  - Example avoids leaking secrets or tokens.
- **Parent deliverable:** One-Line Bootstrap Flow (MVP)
- **Dependencies:** STORY-0012
- **Risk:** Low
- **Architectural impact:** Low

#### STORY-0103 — Clarify environment detection edge cases
- **Description:** Document how the initiator handles repos with non-code content or unusual structures.
- **Acceptance criteria:**
  - Edge cases described in initiator or a linked doc.
  - Decision logic is unambiguous and testable.
- **Parent deliverable:** One-Line Bootstrap Flow (MVP)
- **Dependencies:** STORY-0002
- **Risk:** Low
- **Architectural impact:** Low

#### STORY-0104 — Provide guidance for no-GitHub environments
- **Description:** Document how to bootstrap in air-gapped or non-GitHub environments.
- **Acceptance criteria:**
  - README includes a path for manual download and local use.
  - Integrity verification still works offline with local files.
- **Parent deliverable:** One-Line Bootstrap Flow (MVP)
- **Dependencies:** STORY-0003
- **Risk:** Medium
- **Architectural impact:** Low

#### STORY-0105 — Consolidate law mapping table
- **Description:** Maintain a single authoritative mapping of LAW files to local rules filenames.
- **Acceptance criteria:**
  - Mapping table appears in a single place and is referenced elsewhere.
  - Table includes all 13 laws and filenames.
- **Parent deliverable:** Governance Artifact Set
- **Dependencies:** STORY-0006
- **Risk:** Low
- **Architectural impact:** Low

#### STORY-0106 — Add validation for law hash changes
- **Description:** Add a check to ensure `sync/manifest.json` hashes change when law content changes.
- **Acceptance criteria:**
  - A CI or script detects mismatches between laws and manifest.
  - Document the update process.
- **Parent deliverable:** Governance Artifact Set
- **Dependencies:** STORY-0003, STORY-0006
- **Risk:** Medium
- **Architectural impact:** Low

#### STORY-0107 — Define versioning strategy for laws
- **Description:** Document how law versions are tracked and updated across changes.
- **Acceptance criteria:**
  - A section in `laws/README.md` (or equivalent) describes versioning.
  - Version changes are reflected in manifest metadata.
- **Parent deliverable:** Governance Artifact Set
- **Dependencies:** STORY-0006
- **Risk:** Low
- **Architectural impact:** Low

#### STORY-0108 — Clarify executive override process
- **Description:** Expand documentation for executive overrides to reduce ambiguity.
- **Acceptance criteria:**
  - `executive/README.md` clearly describes override workflow.
  - Example override records are included or templated.
- **Parent deliverable:** Governance Artifact Set
- **Dependencies:** None
- **Risk:** Low
- **Architectural impact:** Low

#### STORY-0109 — Add onboarding FAQ
- **Description:** Provide a concise FAQ addressing common bootstrap issues.
- **Acceptance criteria:**
  - FAQ covers integrity failures, missing tokens, and `.project_management/` errors.
  - Linked from README.
- **Parent deliverable:** One-Line Bootstrap Flow (MVP)
- **Dependencies:** STORY-0012
- **Risk:** Low
- **Architectural impact:** Low

#### STORY-0125 — Sprint review rating system
- **Description:** Add a structured sprint review rating (0.0–1.0, one decimal) that evaluates adherence to senate laws and sprint intent, and records a running average.
- **Acceptance criteria:**
  - Sprint review includes a rating (0.0–1.0, one decimal) and a brief rationale tied to senate laws and sprint goal.
  - Sprint template is updated to include the rating section and running average.
  - An append-only ratings log is created and updated for every sprint closeout.
  - The running average is computed from the log and included in the sprint review.
  - Location and format of the ratings log are documented.
- **Parent deliverable:** Bootstrap Guides and Templates
- **Dependencies:** None
- **Risk:** Low
- **Architectural impact:** Low

#### STORY-0110 — Define bill intake and triage workflow
- **Description:** Document a step-by-step process for how proposals are submitted, triaged, scheduled for review, and moved into voting.
- **Acceptance criteria:**
  - A dedicated section (new doc or README section) defines proposal states and required labels.
  - Entry criteria for review and voting are explicit and testable.
  - Workflow references the bill issue templates and LAW-012.
  - Triage expectations (who, when, how) are defined.
- **Parent deliverable:** Law Proposal and Voting System
- **Dependencies:** STORY-0008
- **Risk:** Medium
- **Architectural impact:** Low

#### STORY-0111 — Standardize voting lifecycle and decision recording
- **Description:** Define how votes are opened, closed, tallied, and recorded as decisions.
- **Acceptance criteria:**
  - Voting-open and voting-closed criteria are defined and documented.
  - Decision record format is specified (outcome, tally, quorum, timestamps).
  - Decision records are stored in a documented location (e.g., `votes/`).
  - Executive override interaction is linked but not duplicated.
- **Parent deliverable:** Law Proposal and Voting System
- **Dependencies:** STORY-0110
- **Risk:** Medium
- **Architectural impact:** Low

#### STORY-0112 — Publish vote tally procedure and archival format
- **Description:** Create a repeatable procedure for tallying votes and storing results for audit.
- **Acceptance criteria:**
  - Tally steps reference LAW-012 thresholds and quorum rules.
  - A canonical tally template exists in `votes/` or `templates/`.
  - Guidance covers abstentions and edge cases (late votes, invalid format).
- **Parent deliverable:** Law Proposal and Voting System
- **Dependencies:** STORY-0111
- **Risk:** Low
- **Architectural impact:** Low

#### STORY-0113 — Update contributor guidance for proposing and voting
- **Description:** Provide contributor-facing documentation that explains how to propose a bill and how to vote.
- **Acceptance criteria:**
  - README (or a dedicated guide) links to proposal and voting instructions.
  - Examples show correct formatting for a vote comment.
  - Guidance includes timelines and review windows.
- **Parent deliverable:** Law Proposal and Voting System
- **Dependencies:** STORY-0110
- **Risk:** Low
- **Architectural impact:** Low

#### STORY-0114 — Executive override integration
- **Description:** Clarify how executive overrides interact with the normal voting pipeline.
- **Acceptance criteria:**
  - Executive override steps are documented and linked from the voting workflow.
  - Clear rules define when override supersedes vote outcomes.
  - Override records are stored consistently with other decision artifacts.
- **Parent deliverable:** Law Proposal and Voting System
- **Dependencies:** STORY-0111
- **Risk:** Medium
- **Architectural impact:** Low

#### STORY-0115 — Constituent onboarding kit (voting-ready)
- **Description:** Provide a minimal, fast-path onboarding kit so a new constituent can vote quickly.
- **Acceptance criteria:**
  - Kit includes: onboarding steps, sync checklist, vote format example, and “first vote” walkthrough.
  - Kit is linked from README and/or `MEMBERSHIP.md`.
  - Kit explicitly states prerequisites for voting.
- **Parent deliverable:** Law Proposal and Voting System
- **Dependencies:** STORY-0113
- **Risk:** Medium
- **Architectural impact:** Low

#### STORY-0116 — Voting readiness checklist
- **Description:** Define the minimal conditions a constituent must meet before voting.
- **Acceptance criteria:**
  - Checklist includes membership entry, law sync status, and `.senate-sync.json` presence.
  - Checklist is used during sprint sync and onboarding.
  - Checklist has a single “ready/not ready” outcome.
- **Parent deliverable:** Law Proposal and Voting System
- **Dependencies:** STORY-0110, STORY-0007
- **Risk:** Low
- **Architectural impact:** Low

#### STORY-0117 — First vote walkthrough
- **Description:** Provide a step-by-step example of submitting a valid vote comment.
- **Acceptance criteria:**
  - Walkthrough references the correct vote format from LAW-012.
  - Includes a worked example and how to verify it was counted.
  - Clearly explains vote timing and labels.
- **Parent deliverable:** Law Proposal and Voting System
- **Dependencies:** STORY-0113
- **Risk:** Low
- **Architectural impact:** Low

#### STORY-0118 — Constituent identity canonicalization
- **Description:** Define the canonical project identifier to use in votes to avoid mismatched naming.
- **Acceptance criteria:**
  - Canonical format is documented (e.g., `org/repo`).
  - `MEMBERSHIP.md` entries align with the canonical format.
  - Voting instructions reference the canonical format.
- **Parent deliverable:** Law Proposal and Voting System
- **Dependencies:** STORY-0013
- **Risk:** Medium
- **Architectural impact:** Low

#### STORY-0119 — Voting notification path
- **Description:** Document how constituents learn that a vote is open and when it closes.
- **Acceptance criteria:**
  - Notification mechanism documented (labels, GitHub watch settings, mention policy).
  - Timeline expectations are explicit.
  - Linked from onboarding kit and voting guide.
- **Parent deliverable:** Law Proposal and Voting System
- **Dependencies:** STORY-0110
- **Risk:** Low
- **Architectural impact:** Low

#### STORY-0124 — Voting eligibility gate in sync protocol
- **Description:** Add a voting readiness gate to the sprint sync protocol.
- **Acceptance criteria:**
  - `sync/README.md` and `templates/sprint-sync-checklist.md` include the gate.
  - Gate uses the voting readiness checklist.
  - Procedure defines how to remediate missing requirements.
- **Parent deliverable:** Law Proposal and Voting System
- **Dependencies:** STORY-0116
- **Risk:** Low
- **Architectural impact:** Low

### P2 — Nice to have (do if time permits)

#### STORY-0201 — Bootstrap helper CLI
- **Description:** Provide a small CLI wrapper to perform the bootstrap steps automatically.
- **Acceptance criteria:**
  - CLI performs integrity verification and downloads skeleton + laws.
  - CLI supports a dry-run mode.
  - Documentation explains how to install and run it.
- **Parent deliverable:** One-Line Bootstrap Flow (MVP)
- **Dependencies:** STORY-0002, STORY-0003
- **Risk:** Medium
- **Architectural impact:** Medium
- **Notes:** Optional; must not replace the single-line AI instruction.

#### STORY-0202 — Add example constituent repo
- **Description:** Publish a minimal example repo that has been bootstrapped.
- **Acceptance criteria:**
  - Example repo contains `.project_management/` and `.senate-sync.json`.
  - README links back to this repo.
- **Parent deliverable:** One-Line Bootstrap Flow (MVP)
- **Dependencies:** STORY-0012
- **Risk:** Low
- **Architectural impact:** Low

#### STORY-0203 — Provide multilingual bootstrap prompts
- **Description:** Provide translated bootstrap instructions for non-English teams.
- **Acceptance criteria:**
  - Translations include the single-line prompt and no-web fallback.
  - Each translation references the same initiator URL.
- **Parent deliverable:** One-Line Bootstrap Flow (MVP)
- **Dependencies:** STORY-0001
- **Risk:** Low
- **Architectural impact:** Low

#### STORY-0210 — Define self-audit scope and signals
- **Description:** Specify what the system should analyze to detect governance gaps and improvement opportunities.
- **Acceptance criteria:**
  - A checklist or spec enumerates signals (missing docs, stale laws, conflicts, process gaps).
  - Each signal maps to a bill type (new law, amendment, repeal, feedback).
  - Safety constraints and HITL gates are explicit.
- **Parent deliverable:** Self-Analysis and Automated Bill Submission
- **Dependencies:** STORY-0110
- **Risk:** Medium
- **Architectural impact:** Low

#### STORY-0211 — Build bill draft generator specification
- **Description:** Define a structured bill draft format compatible with LAW-012 and the issue templates.
- **Acceptance criteria:**
  - Template includes title, motivation, scope, and enforcement details.
  - Mapping from self-audit findings to bill fields is defined.
  - Examples exist for a new law and an amendment.
- **Parent deliverable:** Self-Analysis and Automated Bill Submission
- **Dependencies:** STORY-0210
- **Risk:** Medium
- **Architectural impact:** Low

#### STORY-0212 — Implement bill submission flow with HITL
- **Description:** Provide a manual or scripted process that submits drafted bills to GitHub as issues.
- **Acceptance criteria:**
  - Submission uses the correct issue template.
  - Requires explicit user confirmation before creating the issue.
  - Records the submission in a consistent place.
- **Parent deliverable:** Self-Analysis and Automated Bill Submission
- **Dependencies:** STORY-0211
- **Risk:** High
- **Architectural impact:** Medium

#### STORY-0213 — Self-analysis report artifact
- **Description:** Produce a report format that captures findings and proposed actions.
- **Acceptance criteria:**
  - Report includes date, findings, severity, and proposed bill references.
  - Stored in a documented location (e.g., `reports/` or `docs/`).
  - Linked from the submitted bill for traceability.
- **Parent deliverable:** Self-Analysis and Automated Bill Submission
- **Dependencies:** STORY-0210
- **Risk:** Low
- **Architectural impact:** Low

---

## 7. External Dependencies and Access

| Dependency | Type | Access method | Notes |
|------------|------|---------------|-------|
| GitHub raw | Service | HTTPS | Fetch `bootstrap/initiator.md` and files |
| GitHub API | API | Token (optional) | For issues/votes and repo queries |
| GitHub Actions | Service | Repo settings | Integrity CI |
| Gist (secondary verification) | Service | HTTPS | Out-of-band hash verification |
| `sha256sum` | Tool | Local binary | Hash computation |
| `python3` | Tool | Local binary | Integrity script |

**Token files:**
- None required for basic bootstrap. Optional for API actions.

**Required GitHub permissions:**
- `repo` (read) for API checks and issue posting if used.

**External services:**
- GitHub and Gist only.

---

## 8. Additional Data Files (optional)

| File | Purpose | Location |
|------|---------|----------|
| `CONSTITUTION.md` | Governance foundations | `CONSTITUTION.md` |
| `MEMBERSHIP.md` | Constituent registry | `MEMBERSHIP.md` |
| `sync/README.md` | Law sync protocol | `sync/README.md` |
| `templates/sprint-sync-checklist.md` | Sync checklist | `templates/sprint-sync-checklist.md` |
| `docs/security/scan-findings.md` | Security baseline evidence | `docs/security/scan-findings.md` |
| `docs/architecture/summary.md` | Architecture summary | `docs/architecture/summary.md` |
| `docs/governance/reconciliation.md` | Governance reconciliation | `docs/governance/reconciliation.md` |
