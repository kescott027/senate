---
law_id: LAW-012
title: Bill Submission Process
status: active
enacted: "2026-03-13"
last_amended: null
origin_bill: null
sponsors: []
---

# LAW-012: Bill Submission Process

## Purpose

Governs how constituent projects propose new laws, amendments, and repeals to the senate.

## Bill Types

- **New Law**: Proposes a new LAW-NNN to be added to `laws/active/`.
- **Amendment**: Proposes changes to an existing law.
- **Repeal**: Proposes removal of an existing law (moved to `laws/repealed/`).

## Submission Process

1. **Sponsor opens a GitHub Issue** on `kescott027/senate` using the appropriate template (`BILL_NEW_LAW`, `BILL_AMENDMENT`, or `BILL_REPEAL`).
2. **Auto-labeling**: Issue receives `bill` + `needs-triage` labels automatically.
3. **Triage**: Senate reviews the bill for completeness and assigns `under-review` label.
4. **Review period**: Constituents evaluate the bill and post feedback as issue comments.
5. **Voting**: Label transitions to `voting-open`. Each constituent posts one structured vote comment.
6. **Tally**: Votes are counted. Threshold per `CONSTITUTION.md` (simple majority for laws, 2/3 for constitutional changes).
7. **Executive review**: 48-hour window for executive veto after passing.
8. **Enactment**: If passed and not vetoed, law files are updated via PR, manifest regenerated.

## Vote Format

Constituents post a comment on the bill issue using this format:

```
**VOTE**
project: <repo-full-name>
vote: yea | nay | abstain
reason: <brief justification>
```

## Rejection Feedback

If a constituent votes nay, they should include specific objections and, if possible, a suggested alternative approach.

## Bill Withdrawal

A sponsor may withdraw their bill at any time before voting closes by commenting on the issue and requesting closure.

## Emergency Bills

For urgent governance issues, the executive may fast-track a bill, shortening or skipping the review period. Emergency bills are marked with an `emergency` label.
