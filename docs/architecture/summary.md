# Architecture Summary

## System overview
Senate is a documentation-first governance framework. It provides laws, bootstrap instructions, and a project management scaffold for constituent projects. An AI agent consumes the bootstrap initiator, verifies integrity, and installs governance artifacts into a target repo. Ongoing updates are managed via a sprint-sync protocol that compares law hashes and applies changes.

## Component inventory
- `bootstrap/initiator.md`: single-file bootstrap instructions
- `bootstrap/integrity.json`: sha256 manifest for critical files
- `bootstrap/regenerate-integrity.sh`: integrity verification and regeneration
- `laws/active/`: canonical law set
- `sync/manifest.json` and `sync/README.md`: sync protocol and hashes
- `project_management_skeleton/`: `.project_management/` templates
- `templates/`: local law and sprint sync templates
- `.github/workflows/integrity-check.yml`: integrity CI

## Data flow
1. Agent fetches and verifies `bootstrap/initiator.md`.
2. Agent detects environment and copies skeleton to `.project_management/`.
3. Agent syncs laws based on `sync/manifest.json` hashes.
4. Agent generates backlog and sprint artifacts from BOOTSTRAP input.
5. Constituents repeat sync at sprint start.

## Trust boundaries
- GitHub raw content and Gist are external trust dependencies.
- Local execution trusts the integrity manifest and secondary verification.

## Known risks
- Dependency on GitHub availability for bootstrap and sync.
- Manual error if integrity verification is skipped.
