# Quality Toolchain Baseline

This repo enforces a baseline toolchain for linting, formatting, code quality, and security scanning.

## CI Gates (Required)

- **Integrity Check**: `integrity-check.yml` verifies `bootstrap/integrity.json` integrity.
- **CodeQL**: `codeql.yml` scans GitHub Actions workflows.
- **Quality Gates**: `quality-gates.yml` enforces:
  - `actionlint` on `.github/workflows/`
  - `shellcheck` on `.sh` scripts

## Local Checks

Run these locally before submitting PRs:

```bash
# Action workflows
actionlint .github/workflows

# Shell scripts
shellcheck ai_cmd.sh bootstrap/regenerate-integrity.sh
```

## Security Scanning

- CodeQL is enabled (GitHub Actions language).
- Dependency and secrets scanning should remain enabled in repository settings.

## Recommended Additions (Future)

- Markdown linting for documentation.
- Spellcheck for user-facing docs.
- Coverage reporting for any code-heavy repositories.
