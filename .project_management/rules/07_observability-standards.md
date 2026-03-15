---
law_id: LAW-007
title: Observability Standards
status: active
enacted: "2026-03-13"
last_amended: null
origin_bill: null
sponsors: []
---

# LAW-007: Observability Standards

## Requirements

- **Structured logs with request/task correlation IDs.** All log entries must be structured (JSON or equivalent) and include correlation IDs that allow tracing a request or task across system boundaries.
- **Metrics: latency, error rate, throughput, queue depth.** Core operational metrics must be collected. At minimum: request latency, error rate, throughput, and queue depth (if queues are used).
- **Audit events immutable and queryable.** Audit events must be stored in an append-only, queryable format. They must not be editable after creation.
- **Alerting required by Phase 2.** By Phase 2 (production readiness), automated alerting must be configured for critical operational thresholds.
