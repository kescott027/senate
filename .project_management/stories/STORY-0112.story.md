# STORY-0112: Publish vote tally procedure and archival format

## Phase
2

## Context
Create a repeatable procedure for tallying votes and storing results for audit.

## User value
Constituents and maintainers benefit from publish vote tally procedure and archival format.

## Acceptance criteria
- [x] Tally steps reference LAW-012 thresholds and quorum rules.
- [x] A canonical tally template exists in `votes/` or `templates/`.
- [x] Guidance covers abstentions and edge cases (late votes, invalid format).

## Non-functional requirements
- Security: No secret leakage; follow LAW-004 for token handling.
- Reliability: Documentation and scripts must be deterministic and repeatable.
- Performance: N/A (documentation/process).

## Implementation notes
See BOOTSTRAP_SENATE.md for detailed context and acceptance criteria.

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
- `docs/governance/voting_lifecycle.md`
- `templates/vote_tally.md`
- `votes/tallies/`
- `votes/README.md`
