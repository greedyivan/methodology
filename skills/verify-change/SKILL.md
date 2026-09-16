---
name: verify-change
description: Tier-2 sparse independent semantic-checkpoint (post-realize). A fresh Verifier (≠ realizer, Fagan-independence — bias correction for bus-factor-1) checks ONLY the semantic (where a tool is absent): assertion-guards (observable-outcome + an independent `test-oracle`), doc factual-truth, design fitness. Mechanical is closed in the Tier-1 continuous loop (the orchestrator confirms green). Output — adjudication L0-L4 + trigger classification.
---

# verify-change

The adversarial gate between realize and `reconcile-change`. Terminology — [`../../reference/glossary.md`](../../reference/glossary.md) (chain-stage terms — `coordination mechanism by coupling type`, `decision-defense`, `legitimacy invariants` — are glossary keys of their carrier skills).

## Role in the chain

`scope-change → specify-change → audit-change → realize → verify-change → reconcile-change`

- **Entry:** the realization (code+docs changes vs baseline) + the spec (the contract) + fitness-gate results.
- **Output:** **adjudication L0-L4** + a trigger classification (neutral-info vs impl-pressure) per discrepancy.

## Two-tier role

`verify-change` = **Tier-2 sparse independent semantic-checkpoint** (glossary: Two-tier verification). Mechanical is closed in **Tier-1** — the continuous closed loop (edit→gate→edit) during realize, where the tool = an independent authority (test/typecheck/knip/traceability/doc-links). The orchestrator **confirms Tier-1 green** before Tier-2 starts — mechanical is not duplicated here. If Tier-1 is red → return to realize.

Tier-2 = **fresh-context adversarial** (≠ realizer; Fagan-independence — bias correction), **semantic only** (where a tool is absent, author-bias is dangerous), **not a cycle** — a one-off checkpoint.

## What is verified (Tier-2 semantic-only)

**Tier-1 confirmed (the orchestrator, not the Verifier):** gates green (test/typecheck/knip/doc-links/traceability); frame-mechanical (the git diff within MAY/MUST); DCE-fixpoint (knip). These are closed in the continuous loop — the Verifier does not duplicate them (only records "Tier-1 green" as a pre-condition).

**Tier-2 semantic (the Verifier's focus):**
1. **Assertion-guards (I-REF-semantic, two axes):** the tests of the affected behavior **guard** it. **1a observable-outcome** — the assertion is on an observable outcome, not internal-state/mock/stub/assert-on-constant. Refactor — the pure-extracted functions are behavior-equivalent (the assertion catches the difference). Modify — the changed behavior is covered by a **meaningful** test (not "the old test green on the new code"). High-risk → mutation (Stryker JS / Infection PHP). **1b oracle-independence** — the expected comes from an independent source (glossary: `test-oracle`); the operational check — in the Verifier's mandate.
2. **Doc factual-truth (I-DOC-semantic):** doc-claims are factually true relative to the live code (two-tier: symbols + behavioral-claims) — no descriptions of the removed/nonexistent as existing; no false behavioral-claims. (doc-links-green = Tier-1; semantic-truth = Tier-2, read-through.)
3. **Design fitness (non-tool-authority changes):** for a design-fork / contract / high-risk — the decision is fit against the spec/frame (where tool-authority is absent, author-bias is dangerous).

## Adjudication L0-L4 (output; glossary)

| Level | What | Action |
|---|---|---|
| **L0 Tolerate** | the info exposes an inaccuracy, but `EVI < cost` | record the assumption/limitation, do NOT revise |
| **L1 fix-realization** | the realization does not satisfy the contract; the spec is intact | fix the code/docs |
| **L2 expand (AGM)** | the info is consistent with the spec, adds detail/example | extend the spec (the frame is stable) |
| **L3 minimal-revise compatible** | the info is inconsistent; a minimal revision (LSP-compatible — strengthen post / weaken pre) | revise spec + realization |
| **L4 re-baseline breaking** | a non-minimal revision | change control / major-bump |

**Minimal-change preference:** L0 > L1 > L2 > L3 > L4 (prefer the SMALLEST level that closes the discrepancy).

**Trigger classification** (per discrepancy):
- **neutral-info** — new information, a legitimate revision (the contract was incomplete).
- **impl-pressure** — implementation pressure distorted the decision (smell: the specification/realization gate did not fire → a lesson into the methodology).

## Checkpoint (verdict + adjudication; not a cycle)

1. File exchange: `.claude/tmp/verify-change-<slug>/`.
2. The orchestrator — a pure coordinator (paths, headers). **Confirms Tier-1 green** (the gates) before starting the Verifier.
3. **The Verifier** — a fresh subagent (not the realizer). Mandate — [`assets/verifier-charter.md`](assets/verifier-charter.md). Checks **Tier-2 semantic only** (mechanical is already Tier-1); delivers an adjudication per discrepancy.
4. Adjudication → `L0`/`L1` (close / fix-realization, without reconcile) or `L2-L4` (→ `reconcile-change`). Adjudications additionally pass the trigger-matching point against the deferred-options registry (verify-adjudication class; a firing → an R4 authoring question, the record — a section in the verdict artifact).
5. **read-reinspect (closing L1):** every applied L1 fix (fix-realization) is closed by a read-reinspect — a fresh reader (a subagent ≠ realizer and ≠ the Verifier who delivered the adjudication) re-reads the applied fixes + their immediate consumption-sites; the outcome (confirmation/discrepancy) is recorded in the verdict artifact. Mandatory at ≥1 applied L1 fix of any application loop — including the orchestrator's fixes in a run combining the Tier-1 loop and the Tier-2 checkpoint; a cycle without L1 fixes generates no step. Not a second verify run: a scoped re-check of the changed, within a single checkpoint. Differentiation from the audit stage's `re-inspection-scope` — glossary.
6. **Monitor LAND-point:** the orchestrator executes a `monitor summary` (glossary; the procedure — [`../../norms/monitor.md`](../../norms/monitor.md)) at the completion of every change/cycle: the M1–M8 aggregation over the window, signals against pre-registered norms (calibration §⑨), appending into the project metrics-ledger. Formative — does not gate. A signal firing → an authoring question (the R4 canon, not an auto-gate). Sensor duty: own deviations — a `SENSOR` line.

## Invariants

- **Fresh-context** — the Verifier ≠ realizer (not the author of the realization).
- **read-reinspect** — an L1 fix is closed by a fresh reader (≠ realizer ≠ Verifier); mandatory at ≥1 applied L1 fix (glossary: `read-reinspect`).
- **Does not re-create the specification** — verifies compliance with the existing contract.
- **Causal-analysis** (glossary): a recurrent class of discrepancies across cycles → a mandatory RCA → eliminate the root cause (CMMI CAR / ODC).
- Adjudication with minimal-change preference.
- **L2-L4 → `reconcile-change`:** if the skill does not exist → **skill-gap closure** (glossary): STOP → build from this very case → verify by processing it → CONTINUE. Do not handle L≥2 ad-hoc.
