# PROPOSED-CE-0002: Enforce merge gating before checks complete

## Phase
1

## Context
A PR was merged before security checks completed. Branch protection must require all checks to pass and be up to date before merge.

## User value
Maintainers and constituents can trust security checks are enforced pre-merge.

## Acceptance criteria
- [ ] Default branch protection requires status checks to pass and be up to date.
- [ ] Required checks include all security scanning workflows.
- [ ] Admin enforcement enabled or documented exception with rationale.
- [ ] Governance rule updated to prohibit merges before checks complete.
- [ ] Evidence captured (settings export or screenshots).

## Non-functional requirements
- Security: Prevent merge bypasses.
- Reliability: Checks are consistent and enforced.
- Performance: N/A.

## Implementation notes
Configure branch protection in GitHub and document required checks in governance docs.

## Test plan
- Unit: N/A
- Integration: Attempt merge with incomplete checks; ensure blocked.
- E2E: N/A

## Observability
- Logs: GitHub branch protection audit logs
- Metrics: N/A
- Traces: N/A

## Rollback plan
Relax branch protection rules and document rationale.

## Risks / edge cases
- Medium

## Definition of Done checklist
- [ ] AC met
- [ ] Tests added + passing
- [ ] Lint/format/type checks pass
- [ ] Security checks pass
- [ ] Docs updated
