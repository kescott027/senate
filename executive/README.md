# Executive Overrides

## Executive Authority

The executive (human-in-the-loop / `kescott027`) holds ultimate authority over the senate. This power exists to ensure human oversight of AI governance and to enable rapid response when needed.

## Override Actions

The executive can perform the following actions at any time without constituent vote:

1. **Enact** a law immediately without vote
2. **Repeal** a law immediately, moving it to `laws/repealed/`
3. **Veto** a passed bill within the 48-hour executive review window
4. **Suspend** a law temporarily, with a specified expiry date
5. **Amend** any law, process, or the constitution itself

## Override Record Format

Each override is recorded as a file in `executive/overrides/` with the following naming convention:

```
EXEC-NNN_description.md
```

### Required Frontmatter

```yaml
---
override_id: EXEC-NNN
action: enact | repeal | veto | suspend | amend
target_law: LAW-NNN (or null for new enactments)
date: YYYY-MM-DD
reason: <explanation>
expires: YYYY-MM-DD (or null if permanent)
---
```

### Body

The body of the override document should contain:

- Full description of the action taken
- Rationale for bypassing the normal legislative process
- Any conditions or constraints on the override
- For suspensions: the expiry date and what triggers reinstatement

## Process

1. Executive opens a GitHub Issue using the `EXECUTIVE_OVERRIDE` template (or acts directly).
2. Override file is created in `executive/overrides/`.
3. Affected law files are updated (status changes, moved to repealed, etc.).
4. `sync/manifest.json` is updated to reflect the change.
5. Constituents are notified via the manifest sync process.

## Interaction with Voting Lifecycle

- If an override applies to an active bill, add the `executive-override` label and close the vote if it is open.
- Record the outcome in `votes/decisions/` using `templates/decision_record.md`.
- Link the override file in the decision record for auditability.

## Accountability

While executive overrides do not require approval, they are fully transparent. All overrides are version-controlled, timestamped, and visible to all constituents through the sync process.
