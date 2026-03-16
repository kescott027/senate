# Backlog (Authoritative)

This file is the authoritative backlog for all planned work. Stories are listed in strict priority order.

## Backlog Index

- Last updated: 2026-03-15
- Total story count: 48
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

## P2 (Nice to have)

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

- **ID:** STORY-0101
- **Title:** Provide automated bootstrap verification script
- **Closed in sprint:** Sprint-005
- **Evidence:** `.project_management/completed_sprints/sprint-005.md`

- **ID:** STORY-0102
- **Title:** Provide example bootstrap transcript
- **Closed in sprint:** Sprint-005
- **Evidence:** `.project_management/completed_sprints/sprint-005.md`

- **ID:** STORY-0103
- **Title:** Clarify environment detection edge cases
- **Closed in sprint:** Sprint-005
- **Evidence:** `.project_management/completed_sprints/sprint-005.md`

- **ID:** STORY-0104
- **Title:** Provide guidance for no-GitHub environments
- **Closed in sprint:** Sprint-005
- **Evidence:** `.project_management/completed_sprints/sprint-005.md`

- **ID:** STORY-0105
- **Title:** Consolidate law mapping table
- **Closed in sprint:** Sprint-006
- **Evidence:** `.project_management/completed_sprints/sprint-006.md`

- **ID:** STORY-0106
- **Title:** Add validation for law hash changes
- **Closed in sprint:** Sprint-006
- **Evidence:** `.project_management/completed_sprints/sprint-006.md`

- **ID:** STORY-0107
- **Title:** Define versioning strategy for laws
- **Closed in sprint:** Sprint-006
- **Evidence:** `.project_management/completed_sprints/sprint-006.md`

- **ID:** STORY-0108
- **Title:** Clarify executive override process
- **Closed in sprint:** Sprint-007
- **Evidence:** `.project_management/completed_sprints/sprint-007.md`

- **ID:** STORY-0109
- **Title:** Add onboarding FAQ
- **Closed in sprint:** Sprint-007
- **Evidence:** `.project_management/completed_sprints/sprint-007.md`

- **ID:** STORY-0201
- **Title:** Bootstrap helper CLI
- **Closed in sprint:** Sprint-008
- **Evidence:** `.project_management/completed_sprints/sprint-008.md`

- **ID:** STORY-0115
- **Title:** Constituent onboarding kit (voting-ready)
- **Closed in sprint:** Sprint-004
- **Evidence:** `.project_management/completed_sprints/sprint-004.md`

- **ID:** STORY-0116
- **Title:** Voting readiness checklist
- **Closed in sprint:** Sprint-004
- **Evidence:** `.project_management/completed_sprints/sprint-004.md`

- **ID:** STORY-0117
- **Title:** First vote walkthrough
- **Closed in sprint:** Sprint-004
- **Evidence:** `.project_management/completed_sprints/sprint-004.md`

- **ID:** STORY-0118
- **Title:** Constituent identity canonicalization
- **Closed in sprint:** Sprint-004
- **Evidence:** `.project_management/completed_sprints/sprint-004.md`

- **ID:** STORY-0119
- **Title:** Voting notification path
- **Closed in sprint:** Sprint-004
- **Evidence:** `.project_management/completed_sprints/sprint-004.md`

- **ID:** STORY-0124
- **Title:** Voting eligibility gate in sync protocol
- **Closed in sprint:** Sprint-004
- **Evidence:** `.project_management/completed_sprints/sprint-004.md`

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
