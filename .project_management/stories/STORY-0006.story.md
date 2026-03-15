# STORY-0006: Ensure active laws and sync manifest are consistent

## Phase
0

## Context
Keep `laws/active/` and `sync/manifest.json` aligned with correct hashes.

## User value
Constituents and maintainers benefit from ensure active laws and sync manifest are consistent.

## Acceptance criteria
- [ ] 13 active laws exist and are referenced in the manifest.
- [ ] Manifest hashes match actual file hashes.
- [ ] Manifest `last_updated` reflects changes.

## Non-functional requirements
- Security: No secret leakage; follow LAW-004 for token handling.
- Reliability: Documentation and scripts must be deterministic and repeatable.
- Performance: N/A (documentation/process).

## Implementation notes
Use integrity script + manual verification.

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
