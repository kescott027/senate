# Epics

## EPIC-001: One-Line Bootstrap Flow (MVP)
- Phase: 1
- Outcome: A single-line instruction in `README.md` that allows any AI agent to bootstrap governance safely and reliably.
- Dependencies: Integrity manifest, bootstrap guides, skeleton, laws.
- Risks: Documentation drift; integrity verification skipped; external service availability.
- Exit criteria:
  - README includes a copy-paste instruction that fetches and executes `bootstrap/initiator.md`.
  - Initiator performs integrity verification and environment detection.
  - At least three smoke tests (empty repo, new repo, existing repo) pass end-to-end.

## EPIC-002: Governance Artifact Set
- Phase: 0
- Outcome: Complete, versioned laws, constitution, and sync manifest suitable for automation.
- Dependencies: None.
- Risks: Documentation drift; integrity verification skipped; external service availability.
- Exit criteria:
  - 13 active laws exist in `laws/active/` with hashes in `sync/manifest.json`.
  - `CONSTITUTION.md` and `MEMBERSHIP.md` are present and referenced in README.
  - Integrity checks cover all critical files.

## EPIC-003: Project Management Skeleton
- Phase: 0
- Outcome: A complete `.project_management/` template for constituent projects.
- Dependencies: Governance Artifact Set.
- Risks: Documentation drift; integrity verification skipped; external service availability.
- Exit criteria:
  - Skeleton includes all required files and empty directories with `.gitkeep`.
  - Story and sprint templates match LAW-002 and LAW-001.
  - BLOCKER management rules present and mapped to LAW-011.

## EPIC-004: Bootstrap Guides and Templates
- Phase: 1
- Outcome: Clear, step-by-step guides and templates for new and existing projects.
- Dependencies: Governance Artifact Set, Project Management Skeleton.
- Risks: Documentation drift; integrity verification skipped; external service availability.
- Exit criteria:
  - `project_management_bootstrapping.md` and `project_management_bootstrapping_existing.md` are complete.
  - Templates for sprint sync and local laws exist and are referenced.
  - Guides include HITL gate guidance for security posture changes.

## EPIC-005: Law Proposal and Voting System
- Phase: 2
- Outcome: A structured, collaborative process for proposing laws, collecting votes, and recording decisions.
- Dependencies: Governance Artifact Set, Bootstrap Guides and Templates.
- Risks: Documentation drift; integrity verification skipped; external service availability.
- Exit criteria:
  - Proposal intake and triage workflow is documented end-to-end (proposal → review → voting → decision).
  - Voting format and tally rules are standardized and referenced by templates.
  - Decision artifacts are recorded with outcome, quorum, and enactment status.
  - Executive override pathway is clearly integrated with the voting process.

## EPIC-006: Self-Analysis and Automated Bill Submission
- Phase: 3
- Outcome: A system that can self-audit governance gaps, draft bills, and submit them for review.
- Dependencies: Law Proposal and Voting System.
- Risks: Documentation drift; integrity verification skipped; external service availability.
- Exit criteria:
  - Self-audit checklist or script identifies governance gaps and conflicts.
  - Bill draft generator produces structured proposals aligned with LAW-012.
  - Submission flow supports GitHub Issue creation with HITL gating.

