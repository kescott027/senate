# Offline / No-GitHub Bootstrap Guidance

Use this path when GitHub API access is unavailable or the environment is air-gapped.

## Option A: Manual Download (Preferred)

1. From a connected machine, download the senate repository as an archive.
2. Transfer the archive to the offline environment via approved media.
3. Extract the archive into a temporary directory.
4. Copy the required files into your project directory: `.project_management/` skeleton, `laws/active/`, `sync/manifest.json`, `BOOTSTRAP.md`, and `templates/` as needed.

## Option B: Pre-packaged Bundle

If your organization maintains a pre-approved bundle, use that bundle instead of downloading directly.

## Integrity Verification (Offline)

Even offline, integrity verification still works with local files:

1. Open `bootstrap/integrity.json` in the bundle.
2. Compute local hashes for critical files, for example:

```
sha256sum bootstrap/initiator.md
sha256sum bootstrap/integrity.json
```

3. Compare against the hashes in `bootstrap/integrity.json`.

If the secondary gist is unreachable, proceed in degraded mode and record the exception in your sprint log.

## After Installation

Run the bootstrap verification script to confirm required files:

```
python3 scripts/verify_bootstrap.py
```

Then continue with `project_management_bootstrapping.md` or `project_management_bootstrapping_existing.md`.
