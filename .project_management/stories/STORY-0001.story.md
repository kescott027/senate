# STORY-0001: Publish one-line bootstrap instruction in README

## Phase
1

## Context
Ensure `README.md` includes a single-line, copy-paste instruction that fetches and executes the initiator from GitHub raw.

## User value
Constituents and maintainers benefit from publish one-line bootstrap instruction in readme.

## Acceptance criteria
- [ ] README contains an instruction that references `bootstrap/initiator.md` on the `main` branch.
- [ ] Instruction is a single line and safe to paste into AI agents.
- [ ] README also includes a no-web-access fallback (curl + paste).

## Non-functional requirements
- Security: No secret leakage; follow LAW-004 for token handling.
- Reliability: Documentation and scripts must be deterministic and repeatable.
- Performance: N/A (documentation/process).

## Implementation notes
Existing README already has this; verify clarity and keep in sync with initiator path.

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
- Medium

## Definition of Done checklist
- [ ] AC met
- [ ] Tests added + passing
- [ ] Lint/format/type checks pass
- [ ] Security checks pass
- [ ] Docs updated
