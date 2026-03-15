# Autonomous AI Development Risks and Mitigations

This document summarizes common risks in autonomous AI development systems and proposes mitigations (tooling, governance, and architecture).

## Risk Map and Mitigations

### 1) Prompt Injection and Indirect Prompt Injection
**Risk:** Agent behavior is hijacked via untrusted content, leading to unsafe actions or data exfiltration. 
**Mitigations:**
- Tooling: Strict input sanitization and allowlisted tool invocation.
- Architecture: Segregate untrusted inputs, enforce policy layers between model and tools.
- Governance: Require HIL for high-risk actions; log all tool invocations.

### 2) Data Leakage and Sensitive Data Exposure
**Risk:** Models leak secrets or sensitive data embedded in prompts or tool outputs.
**Mitigations:**
- Tooling: Secret scanning on logs/artifacts; redaction at ingestion.
- Architecture: Separate secret handling services; minimize prompt context.
- Governance: Least-privilege tokens; explicit approvals for data access.

### 3) Supply Chain and Dependency Vulnerabilities
**Risk:** Vulnerable dependencies or model supply chains introduce security flaws.
**Mitigations:**
- Tooling: Dependency scanning, SCA, pinned versions.
- Architecture: Isolate third-party tools and models; enforce SBOMs.
- Governance: Require security exceptions with ADR + expiry.

### 4) Excessive Agency / Unbounded Actions
**Risk:** Agents take broad actions without proper gating or oversight.
**Mitigations:**
- Tooling: Mandatory HITL gates for policy/security changes.
- Architecture: Permission boundaries around destructive actions.
- Governance: Explicit intent change approvals and scope controls.

### 5) Reliability Gaps and Lack of Monitoring
**Risk:** Agents fail silently or degrade over time without detection.
**Mitigations:**
- Tooling: Structured logging, audit trails, regression tests.
- Architecture: Health checks and watchdog services.
- Governance: Phase-end assessment with required evidence.

## Proposed Governance Updates (Draft Bills)

- Amend LAW-001: Phase-end assessment report and sprint phase progress status.
- Amend LAW-003: Merge hygiene and clean main requirements.
- Amend LAW-005: Phase-end 90% coverage target with waiver process.
- Amend LAW-009: HIL approval required for intent changes.

## Proposed Tooling Updates

- Add `quality-gates.yml` to enforce `actionlint` and `shellcheck`.
- Maintain CodeQL and integrity-check workflows as required security gates.

## References

- NIST AI Risk Management Framework (AI RMF 1.0): https://www.nist.gov/publications/artificial-intelligence-risk-management-framework-ai-rmf-10
- NIST Generative AI Profile: https://www.nist.gov/publications/artificial-intelligence-risk-management-framework-generative-artificial-intelligence
- OWASP Top 10 for LLM Applications: https://owasp.org/www-project-top-10-for-large-language-model-applications/
- Veracode 2025 GenAI Code Security Report: https://www.veracode.com/resources/analyst-reports/2025-genai-code-security-report/
- Lasso Security prompt data leakage study: https://www.lasso.security/blog/lasso-research-reveals-13-of-generative-ai-prompts-contain-sensitive-organizational-data
