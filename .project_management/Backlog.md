# Backlog (Authoritative)

This file is the authoritative backlog for all planned work. Stories are listed in strict priority order.

## Backlog Index

- Last updated: 2026-03-15
- Total story count: 29
- Highest story ID present: STORY-0218

## Story Template (Must Be Used)

- **ID:** STORY-####
- **Title:**
- **Description:**
- **Acceptance Criteria:**
- **Dependencies:**
- **Risk:** Low / Medium / High
- **Architectural Impact:** None / Low / Medium / High
- **Notes/Evidence:**

## Backlog Completion Rule

A story is "Done" ONLY when:

- It appears in a completed sprint file marked Done with closure date.
- Evidence is recorded (commit/PR refs + tests + doc updates).
- It is removed from `Backlog.md` (or moved into an explicit Archive section).

---

## P0 (Critical)

No P0 items pending.

## P1 (Important)

- **ID:** STORY-0115
- **Title:** Constituent onboarding kit (voting-ready)
- **Description:** Provide a minimal, fast-path onboarding kit so a new constituent can vote quickly.
- **Acceptance Criteria:**
  - Kit includes: onboarding steps, sync checklist, vote format example, and “first vote” walkthrough.
  - Kit is linked from README and/or `MEMBERSHIP.md`.
  - Kit explicitly states prerequisites for voting.
- **Dependencies:** STORY-0113
- **Risk:** Medium
- **Architectural Impact:** Low
- **Notes/Evidence:** See BOOTSTRAP_SENATE.md for context.

- **ID:** STORY-0116
- **Title:** Voting readiness checklist
- **Description:** Define the minimal conditions a constituent must meet before voting.
- **Acceptance Criteria:**
  - Checklist includes membership entry, law sync status, and `.senate-sync.json` presence.
  - Checklist is used during sprint sync and onboarding.
  - Checklist has a single “ready/not ready” outcome.
- **Dependencies:** STORY-0110, STORY-0007
- **Risk:** Low
- **Architectural Impact:** Low
- **Notes/Evidence:** See BOOTSTRAP_SENATE.md for context.

- **ID:** STORY-0117
- **Title:** First vote walkthrough
- **Description:** Provide a step-by-step example of submitting a valid vote comment.
- **Acceptance Criteria:**
  - Walkthrough references the correct vote format from LAW-012.
  - Includes a worked example and how to verify it was counted.
  - Clearly explains vote timing and labels.
- **Dependencies:** STORY-0113
- **Risk:** Low
- **Architectural Impact:** Low
- **Notes/Evidence:** See BOOTSTRAP_SENATE.md for context.

- **ID:** STORY-0118
- **Title:** Constituent identity canonicalization
- **Description:** Define the canonical project identifier to use in votes to avoid mismatched naming.
- **Acceptance Criteria:**
  - Canonical format is documented (e.g., `org/repo`).
  - `MEMBERSHIP.md` entries align with the canonical format.
  - Voting instructions reference the canonical format.
- **Dependencies:** STORY-0013
- **Risk:** Medium
- **Architectural Impact:** Low
- **Notes/Evidence:** See BOOTSTRAP_SENATE.md for context.

- **ID:** STORY-0119
- **Title:** Voting notification path
- **Description:** Document how constituents learn that a vote is open and when it closes.
- **Acceptance Criteria:**
  - Notification mechanism documented (labels, GitHub watch settings, mention policy).
  - Timeline expectations are explicit.
  - Linked from onboarding kit and voting guide.
- **Dependencies:** STORY-0110
- **Risk:** Low
- **Architectural Impact:** Low
- **Notes/Evidence:** See BOOTSTRAP_SENATE.md for context.

- **ID:** STORY-0124
- **Title:** Voting eligibility gate in sync protocol
- **Description:** Add a voting readiness gate to the sprint sync protocol.
- **Acceptance Criteria:**
  - `sync/README.md` and `templates/sprint-sync-checklist.md` include the gate.
  - Gate uses the voting readiness checklist.
  - Procedure defines how to remediate missing requirements.
- **Dependencies:** STORY-0116
- **Risk:** Low
- **Architectural Impact:** Low
- **Notes/Evidence:** See BOOTSTRAP_SENATE.md for context.

- **ID:** STORY-0101
- **Title:** Provide automated bootstrap verification script
- **Description:** Add a script to validate that a freshly bootstrapped repo contains all required artifacts.
- **Acceptance Criteria:**
  - Script checks for `.project_management/` structure, laws, sync file, and AI entrypoint.
  - Script exits non-zero on missing or malformed files.
  - Document how to run it after bootstrap.
- **Dependencies:** STORY-0005, STORY-0006
- **Risk:** Medium
- **Architectural Impact:** Low
- **Notes/Evidence:** See BOOTSTRAP_SENATE.md for context.

- **ID:** STORY-0102
- **Title:** Provide example bootstrap transcript
- **Description:** Create a short, real example showing a bootstrap session and resulting files.
- **Acceptance Criteria:**
  - Example shows the single-line instruction used.
  - Example lists resulting files and key outputs.
  - Example avoids leaking secrets or tokens.
- **Dependencies:** STORY-0012
- **Risk:** Low
- **Architectural Impact:** Low
- **Notes/Evidence:** See BOOTSTRAP_SENATE.md for context.

- **ID:** STORY-0103
- **Title:** Clarify environment detection edge cases
- **Description:** Document how the initiator handles repos with non-code content or unusual structures.
- **Acceptance Criteria:**
  - Edge cases described in initiator or a linked doc.
  - Decision logic is unambiguous and testable.
- **Dependencies:** STORY-0002
- **Risk:** Low
- **Architectural Impact:** Low
- **Notes/Evidence:** See BOOTSTRAP_SENATE.md for context.

- **ID:** STORY-0104
- **Title:** Provide guidance for no-GitHub environments
- **Description:** Document how to bootstrap in air-gapped or non-GitHub environments.
- **Acceptance Criteria:**
  - README includes a path for manual download and local use.
  - Integrity verification still works offline with local files.
- **Dependencies:** STORY-0003
- **Risk:** Medium
- **Architectural Impact:** Low
- **Notes/Evidence:** See BOOTSTRAP_SENATE.md for context.

- **ID:** STORY-0105
- **Title:** Consolidate law mapping table
- **Description:** Maintain a single authoritative mapping of LAW files to local rules filenames.
- **Acceptance Criteria:**
  - Mapping table appears in a single place and is referenced elsewhere.
  - Table includes all 13 laws and filenames.
- **Dependencies:** STORY-0006
- **Risk:** Low
- **Architectural Impact:** Low
- **Notes/Evidence:** See BOOTSTRAP_SENATE.md for context.

- **ID:** STORY-0106
- **Title:** Add validation for law hash changes
- **Description:** Add a check to ensure `sync/manifest.json` hashes change when law content changes.
- **Acceptance Criteria:**
  - A CI or script detects mismatches between laws and manifest.
  - Document the update process.
- **Dependencies:** STORY-0003, STORY-0006
- **Risk:** Medium
- **Architectural Impact:** Low
- **Notes/Evidence:** See BOOTSTRAP_SENATE.md for context.

- **ID:** STORY-0107
- **Title:** Define versioning strategy for laws
- **Description:** Document how law versions are tracked and updated across changes.
- **Acceptance Criteria:**
  - A section in `laws/README.md` (or equivalent) describes versioning.
  - Version changes are reflected in manifest metadata.
- **Dependencies:** STORY-0006
- **Risk:** Low
- **Architectural Impact:** Low
- **Notes/Evidence:** See BOOTSTRAP_SENATE.md for context.

- **ID:** STORY-0108
- **Title:** Clarify executive override process
- **Description:** Expand documentation for executive overrides to reduce ambiguity.
- **Acceptance Criteria:**
  - `executive/README.md` clearly describes override workflow.
  - Example override records are included or templated.
- **Dependencies:** None
- **Risk:** Low
- **Architectural Impact:** Low
- **Notes/Evidence:** See BOOTSTRAP_SENATE.md for context.

- **ID:** STORY-0109
- **Title:** Add onboarding FAQ
- **Description:** Provide a concise FAQ addressing common bootstrap issues.
- **Acceptance Criteria:**
  - FAQ covers integrity failures, missing tokens, and `.project_management/` errors.
  - Linked from README.
- **Dependencies:** STORY-0012
- **Risk:** Low
- **Architectural Impact:** Low
- **Notes/Evidence:** See BOOTSTRAP_SENATE.md for context.

## P2 (Nice to have)

- **ID:** STORY-0201
- **Title:** Bootstrap helper CLI
- **Description:** Provide a small CLI wrapper to perform the bootstrap steps automatically.
- **Acceptance Criteria:**
  - CLI performs integrity verification and downloads skeleton + laws.
  - CLI supports a dry-run mode.
  - Documentation explains how to install and run it.
- **Dependencies:** STORY-0002, STORY-0003
- **Risk:** Medium
- **Architectural Impact:** Medium
- **Notes/Evidence:** Optional; must not replace the single-line AI instruction.

- **ID:** STORY-0202
- **Title:** Add example constituent repo
- **Description:** Publish a minimal example repo that has been bootstrapped.
- **Acceptance Criteria:**
  - Example repo contains `.project_management/` and `.senate-sync.json`.
  - README links back to this repo.
- **Dependencies:** STORY-0012
- **Risk:** Low
- **Architectural Impact:** Low
- **Notes/Evidence:** See BOOTSTRAP_SENATE.md for context.

- **ID:** STORY-0203
- **Title:** Provide multilingual bootstrap prompts
- **Description:** Provide translated bootstrap instructions for non-English teams.
- **Acceptance Criteria:**
  - Translations include the single-line prompt and no-web fallback.
  - Each translation references the same initiator URL.
- **Dependencies:** STORY-0001
- **Risk:** Low
- **Architectural Impact:** Low
- **Notes/Evidence:** See BOOTSTRAP_SENATE.md for context.

- **ID:** STORY-0210
- **Title:** Define self-audit scope and signals
- **Description:** Specify what the system should analyze to detect governance gaps and improvement opportunities.
- **Acceptance Criteria:**
  - A checklist or spec enumerates signals (missing docs, stale laws, conflicts, process gaps).
  - Each signal maps to a bill type (new law, amendment, repeal, feedback).
  - Safety constraints and HITL gates are explicit.
- **Dependencies:** STORY-0110
- **Risk:** Medium
- **Architectural Impact:** Low
- **Notes/Evidence:** See BOOTSTRAP_SENATE.md for context.

- **ID:** STORY-0211
- **Title:** Build bill draft generator specification
- **Description:** Define a structured bill draft format compatible with LAW-012 and the issue templates.
- **Acceptance Criteria:**
  - Template includes title, motivation, scope, and enforcement details.
  - Mapping from self-audit findings to bill fields is defined.
  - Examples exist for a new law and an amendment.
- **Dependencies:** STORY-0210
- **Risk:** Medium
- **Architectural Impact:** Low
- **Notes/Evidence:** See BOOTSTRAP_SENATE.md for context.

- **ID:** STORY-0212
- **Title:** Implement bill submission flow with HITL
- **Description:** Provide a manual or scripted process that submits drafted bills to GitHub as issues.
- **Acceptance Criteria:**
  - Submission uses the correct issue template.
  - Requires explicit user confirmation before creating the issue.
  - Records the submission in a consistent place.
- **Dependencies:** STORY-0211
- **Risk:** High
- **Architectural Impact:** Medium
- **Notes/Evidence:** See BOOTSTRAP_SENATE.md for context.

- **ID:** STORY-0213
- **Title:** Self-analysis report artifact
- **Description:** Produce a report format that captures findings and proposed actions.
- **Acceptance Criteria:**
  - Report includes date, findings, severity, and proposed bill references.
  - Stored in a documented location (e.g., `reports/` or `docs/`).
  - Linked from the submitted bill for traceability.
- **Dependencies:** STORY-0210
- **Risk:** Low
- **Architectural Impact:** Low
- **Notes/Evidence:** See BOOTSTRAP_SENATE.md for context.

## Archive (Completed)

- **ID:** STORY-0218
- **Title:** Enforce PR-only main rule via governance bill
- **Closed in sprint:** Sprint-003
- **Evidence:** `.project_management/completed_sprints/sprint-003.md`

- **ID:** STORY-0110
- **Title:** Define bill intake and triage workflow
- **Closed in sprint:** Sprint-003
- **Evidence:** `.project_management/completed_sprints/sprint-003.md`

- **ID:** STORY-0111
- **Title:** Standardize voting lifecycle and decision recording
- **Closed in sprint:** Sprint-003
- **Evidence:** `.project_management/completed_sprints/sprint-003.md`

- **ID:** STORY-0112
- **Title:** Publish vote tally procedure and archival format
- **Closed in sprint:** Sprint-003
- **Evidence:** `.project_management/completed_sprints/sprint-003.md`

- **ID:** STORY-0113
- **Title:** Update contributor guidance for proposing and voting
- **Closed in sprint:** Sprint-003
- **Evidence:** `.project_management/completed_sprints/sprint-003.md`

- **ID:** STORY-0114
- **Title:** Executive override integration
- **Closed in sprint:** Sprint-003
- **Evidence:** `.project_management/completed_sprints/sprint-003.md`

- **ID:** STORY-0001
- **Title:** Publish one-line bootstrap instruction in README
- **Closed in sprint:** Sprint-000
- **Evidence:** `.project_management/completed_sprints/sprint-000.md`

- **ID:** STORY-0002
- **Title:** Maintain bootstrap initiator as the single source of truth
- **Closed in sprint:** Sprint-000
- **Evidence:** `.project_management/completed_sprints/sprint-000.md`

- **ID:** STORY-0003
- **Title:** Integrity manifest and verification script
- **Closed in sprint:** Sprint-000
- **Evidence:** `.project_management/completed_sprints/sprint-000.md`

- **ID:** STORY-0005
- **Title:** Publish complete PM skeleton
- **Closed in sprint:** Sprint-000
- **Evidence:** `.project_management/completed_sprints/sprint-000.md`

- **ID:** STORY-0006
- **Title:** Ensure active laws and sync manifest are consistent
- **Closed in sprint:** Sprint-000
- **Evidence:** `.project_management/completed_sprints/sprint-000.md`

- **ID:** STORY-0007
- **Title:** Document the sprint sync protocol
- **Closed in sprint:** Sprint-000
- **Evidence:** `.project_management/completed_sprints/sprint-000.md`

- **ID:** STORY-0008
- **Title:** Provide bootstrap guides for new and existing projects
- **Closed in sprint:** Sprint-000
- **Evidence:** `.project_management/completed_sprints/sprint-000.md`

- **ID:** STORY-0125
- **Title:** Sprint review rating system
- **Closed in sprint:** Sprint-000
- **Evidence:** `.project_management/completed_sprints/sprint-000.md`

- **ID:** STORY-0126
- **Title:** Enable GitHub code scanning (CodeQL)
- **Closed in sprint:** Sprint-000
- **Evidence:** `.project_management/completed_sprints/sprint-000.md`

- **ID:** STORY-0004
- **Title:** Secondary verification gist alignment
- **Closed in sprint:** Sprint-001
- **Evidence:** `.project_management/completed_sprints/sprint-001.md`

- **ID:** STORY-0009
- **Title:** Provide BOOTSTRAP input template for constituents
- **Closed in sprint:** Sprint-001
- **Evidence:** `.project_management/completed_sprints/sprint-001.md`

- **ID:** STORY-0010
- **Title:** Local laws template for constituents
- **Closed in sprint:** Sprint-001
- **Evidence:** `.project_management/completed_sprints/sprint-001.md`

- **ID:** STORY-0011
- **Title:** Integrity CI workflow
- **Closed in sprint:** Sprint-001
- **Evidence:** `.project_management/completed_sprints/sprint-001.md`

- **ID:** STORY-0012
- **Title:** Bootstrap smoke test checklist
- **Closed in sprint:** Sprint-001
- **Evidence:** `.project_management/completed_sprints/sprint-001.md`

- **ID:** STORY-0013
- **Title:** Membership onboarding guidance
- **Closed in sprint:** Sprint-001
- **Evidence:** `.project_management/completed_sprints/sprint-001.md`

- **ID:** STORY-0214
- **Title:** Sprint closeout governance enhancements
- **Closed in sprint:** Sprint-002
- **Evidence:** `.project_management/completed_sprints/sprint-002.md`

- **ID:** STORY-0215
- **Title:** Phase-end assessment framework
- **Closed in sprint:** Sprint-002
- **Evidence:** `.project_management/completed_sprints/sprint-002.md`

- **ID:** STORY-0216
- **Title:** Quality toolchain baseline and enforcement
- **Closed in sprint:** Sprint-002
- **Evidence:** `.project_management/completed_sprints/sprint-002.md`

- **ID:** STORY-0217
- **Title:** Autonomous AI development risk research and mitigation proposals
- **Closed in sprint:** Sprint-002
- **Evidence:** `.project_management/completed_sprints/sprint-002.md`
