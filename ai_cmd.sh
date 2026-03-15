#!/usr/bin/env bash
set -euo pipefail

# AI command wrapper with logging
# NOTE: Redaction is applied only to stdin logs. STDOUT/STDERR are NOT redacted.
# Usage: ./ai_cmd.sh <command> [args...]

repo_root="$(pwd)"
config_file="$repo_root/.log_config"
session_file="$repo_root/.ai_cmd_session"

log_dir="${HOME}/tecthulhu/ai_logs"
config_session_start=""
log_stdin="0"
redact_patterns=()

if [[ -f "$config_file" ]]; then
  while IFS= read -r line; do
    case "$line" in
      LOG_DIR=*) log_dir="${line#LOG_DIR=}" ;;
      SESSION_START=*) config_session_start="${line#SESSION_START=}" ;;
      LOG_STDIN=*) log_stdin="${line#LOG_STDIN=}" ;;
      REDACT_REGEX=*) redact_patterns+=("${line#REDACT_REGEX=}") ;;
    esac
  done < "$config_file"
fi

session_start=""
session_dir=""

if [[ -n "$config_session_start" ]]; then
  session_start="$config_session_start"
fi

if [[ -f "$session_file" ]]; then
  while IFS= read -r line; do
    case "$line" in
      SESSION_START=*) session_start="${line#SESSION_START=}" ;;
      SESSION_DIR=*) session_dir="${line#SESSION_DIR=}" ;;
    esac
  done < "$session_file"
fi

if [[ -z "$session_start" ]]; then
  session_start="$(date -u +"%Y%m%dT%H%M%SZ")"
fi

if [[ -z "$session_dir" ]]; then
  session_dir="$(basename "$repo_root")"
fi

mkdir -p "$log_dir"
base_file="${log_dir}/${session_dir}_${session_start}"
log_file="${base_file}.log"
out_log="${base_file}.out.log"
err_log="${base_file}.err.log"
in_log="${base_file}.in.log"

# Persist session info for consistent logfile naming across commands
if [[ ! -f "$session_file" ]]; then
  {
    echo "SESSION_START=${session_start}"
    echo "SESSION_DIR=${session_dir}"
  } > "$session_file"
fi

if [[ $# -eq 0 ]]; then
  echo "No command provided." >&2
  exit 2
fi

cmd_str="$*"
cmd_str="${cmd_str//$'\t'/ }"
cmd_str="${cmd_str//$'\n'/ }"

start_ts="$(date -u +"%Y-%m-%dT%H:%M:%SZ")"
printf '%s\tSTART\t%s\t%s\n' "$start_ts" "$repo_root" "$cmd_str" >> "$log_file"

set +e
redact_line() {
  local line="$1"
  for re in "${redact_patterns[@]:-}"; do
    if [[ -n "$re" ]]; then
      line="$(printf '%s' "$line" | sed -E "s/${re}/[REDACTED]/g")"
    fi
  done
  printf '%s' "$line"
}

run_with_logging() {
  "$@" \
    1> >(while IFS= read -r line; do
            ts="$(date -u +"%Y-%m-%dT%H:%M:%SZ")"
            printf '%s\tSTDOUT\t%s\n' "$ts" "$line" >> "$out_log"
            printf '%s\n' "$line"
          done) \
    2> >(while IFS= read -r line; do
            ts="$(date -u +"%Y-%m-%dT%H:%M:%SZ")"
            printf '%s\tSTDERR\t%s\n' "$ts" "$line" >> "$err_log"
            printf '%s\n' "$line" >&2
          done)
}

if [[ "$log_stdin" == "1" && ! -t 0 ]]; then
  tmp_in="$(mktemp)"
  cat > "$tmp_in"
  while IFS= read -r line; do
    ts="$(date -u +"%Y-%m-%dT%H:%M:%SZ")"
    redacted="$(redact_line "$line")"
    printf '%s\tSTDIN\t%s\n' "$ts" "$redacted" >> "$in_log"
  done < "$tmp_in"
  run_with_logging "$@" < "$tmp_in"
  rm -f "$tmp_in"
else
  run_with_logging "$@"
fi
exit_code=$?
set -e

end_ts="$(date -u +"%Y-%m-%dT%H:%M:%SZ")"
printf '%s\tEND\t%s\t%s\texit=%s\n' "$end_ts" "$repo_root" "$cmd_str" "$exit_code" >> "$log_file"

exit "$exit_code"
