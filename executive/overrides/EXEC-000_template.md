---
override_id: EXEC-000
action: enact | repeal | veto | suspend | amend
target_law: LAW-NNN (or null for new enactments)
date: YYYY-MM-DD
reason: <short explanation>
expires: YYYY-MM-DD (or null if permanent)
related_issue: <issue url or null>
---

# Executive Override: <Short title>

## Summary

Describe the override in 2-3 sentences.

## Action Taken

Explain the exact action (enact/repeal/veto/suspend/amend) and the affected law(s).

## Rationale

Why is executive action required instead of the standard legislative process?

## Scope and Conditions

Describe any scope limits, expiry conditions, or follow-up requirements.

## Follow-up Checklist

- Update `laws/` files to reflect the override.
- Update `sync/manifest.json` and validate hashes.
- Record the decision in `votes/decisions/` if a vote was interrupted.
