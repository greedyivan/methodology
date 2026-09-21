---
name: specify-change
description: Produces the change spec (5 strata - intent, contract+frame, examples/properties, registry, realization-design-set). Spec depth is calibrated by process mode (light/emergent for tool-authoritative; full 5-strata for non-tool-authority). S2 closes the traceability triangle (behavior-test-doc). Emits checkpoints (an authoring gate for scope/realization forks). Output - the spec.
---

# specify-change

Generative skill: produces the spec from the charter. Terminology — [`../../reference/glossary.md`](../../reference/glossary.md) (chain-stage terms — `instance`, `cycle workspace`, `pre-request stage`, `coordination mechanism by coupling type`, `decision-defense`, `monitor summary`, `trigger-matching point` — are glossary keys of their carrier skills).

## Role in the chain

`scope-change → specify-change → audit-change → realize → verify-change → reconcile-change`

- **Entry:** charter (from `scope-change`).
- **Output:** spec (5 strata + frame + registry + fitness map).

## Spec depth (two-tier)

The spec depth is calibrated by `Process-mode: accumulate-then-verify` / `Two-tier verification` (glossary):
- **Tool-authoritative** (dead code→knip, types→typecheck, behavior→tests): spec = **light/emergent** — intent + frame + triangle-key(s) + fitness tools; details surface in research edits (the Tier-1 continuous loop). NOT a line-level realization-design-set.
- **Non-tool-authority** (design fork, contract change, high risk): spec = **full 5-strata** (contract: invariants/examples/registry) — research edits are insufficient, an upfront contract is needed (→ `audit-change` pre-realize).

## 5 strata (by decreasing stability)

0. **Intent** — goal / outcome / success signal, scope in/out, contextual stops.
1. **Contract + frame** — invariants / postconditions / preconditions + **frame** (MAY modify / MUST preserve); on seams and domain invariants, not on methods. **The stable core.**
2. **Examples / properties** — G/W-T scenarios (each to a Rule of the contract), edge cases, PBT properties. **Behavior-adding/modifying: close the traceability triangle (glossary) — traceability-key(s) → test scenarios (executable examples) → doc surfaces. Behavior-preserving: the existing key tests stay green.** Behavior requirement lines of S1/S2 — EARS format (glossary: `EARS`): full 5-strata (non-tool-authority) — mandatory; light/emergent (tool-authoritative) — optional (at the executor's discretion).
3. **Registry** — every fork / question / assumption / decision with a classification (pressure-sensitive: *reversibility × info-value*) + revision-condition.
4. **Realization-design-set** — implementation-units at the level of capabilities/modules as a **set of admissible designs** (glossary: `SBCE`): ≥2 polarized designs, fixed comparison axes, a mandatory recommendation. The checklist — in the Specifier's mandate ([`assets/specifier-charter.md`](assets/specifier-charter.md), "Stratum-4 checklist"). NOT line-level (that is realize).

## Frame

The contract boundary: what the change **MAY** modify, what it **MUST** preserve. An explicit field of the spec — not implied.

## Registry + classification

Every decision/question — with a classification (*reversibility × info-value-of-waiting*): **pressure-sensitive** (irreversible + low-info) → MUST resolve before realize; reversible → may be deferred-with-trigger. A revision-condition for deferred items (info + expiry) and for accepted ones (trigger). An empty registry = "did not look enough".

## Checkpoints (emit-and-halt; mandatory on a significant scope/method shift)

A checkpoint exists so that **the change requester stays in context** on a significant shift of scope or realization approach — their intent/values = the ground truth that the agent verifies, not replaces. There are no optional checkpoints: a significant shift → a mandatory halt. Frontier questions between checkpoints — in batches with recommended answers (glossary: `frontier`; the protocol — in the Specifier's mandate, "Frontier protocol").

- **Checkpoint 1** (after S0–S1): intent + contract + frame + pressure-sensitive forks.
- **Checkpoint 2 + gate** (after S2–S3): examples + registry; pressure-sensitive resolved (a hard stop for core/seams).

### Decision at a checkpoint — Value-Focused Thinking / MCDA (not "think for me")

The decision is **criterion-oriented**, not preference-based (Keeney, *Value-Focused Thinking*; Keeney-Raiffa, *Decisions with Multiple Objectives*). Order:

1. **Values/criteria first** — derived from the change's intent/type/invariants (NOT from the alternatives; alternative-focused thinking — an antipattern).
2. **Alternatives scored** against the criteria (evidence-based).
3. **The author provides value-weights** — which criteria matter more (only the intent-holder knows).
4. **The decision follows** from criteria × weights — not arbitrariness, not "choose for me".

**The agent's role** — alternatives × criteria × evidence (analysis). **The author's role** — value-weights (priorities). Neither does the other's work: NOT "think for me" (the agent offloading) AND NOT "the agent decides alone" (bypassing the intent).

## Cycle

1. File exchange: `.claude/tmp/specify-change-<slug>/`.
2. The orchestrator — a pure coordinator (passes paths, reads the spec header, emits checkpoints). Relayed numeric claims (counters, sizes, line counts) enter task prompts and summaries only as copy-paste from a fresh run, with the run command quoted in the brief — not from memory or arithmetic. Before launching audit — a control re-run of the spec's own counters (header, registry tables, summary records): a discrepancy — return to the Specifier.
3. **Specifier** — a subagent (fresh for complex changes). Mandate — [`assets/specifier-charter.md`](assets/specifier-charter.md). Produces the 5-strata spec from the charter + the codebase. Self-change cycle: the finalized spec carries the L1–L5 × evidence invariant table (PCC; legitimacy-invariants).
4. Checkpoint 1 → the authoring point (halt) → resolution → (Checkpoint 2) → spec finalized → passed to `audit-change`.
5. **Exit self-check (spec → FINAL) — a mechanical gate:** the final transition into FINAL is accompanied by an enumeration run — the S1/S2 lines declaring a runnable check (grep/probe/command) are listed by a grep over the spec's gate lines, the run records of the exit table are listed by their own marker, and the two counts are compared in the exit record; a divergence (N ≠ N, or a gate without its authoring-time run record beside it, both directions) = red, not FINAL. Run form (in the exit record, commands + outputs): `grep -c '<Check-line marker>' spec.md` vs `grep -c '<run-record marker>' <exit table/witnesses>`. A Check declaring a grep/pattern states its literal/pattern and carries a both-direction probe fact at authoring time — a patternless grep declared as a Check does not count as run-pinned.

## Multi-type changes

If a change mixes types (e.g. dead-code-removal + refactor) — S1/invariants and scope-completeness are considered **per-concern** (DCE-fixpoint for the dead-removal part; behavior-preservation for the refactor part). Types are not merged into one criterion.

## Launch

slug + charter path (+ optionally prior-spec/partial-work). The orchestrator creates the tmp, passes it to the Specifier, emits Checkpoint 1.
