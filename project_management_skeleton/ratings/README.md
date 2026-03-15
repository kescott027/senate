# Sprint Ratings Log

This directory contains the append-only sprint ratings log used during sprint closeout.

## File

- `sprint_ratings.jsonl` — append-only JSON lines (one sprint per line)

## Record format

Each line is a single JSON object:

```json
{"sprint_id":"Sprint-000","closed_date":"YYYY-MM-DD","rating":0.0,"rationale":"...","average_after":0.0}
```

## Rules

- Append only. Never rewrite or delete prior lines.
- `rating` must be a decimal from 0.0 to 1.0 (one decimal place).
- `average_after` is the running average after the current entry is added.
- Rationale must reference sprint goals and adherence to senate laws.
