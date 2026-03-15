# STORY-0201: Bootstrap helper CLI

## Phase
1

## Context
Provide a small CLI wrapper to perform the bootstrap steps automatically.

## User value
Constituents and maintainers benefit from bootstrap helper cli.

## Acceptance criteria
- [ ] CLI performs integrity verification and downloads skeleton + laws.
- [ ] CLI supports a dry-run mode.
- [ ] Documentation explains how to install and run it.

## Non-functional requirements
- Security: No secret leakage; follow LAW-004 for token handling.
- Reliability: Documentation and scripts must be deterministic and repeatable.
- Performance: N/A (documentation/process).

## Implementation notes
Optional; must not replace the single-line AI instruction.

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
