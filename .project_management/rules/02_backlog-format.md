---
law_id: LAW-002
title: Backlog Format
status: active
enacted: "2026-03-13"
last_amended: null
origin_bill: null
sponsors: []
---

# LAW-002: Backlog Format

## Epic Format

Epics are maintained in `.project_management/epics.md`. Each epic MUST include:

- **Epic ID**: EPIC-### (sequential)
- **Phase**: 0 | 1 | 2 | 3
- **Outcome**: measurable statement
- **Dependencies**: list of epic/story IDs
- **Risks**: key risks
- **Exit criteria**: bullet list

## Story File Format

Stories are maintained in `.project_management/stories/STORY-####.md`. Every story MUST include these sections, in order:

1. Title
2. Phase
3. Context
4. User value
5. Acceptance criteria (testable bullets)
6. Non-functional requirements
7. Implementation notes
8. Test plan
9. Observability
10. Rollback plan
11. Risks / edge cases
12. Definition of Done checklist

## Sizing Rule

Every story must be completable in two days or fewer. If a story cannot be completed within two days, it must be split into smaller stories.

## Uncertainty Rule

If requirements are unclear, create a SPIKE story with explicit learning goals and a time box. Spikes produce knowledge, not production code.
