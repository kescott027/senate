#!/usr/bin/env bash
set -euo pipefail

# Regenerate bootstrap/integrity.json with sha256 hashes of all critical files.
# Run from the repository root.
#
# Usage:
#   ./bootstrap/regenerate-integrity.sh              # regenerate integrity.json
#   ./bootstrap/regenerate-integrity.sh --check-only  # verify without writing
#   ./bootstrap/regenerate-integrity.sh --verbose      # print each hash
#
# Requires: python3, sha256sum, git

CHECK_ONLY=false
VERBOSE=false
for arg in "$@"; do
  case "$arg" in
    --check-only) CHECK_ONLY=true ;;
    --verbose)    VERBOSE=true ;;
    *)            echo "Unknown flag: $arg" >&2; exit 1 ;;
  esac
done

if [[ ! -f "CONSTITUTION.md" ]] || [[ ! -d "bootstrap" ]]; then
  echo "ERROR: Must be run from the senate repository root." >&2
  exit 1
fi

if ! command -v python3 &>/dev/null; then
  echo "ERROR: python3 is required." >&2
  exit 1
fi

# Hardcoded individual critical files
INDIVIDUAL_FILES=(
  "bootstrap/initiator.md"
  "CONSTITUTION.md"
  "MEMBERSHIP.md"
  "BOOTSTRAP.md"
  "project_management_bootstrapping.md"
  "project_management_bootstrapping_existing.md"
  "sync/manifest.json"
)

# Dynamically enumerate directories
DYNAMIC_FILES=()
while IFS= read -r f; do
  DYNAMIC_FILES+=("$f")
done < <(find laws/active -name '*.md' -type f 2>/dev/null | sort)

while IFS= read -r f; do
  [[ "$(basename "$f")" == ".gitkeep" ]] && continue
  DYNAMIC_FILES+=("$f")
done < <(find project_management_skeleton -type f 2>/dev/null | sort)

ALL_FILES=("${INDIVIDUAL_FILES[@]}" "${DYNAMIC_FILES[@]}")

# Compute hashes
# Use git's normalized content (LF line endings) to ensure consistent hashes
# across platforms regardless of core.autocrlf or working copy line endings.
HASH_PAIRS=""
MISSING=0
for f in "${ALL_FILES[@]}"; do
  if [[ -f "$f" ]]; then
    # Pipe through tr to strip CR, ensuring LF-only content regardless of platform.
    # This matches what GitHub raw URLs serve and what CI computes.
    hash=$(tr -d '\r' < "$f" | sha256sum | awk '{print $1}')
    HASH_PAIRS="${HASH_PAIRS}${f}=${hash}\n"
    if $VERBOSE; then
      echo "  $hash  $f"
    fi
  else
    echo "WARNING: Critical file missing: $f" >&2
    MISSING=$((MISSING + 1))
  fi
done

if [[ $MISSING -gt 0 ]]; then
  echo "ERROR: $MISSING critical file(s) missing." >&2
  exit 1
fi

COMMIT_SHA=$(git rev-parse HEAD 2>/dev/null || echo "unknown")
TIMESTAMP=$(date -u +"%Y-%m-%dT%H:%M:%SZ")

if $CHECK_ONLY; then
  # Use python3 to compare
  printf '%b' "$HASH_PAIRS" | python3 -c "
import sys, json

# Read computed hashes from stdin
computed = {}
for line in sys.stdin:
    line = line.strip()
    if '=' in line:
        path, h = line.split('=', 1)
        computed[path] = h

# Read existing integrity.json
try:
    with open('bootstrap/integrity.json') as f:
        existing = json.load(f)
except FileNotFoundError:
    print('FAIL: bootstrap/integrity.json does not exist.')
    sys.exit(1)

existing_files = existing.get('files', {})
mismatches = 0

for path, h in computed.items():
    eh = existing_files.get(path, 'MISSING')
    if eh != h:
        print(f'MISMATCH: {path}')
        print(f'  expected: {eh}')
        print(f'  actual:   {h}')
        mismatches += 1

for path in existing_files:
    if path not in computed:
        print(f'REMOVED: {path} (in integrity.json but no longer tracked)')
        mismatches += 1

if mismatches > 0:
    print(f'\nFAIL: {mismatches} integrity mismatch(es). Run ./bootstrap/regenerate-integrity.sh to fix.')
    sys.exit(1)
else:
    print(f'OK: All {len(computed)} critical files match integrity.json.')
    sys.exit(0)
"
else
  # Generate integrity.json with python3
  printf '%b' "$HASH_PAIRS" | python3 -c "
import sys, json

files = {}
for line in sys.stdin:
    line = line.strip()
    if '=' in line:
        path, h = line.split('=', 1)
        files[path] = h

manifest = {
    'version': 1,
    'generated_at': '$TIMESTAMP',
    'commit_sha': '$COMMIT_SHA',
    'algorithm': 'sha256',
    'files': files,
    'secondary_verification': {
        'gist_url': 'https://gist.githubusercontent.com/kescott027/ade8c10d5e75aaba5d185506d890b096/raw/integrity-hashes.json',
        'description': 'Out-of-band hash mirror. If this gist disagrees with integrity.json, the repo may be compromised.'
    }
}

with open('bootstrap/integrity.json', 'w') as f:
    json.dump(manifest, f, indent=2)
    f.write('\n')

print(f'Generated bootstrap/integrity.json with {len(files)} files.')
print()
print('IMPORTANT: Update the secondary verification gist with:')
print(f'  initiator.md hash: {files.get(\"bootstrap/initiator.md\", \"ERROR\")}')
"

  # Print integrity.json's own hash for the gist
  INTEGRITY_HASH=$(tr -d '\r' < bootstrap/integrity.json | sha256sum | awk '{print $1}')
  echo "  integrity.json hash: $INTEGRITY_HASH"
fi
