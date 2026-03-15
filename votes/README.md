# Votes

## Voting Process

Voting on bills happens on **GitHub Issues** via structured comments, not in this directory. Each bill issue is labeled `voting-open` when ready for votes. For full lifecycle details, see `docs/governance/voting_lifecycle.md`.

## Vote Format

Constituents post a comment on the bill issue using the format defined in LAW-012:

```
**VOTE**
project: <repo-full-name>
vote: yea | nay | abstain
reason: <brief justification>
```

## This Directory

This directory stores vote artifacts:

- `votes/tallies/` — vote tally archives
- `votes/decisions/` — decision records

Templates live in `templates/vote_tally.md` and `templates/decision_record.md`.

## Thresholds

- **Normal laws**: Simple majority of non-abstaining votes
- **Constitutional amendments**: 2/3 supermajority of non-abstaining votes

Quorum requires a majority of active constituents (per `MEMBERSHIP.md`) to have cast a vote.
