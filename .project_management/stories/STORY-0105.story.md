# STORY-0105: Consolidate law mapping table

## Phase
0

## Context
Maintain a single authoritative mapping of LAW files to local rules filenames.

## User value
Constituents and maintainers benefit from consolidate law mapping table.

## Acceptance criteria
- [x] Mapping table appears in a single place and is referenced elsewhere.
- [x] Table includes all 13 laws and filenames.

## Non-functional requirements
- Security: No secret leakage; follow LAW-004 for token handling.
- Reliability: Documentation and scripts must be deterministic and repeatable.
- Performance: N/A (documentation/process).

## Implementation notes
Created a dedicated law mapping doc and referenced it from bootstrap guides.

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
- `docs/governance/law_mapping.md`
- `project_management_bootstrapping.md`
- `project_management_bootstrapping_existing.md`
- PR: https://github.com/tecthulhu/senate/pull/19
