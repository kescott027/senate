#!/usr/bin/env python3
import argparse
import json
import sys
from pathlib import Path

ROOT = Path.cwd()

REQUIRED_PM_FILES = [
    "Backlog.md",
    "Current_Sprint.md",
    "Decision_Matrix.md",
    "Project_Sprint_Log.md",
    "Rules.md",
    "Sprint_TEMPLATE.md",
    "epics.md",
    "state/current_state.json",
    "stories/TEMPLATE.story.md",
    "blockers/README.md",
    "blockers/BLOCKER_TEMPLATE.md",
    "blockers/active/.gitkeep",
    "blockers/closed/.gitkeep",
]

REQUIRED_ROOT_FILES = [
    "AI_ENTRYPOINT.md",
    "sync/manifest.json",
    ".senate-sync.json",
]


def load_json(path: Path, errors: list, label: str):
    try:
        return json.loads(path.read_text())
    except FileNotFoundError:
        errors.append(f"Missing {label}: {path}")
    except json.JSONDecodeError as exc:
        errors.append(f"Invalid JSON in {label}: {path} ({exc})")
    return None


def main() -> int:
    parser = argparse.ArgumentParser(description="Verify senate bootstrap artifacts")
    parser.add_argument("--root", default=str(ROOT), help="Repository root to verify")
    parser.add_argument("--verbose", action="store_true", help="Print checks as they run")
    args = parser.parse_args()

    root = Path(args.root).resolve()
    errors = []

    def check(path: str, description: str):
        target = root / path
        if not target.exists():
            errors.append(f"Missing {description}: {path}")
        elif args.verbose:
            print(f"OK: {description}: {path}")

    if not (root / ".project_management").is_dir():
        errors.append("Missing .project_management directory")
    else:
        for rel in REQUIRED_PM_FILES:
            check(f".project_management/{rel}", f"project management file")

    for rel in REQUIRED_ROOT_FILES:
        check(rel, "root file")

    manifest = load_json(root / "sync/manifest.json", errors, "sync manifest")
    sync_state = load_json(root / ".senate-sync.json", errors, "sync state")

    if manifest:
        laws = manifest.get("laws", {})
        if not laws:
            errors.append("sync/manifest.json has no laws listed")
        else:
            for law_id, meta in laws.items():
                law_file = meta.get("file")
                if not law_file:
                    errors.append(f"Law entry missing file for {law_id}")
                else:
                    check(law_file, f"law file {law_id}")

    if sync_state:
        if "last_sync" not in sync_state:
            errors.append(".senate-sync.json missing last_sync")
        laws = sync_state.get("laws") or sync_state.get("law_hashes")
        if not isinstance(laws, dict):
            errors.append(".senate-sync.json missing laws map (laws or law_hashes)")
        elif manifest and "laws" in manifest:
            manifest_laws = set(manifest["laws"].keys())
            missing = sorted(manifest_laws - set(laws.keys()))
            if missing:
                errors.append(
                    "Missing law entries in .senate-sync.json: " + ", ".join(missing)
                )

    if errors:
        print("BOOTSTRAP VERIFICATION FAILED")
        for err in errors:
            print(f"- {err}")
        return 1

    print("BOOTSTRAP VERIFICATION PASSED")
    return 0


if __name__ == "__main__":
    sys.exit(main())
