# init-change — interview protocol

Per-dimension questions for eliciting the calibration. Ask by dimension (or by cluster); record the answers with a rationale.

## 1. External issues (ISO 4.1)
- Who is the customer / the product's end consumer?
- Which upstream dependencies (external services/APIs the project depends on)? What is the ownership model (ours/theirs)?
- Regulatory / contractual obligations?
- Deadlines / milestones / stage?
- Deploy domains and environments (prod / staging / dev)? Who has access?

## 2. Internal issues (ISO 4.1)
- The project's architectural role (BFF? SPA? a service? a monolith? middleware?)
- Codebase stage (early / mature; greenfield / legacy; active development / maintenance)
- The team (size, distribution across services, rotation, bus-factor)

## 3. Stakeholders + concerns (ISO 4.2 + ABC)
- Who are the stakeholders (customer, team, auditors, end-users, adjacent teams)?
- Which quality-attributes are critical — **rank** them (performance, security, reliability, modifiability, observability, time-to-market)? Which are not?

## 4. Scope (ISO 4.3)
- The project's boundaries — what is included / what is NOT (a monorepo? which services? what is external/foreign)?

## 5. Seams/contracts + tooling (ISO 4.4 + ABC tech-env)
- Which contracts / seams **must not be broken** (interface owners — OpenAPI, public API, event-schemas)? Where do they live?
- Which automatic gates exist (lint, typecheck, test, doc-links, dead-code/knip, security, traceability)? Which are **authoritative** (blocking), which **advisory**?
- Tooling conventions (docker-only? make? host-curl/jq banned? language?)

## 6. Dev process + commit/deploy (ISO 4.4)
- Commit/merge policy (red-gate? branching convention? who is the approver? squash/merge/rebase?)
- Deploy process (CI/CD, werf, GitLab CI? master→prod / develop→dev?)
- Doc-framework (Diátaxis? style? language? gates?)

## 7. Developing organization (ABC)
- The product's business goals (what is critical for success)
- Org structure — who owns the adjacent systems (upstream/downstream)
- Product-lines / related products (shared code? a shared owner?)

## 8. Severity calibration (derived — risk-tolerance × quality-attributes)
- What counts as a **Tiny / Small / Standard / Deep / Program** change HERE? Thresholds (LOC? blast-radius? DDD tier? risk? the number of affected surfaces?)
- Which changes require the full cycle (scope→...→verify), which — a fast-path?
