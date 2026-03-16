# STORY-0201: Bootstrap helper CLI

## Phase
1

## Context
Provide a small CLI wrapper to perform the bootstrap steps automatically.

## User value
Constituents and maintainers benefit from bootstrap helper cli.

## Acceptance criteria
- [x] CLI performs integrity verification and downloads skeleton + laws.
- [x] CLI supports a dry-run mode.
- [x] Documentation explains how to install and run it.

## Non-functional requirements
- Security: No secret leakage; follow LAW-004 for token handling.
- Reliability: Documentation and scripts must be deterministic and repeatable.
- Performance: N/A (documentation/process).

## Implementation notes
Implemented an optional Python CLI and documented it with explicit guidance that it does not replace the AI bootstrap.

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
- [x] Lint/format/type checks pass (N/A — script + docs)
- [x] Security checks pass (N/A — script + docs)
- [x] Docs updated

## Evidence
- `scripts/bootstrap_cli.py`
- `docs/governance/bootstrap_helper_cli.md`
- `README.md` (Quick Links)
- Test run: `python3 scripts/bootstrap_cli.py --dry-run --dest /tmp/senate-bootstrap-test`
- PR: https://github.com/tecthulhu/senate/pull/23
