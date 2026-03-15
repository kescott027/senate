# Contributor Guide: Proposing and Voting

## Who Can Propose

Active constituents listed in `MEMBERSHIP.md` may propose new laws, amendments, or repeals.

## How to Propose a Bill

1. Open a GitHub Issue using the correct template:
   - `BILL_NEW_LAW.yml`
   - `BILL_AMENDMENT.yml`
   - `BILL_REPEAL.yml`
2. Complete all required sections (bill ID, rationale, proposed changes).
3. Attach the proposed law text or a change plan.
4. Wait for triage (`needs-triage` → `under-review`).

Reference: `docs/governance/proposal_intake_workflow.md`

## How to Vote

1. Wait for the `voting-open` label on the bill issue.
2. Post a single vote comment using the LAW-012 format:

```
**VOTE**
project: <repo-full-name>
vote: yea | nay | abstain
reason: <brief justification>
```

3. If you need to change your vote, post a new comment before the voting window closes.

Reference: `docs/governance/voting_lifecycle.md`

## Feedback (Non-vote)

Use the `FEEDBACK.yml` issue template for process or law feedback that is not a formal bill.
