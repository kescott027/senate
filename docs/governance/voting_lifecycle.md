# Voting Lifecycle and Decision Recording

## Purpose

Define how voting opens, closes, is tallied, and is archived for audit.

## Voting Open

A bill may enter `voting-open` when:

- It meets the entry criteria in `docs/governance/proposal_intake_workflow.md`.
- The review window has elapsed (or `emergency` label is applied by the executive).
- A voting window is posted (start/end timestamps in UTC).

## Vote Format (LAW-012)

```
**VOTE**
project: <repo-full-name>
vote: yea | nay | abstain
reason: <brief justification>
```

Only one vote per constituent is counted. If multiple votes are posted, the latest vote before close is counted.

## Voting Close

A bill moves to `voting-closed` when the voting window ends or the executive closes the vote. Votes posted after close are not counted.

## Quorum and Thresholds

- Quorum: majority of active constituents must cast a vote (yea/nay/abstain).
- Normal laws: simple majority of non-abstaining votes.
- Constitutional changes: 2/3 supermajority of non-abstaining votes.

Refer to `CONSTITUTION.md` and `votes/README.md` for canonical thresholds.

## Tally Procedure

1. Snapshot the active constituent list from `MEMBERSHIP.md` at vote close.
2. Collect votes from the issue comments in the voting window.
3. Validate format; request corrections before close if needed.
4. Count yea/nay/abstain; confirm quorum.
5. Determine outcome (passed/failed/no quorum).
6. Record tally in `votes/tallies/` using `templates/vote_tally.md`.
7. Record decision in `votes/decisions/` using `templates/decision_record.md`.
8. Apply labels: `voting-closed` + `passed` or `failed`.

## Decision Records

Decision records capture the final outcome and provide a durable audit trail. Store them under `votes/decisions/` and link to the tally file.

## Executive Override Integration

If the executive enacts, vetoes, or amends outside the standard vote:

- Apply the `executive-override` label to the bill issue.
- Record the override in `executive/overrides/`.
- Record the decision in `votes/decisions/`, referencing the override file.

## Edge Cases

- **Late votes**: Not counted.
- **Invalid format**: Not counted unless corrected before close.
- **No quorum**: Record as `no_quorum` and return to triage for next steps.
- **Withdrawn bill**: Apply `withdrawn`, close issue, and record decision if needed.
