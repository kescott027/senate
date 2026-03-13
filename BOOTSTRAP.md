# BOOTSTRAP.md — Project Bootstrap Template

> **Instructions for the AI agent:** This file contains all the raw data needed to bootstrap a project's `.project_management/` directory and begin execution. Follow `project_management_bootstrapping.md` to process this file. Do not modify this file during bootstrapping — it is the input, not a living document.
>
> **Instructions for the project owner:** Fill in every section below before handing this file to an AI agent. The more complete and specific your inputs, the better the resulting project structure. Sections marked `(optional)` may be left blank if not applicable.

---

## 1. Project Identity

- **Project name:**
- **Repository:** `<github-org/repo-name>`
- **Owner / stakeholder:** `<github-username or name>`
- **Senate membership:** yes / no / pending
  - If yes, this project will sync laws from `kescott027/senate`.
  - If no, governance rules will be self-contained.

---

## 2. Vision

> Describe what this project exists to achieve. Be specific about the problem being solved, who it serves, and what success looks like. This section drives the sprint goals and epic definitions.

**Problem statement:**
<What problem does this project solve? Why does it matter?>

**Target users / audience:**
<Who benefits from this project?>

**Success criteria:**
<How do you know the project has succeeded? List 3-5 measurable outcomes.>

**Non-goals:**
<What is explicitly out of scope? This prevents scope creep during execution.>

---

## 3. Architecture

> Describe the technical architecture at a level of detail sufficient for an AI agent to make informed implementation decisions. Include diagrams by reference if needed.

**System overview:**
<High-level description of the system: what components exist, how they interact, what technologies are used.>

**Component inventory:**

| Component | Purpose | Technology | Repository path |
|-----------|---------|------------|-----------------|
| | | | |

**Data flow:**
<How does data move through the system? What are the inputs, processing stages, and outputs?>

**Infrastructure:**
<Where does this run? Local, cloud, hybrid? What services or platforms are involved?>

**Key architectural decisions already made:**

| Decision | Rationale | Constraints |
|----------|-----------|-------------|
| | | |

**Architecture diagrams or references (optional):**
<List file paths or URLs to architecture diagrams, if any.>

---

## 4. Critical Rules (optional)

> Project-specific rules that go beyond the standard senate laws. These become local laws during bootstrap.

**Security rules:**
<Any project-specific security requirements — token handling, encryption, access control patterns, compliance requirements.>

**Technical constraints:**
<Mandatory technology choices, version requirements, platform restrictions, performance SLOs.>

**Process constraints:**
<Approval gates, review requirements, deployment restrictions, communication protocols.>

**Coding conventions:**
<Language-specific style guides, naming conventions, file organization rules, testing patterns. If a CLAUDE.md or similar exists, reference it here.>

---

## 5. Key Deliverables

> List the major deliverables for the project. Each deliverable becomes an epic during bootstrap. Order them by priority — the AI agent will assign phases based on position and dependencies.

### Deliverable 1: <Name>
- **Description:** <What is being delivered?>
- **Phase:** <0 = foundations, 1 = MVP, 2 = production, 3 = scale>
- **Exit criteria:**
  - <Measurable criterion 1>
  - <Measurable criterion 2>
- **Dependencies:** <Other deliverables or external dependencies>

### Deliverable 2: <Name>
- **Description:**
- **Phase:**
- **Exit criteria:**
  - ...
- **Dependencies:**

### Deliverable N: <Name>
- **Description:**
- **Phase:**
- **Exit criteria:**
  - ...
- **Dependencies:**

---

## 6. Backlog

> List every known work item. Each item becomes a story during bootstrap. Provide enough detail for the AI agent to write full story files with acceptance criteria. Group by priority.

### P0 — Critical (must be done first)

#### <Story title>
- **Description:** <What needs to be done?>
- **Acceptance criteria:**
  - <Testable criterion 1>
  - <Testable criterion 2>
- **Parent deliverable:** <Deliverable name from section 5>
- **Dependencies:** <Other story titles or "none">
- **Risk:** Low / Medium / High
- **Architectural impact:** None / Low / Medium / High
- **Notes:** <Any implementation hints, constraints, or context>

#### <Story title>
- **Description:**
- **Acceptance criteria:**
  - ...
- **Parent deliverable:**
- **Dependencies:**
- **Risk:**
- **Architectural impact:**
- **Notes:**

### P1 — Important (do after P0)

#### <Story title>
- **Description:**
- **Acceptance criteria:**
  - ...
- **Parent deliverable:**
- **Dependencies:**
- **Risk:**
- **Architectural impact:**
- **Notes:**

### P2 — Nice to have (do if time permits)

#### <Story title>
- **Description:**
- **Acceptance criteria:**
  - ...
- **Parent deliverable:**
- **Dependencies:**
- **Risk:**
- **Architectural impact:**
- **Notes:**

---

## 7. External Dependencies and Access

> List any external systems, APIs, tokens, or permissions the AI agent will need during execution.

| Dependency | Type | Access method | Notes |
|------------|------|---------------|-------|
| | API / token / service / tool | | |

**Token files:**
<List any token file paths the AI agent should know about, e.g., `~/.github_tokens_secure/.project_token`>

**Required GitHub permissions:**
<What scopes does the token need? E.g., `repo`, `security_events`, `admin:repo`>

**External services:**
<Any third-party APIs, databases, cloud services, or tools that the project depends on.>

---

## 8. Additional Data Files (optional)

> Reference any additional files that provide context for the bootstrap process. These are read by the AI agent during bootstrapping but are not part of the skeleton.

| File | Purpose | Location |
|------|---------|----------|
| | | |

Examples:
- Existing security audit reports
- Architecture decision records
- Prior art or reference implementations
- Configuration files or environment setup guides
- Existing CLAUDE.md or similar AI guidance files

---

## 9. Sprint-000 Guidance (optional)

> If you have a specific idea of what Sprint-000 should focus on, describe it here. Otherwise, the AI agent will derive it from the highest-priority backlog items.

**Sprint-000 goal:**
<What should the first sprint accomplish?>

**Sprint-000 stories (suggested):**
<Which backlog items should be in the first sprint?>

**Known blockers:**
<Anything that might block Sprint-000 that the AI should know about upfront.>

---

## 10. Human-in-the-Loop Gates (optional)

> List any decisions or actions that require human approval before the AI agent proceeds.

| Gate | Trigger | Who approves |
|------|---------|--------------|
| | | |

Examples:
- Production deployments
- Security posture changes
- New external service integrations
- Budget or licensing decisions
- Public-facing content or messaging

---

## Bootstrap Execution

When this file is complete, hand it to an AI agent with the appropriate prompt:

### For new projects (empty or near-empty repo):

```
Bootstrap this project using BOOTSTRAP.md. Follow the process in
kescott027/senate/project_management_bootstrapping.md. The project
management skeleton is at kescott027/senate/project_management_skeleton/.
```

### For existing projects (repo with code, history, and in-flight work):

```
Bootstrap this project using BOOTSTRAP.md. Follow the process in
kescott027/senate/project_management_bootstrapping_existing.md. The
project management skeleton is at
kescott027/senate/project_management_skeleton/.
```

The existing-project guide adds codebase discovery, security baseline scans,
architecture extraction, and governance reconciliation before the standard
bootstrap. If BOOTSTRAP.md is incomplete, the AI agent will help derive missing
sections from the codebase and present them for owner review.

### The AI agent will:
1. (Existing projects only) Discover codebase, run safety checks, extract architecture, establish security baseline.
2. Copy the skeleton into `.project_management/`.
3. Sync senate laws into the rules directory.
4. Parse this BOOTSTRAP.md to generate epics, stories, and the backlog.
5. Plan and create Sprint-000.
6. Create `AI_ENTRYPOINT.md`.
7. Validate the setup and begin execution.
