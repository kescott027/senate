# STORY-0216: Quality toolchain baseline and enforcement

## Phase
1

## Context
We need a documented and operational toolchain for linting, formatting, code quality, and security scanning, aligned with senate laws.

## User value
Ensures consistent code quality and security standards across contributions.

## Acceptance criteria
- [x] Toolchain baseline documented (lint, format, code quality, security scans).
- [x] CI workflow enforces actionlint and shellcheck at minimum.
- [x] Documentation explains how to run quality checks locally.

## Non-functional requirements
- Security: No secret leakage; follow LAW-004 for token handling.
- Reliability: Toolchain is deterministic and reproducible.
- Performance: Keep CI runtime reasonable.

## Implementation notes
Add a `quality-gates` workflow and a documentation page under `docs/quality/`.

## Test plan
- Unit: N/A
- Integration: Manual verification of workflow config
- E2E: N/A

## Observability
- Logs: CI logs
- Metrics: N/A
- Traces: N/A

## Rollback plan
Remove workflow and documentation.

## Risks / edge cases
- Medium

## Definition of Done checklist
- [x] AC met
- [x] Tests added + passing (N/A — workflow + docs)
- [x] Lint/format/type checks pass (N/A — workflow + docs)
- [x] Security checks pass (N/A — workflow + docs)
- [x] Docs updated

## Evidence
- `.github/workflows/quality-gates.yml`
- `docs/quality/toolchain.md`
