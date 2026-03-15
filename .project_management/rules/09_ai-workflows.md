---
law_id: LAW-009
title: AI Workflows
status: active
enacted: "2026-03-13"
last_amended: null
origin_bill: null
sponsors: []
---

# LAW-009: AI Workflows

## Workflow A: Chat to Seed Docs

- Produce and update documentation under `/docs` and rules under `.project_management/rules` as needed.
- Validate document consistency across vision, PRD, and architecture documents.

## Workflow B: Seed Docs to Backlog

- Create epics and stories conforming to the strict schema defined in LAW-002.
- Assign phase and dependencies to each item.
- Ensure each story has acceptance criteria and a test plan.

## Workflow C: Backlog to Execution

- Implement one story per PR.
- Include tests and evidence of completion.
- Update documentation if behavior changes.
- Never bypass policy or CI gates.
- Before resolving any permissions error, feature toggle, or external service change: check LAW-011 (Blocker Management) HITL criteria. If matched, file a blocker and set `pending_hitl_gate` before proceeding.

## Workflow D: Review Cycles

- Generate review checklists per LAW-008 cadence.
- Convert findings to backlog stories.
- Prioritize findings to manage technical debt proactively.
