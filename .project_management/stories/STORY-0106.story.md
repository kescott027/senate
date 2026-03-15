# STORY-0106: Add validation for law hash changes

## Phase
0

## Context
Add a check to ensure `sync/manifest.json` hashes change when law content changes.

## User value
Constituents and maintainers benefit from add validation for law hash changes.

## Acceptance criteria
- [x] A CI or script detects mismatches between laws and manifest.
- [x] Document the update process.

## Non-functional requirements
- Security: No secret leakage; follow LAW-004 for token handling.
- Reliability: Documentation and scripts must be deterministic and repeatable.
- Performance: N/A (documentation/process).

## Implementation notes
Added a manifest hash verification script and wired it into integrity-check CI; documented the update flow in sync guidance.

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
- [x] Tests added + passing (manual verification)
- [x] Lint/format/type checks pass (N/A — docs + script)
- [x] Security checks pass (N/A — docs + script)
- [x] Docs updated

## Evidence
- `scripts/verify_manifest_hashes.py`
- `.github/workflows/integrity-check.yml`
- `sync/README.md` (manifest update process)
- Test run: `python3 scripts/verify_manifest_hashes.py`
- PR: https://github.com/tecthulhu/senate/pull/19
