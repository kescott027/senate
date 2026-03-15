# Blockers Directory

This folder tracks blocker lifecycle artifacts.

## Layout

- `active/`: open blockers only
- `closed/`: resolved blockers only

## File naming

`BLOCKER_<YYYY-MM-DD>_Sprint-<NNN>_STORY-<NNNN>_<short-name>.md`

Example:
`BLOCKER_2026-03-03_Sprint-000_STORY-0002_ci-diff-base.md`

## Required sections in each blocker file

- `# BLOCKER-...`
- `Status: Active|Closed`
- `Blocked Story`
- `Decision Needed`
- `Options and Trade-offs`
- `Constraints`
- `Unblock Criteria`
- `Decision Log`
- `Cross-Document Updates`
