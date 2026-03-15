# Bootstrapping Existing Projects

## Purpose

This document provides step-by-step instructions for an AI agent to bootstrap `.project_management/` governance on an **existing, in-progress project** — a codebase that already has code, history, dependencies, and possibly ad-hoc processes in place.

This is the companion to `project_management_bootstrapping.md` (which covers net-new projects). For existing projects, the AI must first **discover and assess** the current state before scaffolding governance. Skipping discovery leads to governance artifacts that don't reflect reality, creating drift from day one.

## When to Use This Guide

Use this guide when **any** of the following are true:
- The repository has existing code beyond initial scaffolding.
- There is git history with meaningful commits.
- CI/CD pipelines, security scans, or other automation exist.
- The project has existing documentation (README, CLAUDE.md, docs/, etc.).
- There are open PRs, issues, or in-flight work.
- Dependencies have been installed or vendored.

If the project is truly empty (freshly created repo, no code), use `project_management_bootstrapping.md` directly.

## Overview

```
Phase 0: Safety Checks and Access Verification
Phase 1: Codebase Discovery and Inventory
Phase 2: Security Baseline
Phase 3: Architecture Extraction
Phase 4: Existing Governance Reconciliation
Phase 5: Vision and State Derivation
Phase 6: Generate BOOTSTRAP.md (or validate owner-provided one)
Phase 7: Standard Bootstrap (hand off to project_management_bootstrapping.md)
```

---

## Phase 0: Safety Checks and Access Verification

Before touching anything, verify the environment is safe to operate in.

### Step 0.1 — Verify repository integrity

```
git status
git log --oneline -20
git remote -v
git branch -a
```

Check for:
- [ ] Clean working tree (no uncommitted changes that aren't yours).
- [ ] Remote is correctly configured and reachable.
- [ ] You are on the expected branch (typically `main` or a feature branch).
- [ ] No force-push history or rebase in progress.

**If the working tree has uncommitted changes**: DO NOT proceed. Document what you found and ask the owner whether to stash, commit, or discard. These may be in-progress work.

### Step 0.2 — Verify token access

If the project uses GitHub or other APIs:
- Confirm the token file exists and has content (check byte count, never echo the token).
- Test API access with a read-only call (e.g., `GET /repos/{owner}/{repo}`).
- Record the token scopes and permissions.
- Note any scopes that seem overly broad — flag for owner review per LAW-004 (principle of least privilege).

### Step 0.3 — Check for existing AI guidance

Look for:
- `CLAUDE.md` or similar AI instruction files
- `.cursorrules`, `.github/copilot-instructions.md`, or equivalent
- `AI_ENTRYPOINT.md` (may already exist from prior work)
- `CONTRIBUTING.md`, `DEVELOPMENT.md`

If found, **read them all**. They contain project-specific constraints that must be respected and incorporated into the governance scaffold. Record their locations for reference in the final `AI_ENTRYPOINT.md`.

### Step 0.4 — Check for existing project management

Look for:
- `.project_management/` directory
- Project boards, milestones, or labels on GitHub
- Issue trackers or external PM references in docs
- `TODO.md`, `ROADMAP.md`, `CHANGELOG.md`

If `.project_management/` already exists, this is a **governance upgrade**, not a fresh bootstrap. See [Appendix: Governance Upgrade Path](#appendix-governance-upgrade-path).

---

## Phase 1: Codebase Discovery and Inventory

The goal is to build a complete mental model of what exists before making any governance decisions.

### Step 1.1 — Repository structure scan

Map the top-level directory structure and key subdirectories:

```
# Top-level layout
ls -la

# Key directories (language-dependent)
find . -maxdepth 3 -type d -not -path './.git/*' -not -path '*/node_modules/*' -not -path '*/venv/*' -not -path '*/.venv/*' -not -path '*/vendor/*'
```

Record:
- Source code directories and their languages
- Documentation directories
- Configuration directories
- Build/output directories
- Test directories
- Scripts and tooling

### Step 1.2 — Language and technology inventory

Identify:
- Primary language(s) and their versions
- Build system(s) (make, cmake, cargo, npm, pip, go mod, etc.)
- Package managers and lock files
- Frameworks and major libraries
- Runtime requirements

### Step 1.3 — Dependency audit

```
# Examples by ecosystem:
# Go:    go list -m all
# Node:  cat package.json | jq '.dependencies, .devDependencies'
# Python: cat requirements.txt or pip freeze
# Rust:  cat Cargo.lock | head -100
# C/C++: check CMakeLists.txt, .gitmodules, vendored dirs
```

Record:
- Total dependency count
- Submodules (`.gitmodules`)
- Vendored code locations
- Any known vulnerable or deprecated dependencies

### Step 1.4 — CI/CD inventory

Check for:
- `.github/workflows/*.yml` (GitHub Actions)
- `.gitlab-ci.yml`, `Jenkinsfile`, `.circleci/`, etc.
- Pre-commit hooks (`.pre-commit-config.yaml`, `.husky/`)
- Code quality configs (`.eslintrc`, `.golangci.yml`, `rustfmt.toml`, etc.)

Record what pipelines exist, what they test, and their current status.

### Step 1.5 — Git history analysis

```
# Contribution summary
git shortlog -sn --no-merges | head -20

# Recent activity
git log --oneline --since="30 days ago" | head -30

# Active branches
git branch -r --sort=-committerdate | head -10

# Open PRs (if GitHub)
# gh pr list --state open
```

Record:
- Active contributors
- Recent velocity (commits per week)
- Active branches and their purpose
- Open PRs and their scope

### Step 1.6 — Documentation inventory

Scan for all documentation:

```
find . -name '*.md' -not -path './.git/*' -not -path '*/node_modules/*' -not -path '*/venv/*' | head -50
find . -name '*.rst' -not -path './.git/*' | head -20
```

Read `README.md` in full. Skim other key docs. Record:
- What documentation exists
- How current it appears (check git blame dates)
- Gaps between code and docs

---

## Phase 2: Security Baseline

Establish the security posture before any governance changes. This is the "measure before you cut" step.

### Step 2.1 — GitHub security feature audit

If the project is on GitHub, check all three scanning features:

```
# Code scanning (CodeQL)
GET /repos/{owner}/{repo}/code-scanning/alerts?state=open&per_page=100

# Secret scanning
GET /repos/{owner}/{repo}/secret-scanning/alerts?per_page=100

# Dependabot
GET /repos/{owner}/{repo}/dependabot/alerts?per_page=100
```

For each endpoint, record:
- HTTP status code (200 = enabled, 404 = not enabled, 403 = insufficient permissions)
- Alert count and severity breakdown if enabled
- Whether alerts are actionable (source code) vs noise (build deps, vendored)

**HITL gate check**: If any security feature needs to be *enabled* (not just read), this is a security posture change. Per LAW-011 HITL rule and LAW-009 Workflow C, you MUST:
1. File a blocker documenting the required change
2. Set `pending_hitl_gate` in state
3. Stop and wait for owner approval

Do NOT enable features autonomously, even if you have admin access.

### Step 2.2 — Local security scan

If GitHub scans are unavailable or incomplete, perform local checks:

- **Secrets in code**: Search for patterns like API keys, tokens, passwords in source files (not in `.git/`).
- **Hardcoded credentials**: Check config files for plaintext secrets.
- **Insecure patterns**: grep for known-dangerous patterns (`eval(`, `exec(`, `system(`, `dangerouslySetInnerHTML`, SQL string concatenation, etc.).

Record findings in a structured format — these become backlog items.

### Step 2.3 — Dependency vulnerability check

If Dependabot is unavailable:
- Check for known CVEs in dependencies using ecosystem-specific tools.
- Note outdated dependencies that may have security patches available.

### Step 2.4 — Produce security findings document

Create `docs/security/scan-findings.md` (or equivalent path appropriate to the project) with:
- Scan date and methods used
- Feature status (enabled/disabled for each scan type)
- Categorized findings (actionable vs noise)
- Severity breakdown
- Recommended next steps

This document becomes evidence for the bootstrap sprint.

---

## Phase 3: Architecture Extraction

Derive the architecture from what exists rather than asking the owner to describe it from memory.

### Step 3.1 — Entry points and interfaces

Identify:
- Main entry points (main(), index.js, app.py, etc.)
- API endpoints (REST, GraphQL, gRPC)
- CLI commands
- Background workers, cron jobs, scheduled tasks
- Plugin/extension interfaces

### Step 3.2 — Component mapping

From the code structure and imports, identify:
- Major modules/packages and their responsibilities
- Internal API boundaries (what calls what)
- Data models and storage (databases, file storage, caches)
- External service integrations

### Step 3.3 — Configuration and deployment

Identify:
- Configuration files and their formats
- Environment variables used
- Deployment method (containers, packages, installers, etc.)
- Infrastructure requirements (OS, runtime, services)

### Step 3.4 — Trust boundaries

Map:
- Network exposure (listening ports, public endpoints)
- Authentication and authorization mechanisms
- Privileged operations (setuid, capabilities, sudo, admin APIs)
- Data sensitivity levels (PII, credentials, telemetry)

### Step 3.5 — Produce architecture summary

Write a structured architecture summary covering:
- System overview (2-3 paragraphs)
- Component inventory table
- Key data flows
- Trust boundaries and security-relevant interfaces
- Known architectural debt or risks

This feeds directly into the Architecture section of BOOTSTRAP.md.

---

## Phase 4: Existing Governance Reconciliation

If the project has any existing governance artifacts, reconcile them with the senate framework.

### Step 4.1 — Inventory existing rules

Collect all existing governance-like artifacts:
- `CLAUDE.md` rules → map to senate laws or local laws
- `CONTRIBUTING.md` processes → check for conflicts with senate sprint/PR rules
- Existing issue templates → check for overlap with senate bill templates
- CI enforcement rules → map to LAW-003 (engineering standards)
- Existing code review processes → map to LAW-008 (review cadence)
- If local laws are needed, seed `local-laws/README.md` from `templates/local-laws-readme.md`.

### Step 4.2 — Conflict analysis

For each existing rule or process:

| Existing rule | Senate law | Conflict? | Resolution |
|---------------|------------|-----------|------------|
| | | yes/no/extends | keep both / merge / local law / file amendment |

Conflicts must be resolved before proceeding:
- If the existing rule is stricter than the senate law: keep as a local law.
- If the existing rule contradicts a senate law: the senate law prevails per CONSTITUTION.md. File a FEEDBACK issue if the existing rule has merit.
- If the existing rule extends a senate law: keep as a local law and consider filing a BILL_AMENDMENT.

### Step 4.3 — Preserve existing artifacts

Do NOT delete or overwrite existing governance artifacts during bootstrap. Instead:
- Copy useful content into the new `.project_management/` structure.
- Reference originals in `AI_ENTRYPOINT.md`.
- If `CLAUDE.md` exists, it remains authoritative for code-level guidance. The `.project_management/` rules govern process, not code style.

---

## Phase 5: Vision and State Derivation

For existing projects, the vision may not be explicitly written down. Derive it from evidence.

### Step 5.1 — Extract vision from existing docs

Sources (in priority order):
1. `README.md` — often contains the clearest project description
2. Repository description on GitHub
3. Documentation index or landing page
4. Package metadata (package.json description, Cargo.toml description, setup.py, etc.)
5. Commit history patterns (what kind of work is being done?)

Synthesize into:
- Problem statement
- Target users
- Success criteria (may need owner input if not derivable)
- Non-goals (may need owner input)

### Step 5.2 — Assess current state

Determine where the project is in its lifecycle:
- **Phase 0** — still scaffolding, no users, architecture in flux
- **Phase 1** — functional prototype, early users or internal use
- **Phase 2** — production use, stability matters, operational concerns
- **Phase 3** — scaling, enterprise features, multi-tenant

This determines the starting phase in `current_state.json` and which quality gates apply.

### Step 5.3 — Identify in-flight work

From open PRs, recent branches, and recent commits:
- What is actively being worked on?
- What appears stalled or abandoned?
- Are there any partially completed features?

These become the initial backlog items, potentially already "in progress."

### Step 5.4 — Identify known issues and debt

From:
- GitHub Issues (open)
- TODO/FIXME/HACK comments in code
- Known failing tests
- Security findings from Phase 2
- Dependency update needs

These become backlog items with appropriate priority.

---

## Phase 6: Generate or Validate BOOTSTRAP.md

### If the owner provided BOOTSTRAP.md

Validate it against what you discovered:
- Does the architecture section match the actual code?
- Are the backlog items consistent with known issues and in-flight work?
- Are there security findings that are missing from the backlog?
- Are dependencies and access requirements complete?

If there are significant gaps, flag them to the owner before proceeding. Update BOOTSTRAP.md with discovered information (or recommend updates).

### If the owner did NOT provide BOOTSTRAP.md

Generate one from your discovery:

1. Copy the template from `kescott027/senate/BOOTSTRAP.md`.
2. Fill in each section from your Phase 1-5 findings:
   - **Project Identity**: from repo metadata
   - **Vision**: from Step 5.1
   - **Architecture**: from Phase 3 summary
   - **Critical Rules**: from existing `CLAUDE.md` and governance artifacts
   - **Key Deliverables**: derived from vision + current state + known gaps
   - **Backlog**: from in-flight work (Step 5.3) + known issues (Step 5.4) + security findings (Phase 2)
   - **External Dependencies**: from Step 0.2 + Phase 1 dependency audit
   - **Additional Data Files**: reference existing docs discovered in Phase 1
   - **Sprint-000 Guidance**: based on most urgent findings (security baseline is often Sprint-000 for existing projects)
   - **HITL Gates**: based on security posture + deployment sensitivity

3. Present the generated BOOTSTRAP.md to the owner for review before proceeding to Phase 7. This is a **mandatory owner review checkpoint** — do not skip it.

---

## Phase 7: Standard Bootstrap

Once BOOTSTRAP.md is complete and validated, hand off to the standard bootstrap process:

**Follow `project_management_bootstrapping.md` starting from Phase 1.**

The only differences for existing projects:
- Sprint-000 may focus on security baseline and governance setup rather than feature scaffolding.
- The backlog will include discovered issues and security findings alongside planned work.
- `AI_ENTRYPOINT.md` should reference existing artifacts (CLAUDE.md, docs/, etc.) in addition to `.project_management/`.
- The starting phase in `current_state.json` may be 1 or 2 (not 0) if the project is already past scaffolding.

---

## Appendix: Existing Project Discovery Checklist

Use this as a quick reference during Phases 0-5.

### Safety (Phase 0)
- [ ] Working tree is clean (or owner-acknowledged dirty state)
- [ ] Remote is reachable and branch is correct
- [ ] Token access verified (read-only test)
- [ ] Token scopes documented and least-privilege assessed
- [ ] Existing AI guidance files read (CLAUDE.md, etc.)
- [ ] Existing project management artifacts inventoried

### Codebase (Phase 1)
- [ ] Directory structure mapped
- [ ] Languages and technologies identified
- [ ] Dependencies audited (count, lock files, submodules, vendored)
- [ ] CI/CD pipelines inventoried and status checked
- [ ] Git history analyzed (contributors, velocity, branches, open PRs)
- [ ] Documentation inventoried and freshness assessed

### Security (Phase 2)
- [ ] GitHub security features status checked (CodeQL, secret scanning, Dependabot)
- [ ] HITL gate filed if features need enabling
- [ ] Local security patterns checked (secrets in code, insecure patterns)
- [ ] Dependency vulnerabilities assessed
- [ ] Security findings document produced

### Architecture (Phase 3)
- [ ] Entry points and interfaces identified
- [ ] Component responsibilities mapped
- [ ] Configuration and deployment method documented
- [ ] Trust boundaries and security interfaces mapped
- [ ] Architecture summary produced

### Governance (Phase 4)
- [ ] Existing rules inventoried
- [ ] Conflict analysis against senate laws complete
- [ ] Resolution plan for each conflict documented
- [ ] Existing artifacts preserved (not deleted)

### State (Phase 5)
- [ ] Vision derived or extracted from docs
- [ ] Project lifecycle phase assessed
- [ ] In-flight work identified
- [ ] Known issues and debt cataloged

### BOOTSTRAP.md (Phase 6)
- [ ] BOOTSTRAP.md generated or validated against discovery
- [ ] Owner has reviewed BOOTSTRAP.md (mandatory checkpoint)

---

## Appendix: Governance Upgrade Path

If `.project_management/` already exists but was created outside the senate framework:

1. **Do NOT delete it.** Existing logs, sprint history, and state are valuable.
2. **Diff against the skeleton.** Identify missing files and structural gaps.
3. **Add missing files** from the skeleton without overwriting existing content.
4. **Reconcile rules.** Compare existing `rules/` against senate laws per Phase 4.
5. **Backfill state.** Ensure `current_state.json` accurately reflects the current sprint and story state.
6. **Sync with senate.** Create `.senate-sync.json` and download current laws.
7. **Log the upgrade.** Create a log entry with `change_type="correct"` documenting the governance upgrade.
8. **Update AI_ENTRYPOINT.md** to reference senate governance and the sync protocol.

---

## Appendix: Common Mistakes with Existing Projects

1. **Scanning without permission.** Security scans can trigger alerts or rate limits. Verify you have appropriate access before scanning.
2. **Enabling security features without HITL.** This was the exact failure that led to this guide's creation. Always file a blocker and set the gate.
3. **Overwriting existing work.** Uncommitted changes, open branches, and in-progress PRs are someone's work. Never discard them.
4. **Assuming the README is current.** Documentation often drifts from code. Validate architecture claims against actual code structure.
5. **Ignoring existing governance.** A project may have informal but effective processes. Understand them before imposing new ones.
6. **Skipping owner review.** The generated BOOTSTRAP.md must be reviewed by the owner. They know context that code analysis cannot reveal (upcoming deadlines, stakeholder constraints, strategic direction).
7. **Starting with features instead of safety.** Sprint-000 for an existing project should almost always be a security and governance baseline sprint, not a feature sprint.
