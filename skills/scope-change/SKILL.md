---
name: scope-change
description: Decomposition gate of the chain. Profiles the change, builds a multi-surface DSM (code/docs/tests/configs), issues a verdict (single-cycle | program + sequencing | coupled-block land-together). Green-baseline pre-condition + necessity filter (DO/DEFER/DROP) + process mode (fitness-authority → accumulate-then-verify vs describe-then-apply). The Profiler reads the registry of deferred options at start (expiry check + trigger matching); DEFER — writes an item into the registry by the schema; DROP — rationale in the charter, bypassing the registry. Output — the charter. Authoring point: re-decomposition + scope/realization (authoring gate).
---

# scope-change

The first skill of the chain and the re-decomposition point. Terminology — [`../../reference/glossary.md`](../../reference/glossary.md) (chain-stage terms — `audit-cycle exit contract`, `frozen checklist`, `decision-defense` — are glossary keys of their carrier skills).

## Role in the chain

`scope-change → specify-change → audit-change → realize → verify-change → reconcile-change`

- **Entry:** a change request (input) **or** a re-decomposition trigger from `audit-change`/`reconcile-change` (coupling exposed mid-cycle).
- **Pre-condition (green-baseline):** before profiling — verify that the gates pass (an explicit run). If red → **preliminary greening**: a prerequisite-change fixes the gate BEFORE this change; never start a change on a red gate (the exception — the prerequisite-change itself, which greens the gate). See glossary: green-baseline, gate-closing fast-track. A dirty tree of someone else's parallel work at start → the baseline runs in a worktree isolated from HEAD (the gate container gets a co-mount of the main `.git` by absolute path; the recipe lives in the project calibration); the charter carries `product-root` (materialized by executing a real deferred-options registry item).
- **Output:** charter (decomposition verdict + per-cycle profile + sequencing + land-together under surface-conflict).

## What it does

1. **Profile** — surfaces touched: code, docs, tests, configs (import graph, grep). size, coupling, risk, DDD-tier, blast-radius. The Profiler reads the registry of deferred options at start (expiry check + trigger matching). **+ fitness-authority** (which tool verifies the change) → sets the **process mode**: accumulate-then-verify for tool-authoritative (see glossary: `Process-mode: accumulate-then-verify`). **Formation-brief (R1):** pre-request code reading to understand ≥2 thematic blocks or ~100k input (retro estimate) → a formation spike ≤40k (glossary: `spike`); output — the formation-brief (program-brief: claim-list + topic TOC, `scope-change-<slug>/claim-list.md`), passed to the Profiler as an input option. A dispatched spike's return is governed by the two-branch completion rule (glossary: `dispatch-completion`): completion = the named product artifact (the claim-list / the formation brief) parses into the mandate's declared contract form; a product-less return is incomplete — the same agent completes it.
2. **Multi-surface DSM** — the dependency matrix **across all touched surfaces**, not code alone (see glossary: multi-surface DSM).
3. **Verdict** — three granularity axes, independent decisions (glossary: `decomposition-verdict`): **work-unit** (units of work/specification), **verify-unit** (units of verification), **land-unit** (units of merge). Deriving one axis from another (work from land semantics) is an antipattern.
   - **single-cycle** → severity-mode (Tiny/Small/Standard/Deep).
   - **program** → Parnas-seams + DSM-topology (independent / sequential / coupled-blocks) + sequencing + integration points.
   - **surface-conflict** (code-disjoint, doc-coupled) → **coupled block**: `land-together` (separate cycles, merged as a unit — **only if every cycle is green-committable**) or `merge` (if intermediate red cycles cannot be committed — e.g. project policy "no commit at red gate"; then one cycle, commit when all green).
   - **A collapse verdict (any collapsing of work granularity) — only through a recorded per-item pass of the Collapse-checklist** (the Profiler's mandate: [`assets/decomposer-charter.md`](assets/decomposer-charter.md)).
4. **Necessity filter (do/don't-do)** — after the verdict, every cycle is filtered against the calibration (see glossary: necessity filter): **DO** / **DEFER** (write an item into the deferred-options registry by the schema) / **DROP** (rationale in the charter, bypassing the registry). A program of N cycles → some may turn out speculative/over-engineering (DROP) or a long-term investment on an unstable stage (DEFER) — excluded from work. Methodology-derived, not a user menu.
5. **Charter** — per-cycle profile/severity/blast-radius/reconcile-level/**necessity-verdict** + sequencing + registry (open coupling-items, revision-conditions; DEFER/DROP — with rationale).

## Multi-surface DSM (invariant)

A DSM over the code surface **alone misses coupling** on doc/test/config surfaces. Changes can be independent on code and coupled on docs → a doc-rewrite becomes a coupled block, resolved together. **The DSM is always across all touched surfaces.** (Found in real decomposition runs: code-disjoint, doc-coupled.)

## Authoring point (pressure-sensitive)

Re-decomposition shapes the structure of the work (what as one change, what as a sequence, what as land-together). This is a pressure-sensitive decision: **present the verdict + options (merge / land-together / split) to the user and obtain the decision — the user is the terminal authority at this gate.** Never decide silently.

## Cycle

1. File exchange: `.claude/tmp/scope-change-<slug>/`.
2. The orchestrator is a pure coordinator (passes paths, reads the charter header) and maintains the role roster (glossary: `role roster`): creates `.claude/tmp/<slug>/roster.md` at the first dispatch and updates a row's state at every state change; at each return point it applies the role's output-contract parse rule (glossary: `output contract`) and marks the row.
3. **Profiler** — a fresh subagent (not the change-request author). Mandate — [`assets/decomposer-charter.md`](assets/decomposer-charter.md). Profiles + builds the multi-surface DSM + issues the verdict + options. Dispatch/return — the two-branch completion rule (glossary: `dispatch-completion`; canon — [`../../norms/dispatch-completion.md`](../../norms/dispatch-completion.md)): a charter that parses into the Profiler's output contract completes the launch (never re-entered); a launch ending without one is completed by the same agent within the same frame.
4. Verdict + options → authoring point (the user) → the recorded decision → charter.

## Launch

slug + change-request (or re-decomposition context: which coupling was exposed, on which surface, by which skill). The orchestrator creates the tmp-directory, passes it to the Profiler, reads the charter from the file, presents the options.
