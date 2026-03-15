# Onboarding FAQ

Short answers to common bootstrap and onboarding issues.

## Integrity check failed. What should I do?

- Verify you are using the latest senate repo and that `bootstrap/integrity.json` matches.
- Run `./bootstrap/regenerate-integrity.sh --check-only` to confirm the mismatch.
- If the secondary verification gist is unreachable, record a degraded-mode exception in your sprint log and retry later.

## I do not have a GitHub token or API access.

- Use the offline bootstrap path in `docs/governance/offline_bootstrap.md`.
- If you have a token, store it in `~/.github_tokens_secure/` and verify read access before proceeding.

## The `.project_management/` folder is missing or incomplete.

- Re-run the appropriate bootstrap guide (`project_management_bootstrapping.md` or `project_management_bootstrapping_existing.md`).
- If `.project_management/` exists but is missing files, copy missing files from `project_management_skeleton/` without overwriting existing artifacts.

## Manifest hash validation failed.

- Run `python3 scripts/verify_manifest_hashes.py` to see which laws are out of sync.
- Update `sync/manifest.json` hashes and `last_updated`, then re-run the check.
