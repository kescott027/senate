# STORY-0101: Provide automated bootstrap verification script

## Phase
1

## Context
Add a script to validate that a freshly bootstrapped repo contains all required artifacts.

## User value
Constituents and maintainers benefit from provide automated bootstrap verification script.

## Acceptance criteria
- [x] Script checks for `.project_management/` structure, laws, sync file, and AI entrypoint.
- [x] Script exits non-zero on missing or malformed files.
- [x] Document how to run it after bootstrap.

## Non-functional requirements
- Security: No secret leakage; follow LAW-004 for token handling.
- Reliability: Documentation and scripts must be deterministic and repeatable.
- Performance: N/A (documentation/process).

## Implementation notes
Implemented `scripts/verify_bootstrap.py` and linked it from README quick links and a new "Verify Bootstrap" section.

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
- [x] Lint/format/type checks pass (N/A — single script)
- [x] Security checks pass (N/A — docs + local script)
- [x] Docs updated

## Evidence
- `scripts/verify_bootstrap.py`
- `README.md` (Quick Links + Verify Bootstrap section)
- Test run: `python3 scripts/verify_bootstrap.py`
- PR: https://github.com/tecthulhu/senate/pull/17
