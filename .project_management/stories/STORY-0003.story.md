# STORY-0003: Integrity manifest and verification script

## Phase
0

## Context
Provide a deterministic hash manifest and script to verify it.

## User value
Constituents and maintainers benefit from integrity manifest and verification script.

## Acceptance criteria
- [ ] `bootstrap/integrity.json` includes all critical files.
- [ ] `bootstrap/regenerate-integrity.sh --check-only` exits 0 in CI.
- [ ] Hashing normalizes CRLF to ensure cross-platform consistency.

## Non-functional requirements
- Security: No secret leakage; follow LAW-004 for token handling.
- Reliability: Documentation and scripts must be deterministic and repeatable.
- Performance: N/A (documentation/process).

## Implementation notes
Implemented; keep CI coverage and update as files change.

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
- High

## Definition of Done checklist
- [ ] AC met
- [ ] Tests added + passing
- [ ] Lint/format/type checks pass
- [ ] Security checks pass
- [ ] Docs updated
