# Decision Matrix

| Date | Topic | Options | Recommended | Decision | Rationale | Impact | Status |
| ---- | ----- | ------- | ----------- | -------- | --------- | ------ | ------ |
| 2026-03-14 | Enable GitHub Code Scanning (CodeQL) | Enable now; defer; decline (ADR required) | Enable now | Approved; workflow added | LAW-004 requires security scanning | Security posture change | Closed |
| 2026-03-14 | CodeQL language selection | JavaScript; Actions | Actions | Approved; workflow updated | Repo lacks JS/TS source; Actions workflows are the relevant target | Security tooling config | Closed |
| 2026-03-15 | Secondary verification gist access | Provide gist-owner token; transfer/create new gist; disable secondary verification | Provide gist-owner token | Approved; gist updated | Required to update out-of-band hash mirror for STORY-0004 | Integrity verification | Closed |
| 2026-03-15 | GitHub push permission for PR branch | Provide new write token; authorize existing token; use SSH key | Use SSH key via `github-kescott027` host | Approved; SSH push succeeded and PR #9 opened | Required to push PR branch and comply with PR-only main rule | Release/CI compliance | Closed |
| 2026-03-15 | Example constituent repo location | Org repo; personal repo; local-only bundle | Org repo | Approved; `tecthulhu/senate-forum` created | Needed to publish example repo for STORY-0202 | Onboarding reference | Closed |
