# Proposal Intake and Triage Workflow

## Purpose

Define how bills are submitted, triaged, reviewed, and advanced to voting in a consistent, auditable way.

## Roles

- **Sponsor**: Author of the bill issue (constituent project).
- **Triage owner**: Executive or delegated maintainer responsible for intake.
- **Reviewers**: Constituents providing feedback prior to vote.

## Required Artifacts

- A GitHub Issue using one of the bill templates in `.github/ISSUE_TEMPLATE/`.
- A clear bill ID and bill type (new law, amendment, repeal).
- Proposed law text or change plan attached or linked.

## Labels and States

| Label | Meaning | Owner | Exit criteria |
| --- | --- | --- | --- |
| `needs-triage` | Newly submitted, awaiting intake review | Triage owner | Intake checklist complete |
| `needs-info` | Missing required fields or artifacts | Sponsor | Required info supplied |
| `under-review` | Ready for feedback window | Triage owner | Review window complete |
| `voting-open` | Vote window active | Triage owner | Vote window closed |
| `voting-closed` | Voting period ended | Triage owner | Tally recorded |
| `passed` | Vote passed | Triage owner | Executive review complete |
| `failed` | Vote failed or no quorum | Triage owner | Issue closed |
| `withdrawn` | Sponsor withdrew | Sponsor | Issue closed |
| `emergency` | Executive fast-tracked | Executive | Review window adjusted |
| `executive-override` | Override applied | Executive | Decision recorded |

## Intake Checklist (Triage)

A bill may move from `needs-triage` to `under-review` only when all are true:

- Correct issue template used (new law / amendment / repeal).
- Bill ID present and unique.
- Sponsor is an active constituent (see `MEMBERSHIP.md`).
- Proposed law text or change plan attached.
- Rationale and impact section completed (security/architecture if applicable).

If any item is missing, apply `needs-info` and request updates.

## Entry Criteria for Review

A bill is eligible for `under-review` when:

- Intake checklist is complete.
- Triage owner confirms scope is clear and actionable.
- Any mandatory attachments are present (draft law text or diff plan).

## Entry Criteria for Voting

A bill is eligible for `voting-open` when:

- `under-review` is applied.
- The review window has elapsed (default target: 72 hours unless `emergency`).
- Any blocking questions are resolved or explicitly deferred.
- Voting window (start/end timestamp) is posted in the issue.

## Workflow Summary

1. **Sponsor submits bill** via issue template (`needs-triage`).
2. **Triage** checks completeness; either `needs-info` or `under-review`.
3. **Review period** for feedback and amendments.
4. **Voting opens** with `voting-open` label and a defined window.
5. **Voting closes**; tally recorded; label `passed` or `failed`.
6. **Executive review** (48 hours for passed bills per LAW-012).
7. **Enactment** via PR if not vetoed.

## References

- LAW-012: Bill Submission Process
- Issue templates in `.github/ISSUE_TEMPLATE/`
- Voting lifecycle in `docs/governance/voting_lifecycle.md`
