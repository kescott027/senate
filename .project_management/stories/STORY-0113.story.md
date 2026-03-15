# STORY-0113: Update contributor guidance for proposing and voting

## Phase
2

## Context
Provide contributor-facing documentation that explains how to propose a bill and how to vote.

## User value
Constituents and maintainers benefit from update contributor guidance for proposing and voting.

## Acceptance criteria
- [x] README (or a dedicated guide) links to proposal and voting instructions.
- [x] Examples show correct formatting for a vote comment.
- [x] Guidance includes timelines and review windows.

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
- `docs/governance/contributor_guide.md`
- `docs/governance/proposal_intake_workflow.md`
- `docs/governance/voting_lifecycle.md`
- `README.md`
