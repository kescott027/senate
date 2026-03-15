# STORY-0104: Provide guidance for no-GitHub environments

## Phase
1

## Context
Document how to bootstrap in air-gapped or non-GitHub environments.

## User value
Constituents and maintainers benefit from provide guidance for no-github environments.

## Acceptance criteria
- [x] README includes a path for manual download and local use.
- [x] Integrity verification still works offline with local files.

## Non-functional requirements
- Security: No secret leakage; follow LAW-004 for token handling.
- Reliability: Documentation and scripts must be deterministic and repeatable.
- Performance: N/A (documentation/process).

## Implementation notes
Added offline guidance doc and referenced it from README.

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
- [x] Tests added + passing (N/A — docs)
- [x] Lint/format/type checks pass (N/A — docs)
- [x] Security checks pass (N/A — docs)
- [x] Docs updated

## Evidence
- `docs/governance/offline_bootstrap.md`
- `README.md` (No AI web access note + Quick Links entry)
- PR: https://github.com/tecthulhu/senate/pull/17
