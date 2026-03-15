# STORY-0210: Define self-audit scope and signals

## Phase
3

## Context
Specify what the system should analyze to detect governance gaps and improvement opportunities.

## User value
Constituents and maintainers benefit from define self-audit scope and signals.

## Acceptance criteria
- [ ] A checklist or spec enumerates signals (missing docs, stale laws, conflicts, process gaps).
- [ ] Each signal maps to a bill type (new law, amendment, repeal, feedback).
- [ ] Safety constraints and HITL gates are explicit.

## Non-functional requirements
- Security: No secret leakage; follow LAW-004 for token handling.
- Reliability: Documentation and scripts must be deterministic and repeatable.
- Performance: N/A (documentation/process).

## Implementation notes
See BOOTSTRAP_SENATE.md for detailed context and acceptance criteria.

## Test plan
- Unit: N/A (docs/process)
- Integration: Manual verification of referenced files/steps
- E2E: If applicable, run end-to-end bootstrap smoke checklist

## Observability
- Logs: N/A (documentation)
- Metrics: N/A
- Traces: N/A

## Rollback plan
Revert the changes to restore prior governance documentation.

## Risks / edge cases
- Medium

## Definition of Done checklist
- [ ] AC met
- [ ] Tests added + passing
- [ ] Lint/format/type checks pass
- [ ] Security checks pass
- [ ] Docs updated
