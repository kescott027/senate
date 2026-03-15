# STORY-0107: Define versioning strategy for laws

## Phase
0

## Context
Document how law versions are tracked and updated across changes.

## User value
Constituents and maintainers benefit from define versioning strategy for laws.

## Acceptance criteria
- [x] A section in `laws/README.md` (or equivalent) describes versioning.
- [x] Version changes are reflected in manifest metadata.

## Non-functional requirements
- Security: No secret leakage; follow LAW-004 for token handling.
- Reliability: Documentation and scripts must be deterministic and repeatable.
- Performance: N/A (documentation/process).

## Implementation notes
Documented law versioning in the law index and tied changes to manifest version/last_updated.

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
- Low

## Definition of Done checklist
- [x] AC met
- [x] Tests added + passing (N/A — docs)
- [x] Lint/format/type checks pass (N/A — docs)
- [x] Security checks pass (N/A — docs)
- [x] Docs updated

## Evidence
- `laws/README.md`
- `sync/README.md`
- PR: https://github.com/tecthulhu/senate/pull/19
