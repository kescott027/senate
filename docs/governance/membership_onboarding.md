# Membership Onboarding Guide

This guide explains how a new constituent project requests membership and how to complete the initial law sync.

## How to Request Membership

1. Open a PR against `MEMBERSHIP.md` with a new entry (template below).
2. In the PR description, include:
- Project overview and purpose
- Primary contact or delegate
- Desired membership status (active/pending)
3. If executive action or a bill is required, note that in the PR.

## Membership Entry Template

Add a block under "Active Constituents" or "Pending Constituents":

```
- repo: org-or-user/repo-name
  name: <Project Name>
  joined: YYYY-MM-DD
  status: active | pending
  delegate: <name or ai-agent>
```

## When to Sync Laws and Update `.senate-sync.json`

After membership is approved:
- Run the law sync process in the member repo to populate `laws/active/`.
- Create or update `.senate-sync.json` in the member repo to record the synced law hashes.
- Repeat law sync at sprint start and after any law changes.

## Notes

- Membership updates are valid only after executive approval or a majority vote per `MEMBERSHIP.md`.
- If the project maintains stricter rules, capture them as local laws in `local-laws/`.
