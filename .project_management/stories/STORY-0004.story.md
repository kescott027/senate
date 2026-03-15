# STORY-0004: Secondary verification gist alignment

## Phase
1

## Context
Ensure the out-of-band verification gist matches initiator and integrity manifest hashes.

## User value
Constituents and maintainers benefit from secondary verification gist alignment.

## Acceptance criteria
- [x] Gist contains hashes for `bootstrap/initiator.md` and `bootstrap/integrity.json`.
- [x] Initiator verifies both hashes against the gist.
- [x] Documented recovery behavior if gist is unreachable.

## Non-functional requirements
- Security: No secret leakage; follow LAW-004 for token handling.
- Reliability: Documentation and scripts must be deterministic and repeatable.
- Performance: N/A (documentation/process).

## Implementation notes
Requires maintaining gist updates whenever integrity.json changes.

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
- [x] AC met
- [x] Tests added + passing (N/A — docs/process)
- [x] Lint/format/type checks pass (N/A — docs/process)
- [x] Security checks pass (N/A — docs/process)
- [x] Docs updated

## Evidence
- Updated gist: https://gist.github.com/kescott027/ade8c10d5e75aaba5d185506d890b096
- `bootstrap/integrity.json` regenerated (hash: a505250cd76cc009159ebfe995e5fba14de832e2c94a143683d105033cfd5b95)
