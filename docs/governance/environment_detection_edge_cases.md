# Environment Detection Edge Cases

This document clarifies how the bootstrap environment detection should behave in ambiguous or uncommon repository states.

## Edge Cases and Decisions

- **Docs-only repo**: If tracked files are mostly markdown/config and under 10 source files, treat as `PROJECT_TYPE=new` unless `.project_management/` exists.
- **Large monorepo**: If multiple languages or >10 source files, treat as `PROJECT_TYPE=existing` even if the repo is freshly initialized.
- **Repo with only infra files**: If the repo has `Dockerfile`, CI configs, or IaC but no application code, treat as `PROJECT_TYPE=existing`.
- **Empty directory with hidden files**: If `.git` exists but no tracked files, treat as `PROJECT_TYPE=new`.
- **Non-git directory with files**: Prompt the user to initialize git or start fresh (per initiator Step 1.3).
- **.project_management already exists**: Always treat as `PROJECT_TYPE=upgrade` and follow the upgrade path.
- **Generated artifacts only**: If repo contains build outputs or vendor directories without source, prompt the user to confirm intent before classifying.

## Decision Checklist

Use the following quick checks:

- `.project_management/` present? -> `PROJECT_TYPE=upgrade`
- Git repo with >10 source files? -> `PROJECT_TYPE=existing`
- Git repo with <=10 source files? -> `PROJECT_TYPE=new`
- No git repo and empty directory? -> `PROJECT_TYPE=empty`
- No git repo but files exist? -> Ask the user to choose between init vs fresh

## Where This Is Referenced

- `bootstrap/initiator.md` (Step 1: Environment Detection)
- `docs/governance/bootstrap_transcript_example.md`
