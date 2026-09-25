---
name: realize-change
description: The realize stage of the change chain — spec execution: a Tier-1 continuous closed loop (edit→gate→edit) over implementation-units within the frame. Dispatch by the R-21 threshold (process-mode × severity → realizer-subagent or orchestrator); every realize decision — an impl-ledger record at the moment it is taken; a significant shift — STOP + authoring question. Exit criterion — Tier-1 green, confirmed by the orchestrator.
---

# realize-change

The execution stage of a change. Terminology — [`../../reference/glossary.md`](../../reference/glossary.md) (chain-stage terms — `audit-cycle exit contract`, `decision-defense`, `monitor summary`, `standards profile`, `terminal authority` — are glossary keys of their carrier skills); the executor's mandate — [`assets/realizer-charter.md`](assets/realizer-charter.md).

## Role in the chain

`scope-change → specify-change → audit-change → realize → verify-change → reconcile-change`

- **Entry:** the spec is finalized (checkpoints resolved) + an audit verdict of `clean` (non-tool-authority), or a light-frame spec (tool-authoritative).
- **Output:** the executed S4 units + the cycle's impl-ledger; **Tier-1 green, confirmed by the orchestrator** (executor ≠ authority).

## What it does

1. **Dispatch** — the R-21 threshold (table — charter): non-tool-authority → a realizer-subagent unconditionally; tool-authoritative: severity ≥ Standard → a subagent, Tiny/Small → the orchestrator inside the Tier-1 loop. The registry-lifecycle duty (impl-ledger) — at every depth. Dispatch/return — the two-branch completion rule (glossary: `dispatch-completion`; canon — [`../../norms/dispatch-completion.md`](../../norms/dispatch-completion.md)): green delivery confirmed by the orchestrator completes the launch; WHEN the orchestrator confirms Tier-1 red, or an L1 fix (a verify adjudication) is to be applied, a fresh realizer is dispatched (not a resume); halting-table stops inside the mandate return to the same realizer.
2. **Tier-1 continuous loop** — units in S4 order: edit → gate → edit until green. Gates = the spec's fitness canons, tool-agnostic across repo classes: a product repo — instrumental gates (test/typecheck/knip/doc-links); the process skill repo — authoring invariants + the spec's grep canons + self-application. **Spike-before-edit** (R4): the registry sign "unfamiliar mechanics" → a spike before the edit (protocol — charter).
3. **Impl-ledger** — every realize decision gets a record at the moment it is taken (glossary: `impl-ledger`; protocol — charter): a minor reversible one — a record without a checkpoint; a spec-gap — a record without stopping (PSP); the carrier of the realize stage's SENSOR lines.
4. **Halting** (triggers; the full table — charter): frame-threat / research-need / significant fork → **STOP + authoring question** (glossary: `authoring-gate`), return to the orchestrator.

## Exit criterion

**Tier-1 green, confirmed by the orchestrator.** The Realizer executes and runs the gates (executor); green is confirmed by the orchestrator (authority) — realize does not self-accept, the two-tier discipline holds (verify-change = Tier-2 next).

## Cycle

1. File exchange: `.claude/tmp/realize-change-<slug>/` — `impl-ledger.md` (RL-n records, an id-space shared with the spec registry R-xx).
2. The orchestrator hands the realizer the spec + charter + registry paths + the codebase; research artifacts are NOT input — a need for them = halt + a scope-completeness finding (fix the spec, do not build a shadow channel). Relayed numeric claims (counters, sizes, line counts) enter task prompts and summaries only as copy-paste from a fresh run, with the run command quoted in the brief — not from memory or arithmetic. The orchestrator maintains the role roster (glossary: `role roster`): creates `.claude/tmp/<slug>/roster.md` at the dispatch and updates a row's state at every state change.
3. On completion: the orchestrator applies the realizer's output-contract parse rule (glossary: `output contract`) at the return point and marks the roster row, runs the gate canons, confirms Tier-1 green, starts verify-change. For eval-first RUN channels the orchestrator also re-runs the blank counters (T3/consensus fields) after the readers finish — the closing RUN gate is a re-run, not a relay (a run-discipline RCA of a real incident series).
4. **LAND point (self-change cycles):** the L1–L5 invariant table × evidence + a SHADOW line in the tmp dir (`invariants-L.md`); the cycle's realize directory is entered into the metrics-ledger window list (M8 visibility of realize SENSOR lines; monitor.md "Window").

## Invariants

- **Frame:** edits only in may_modify; closed sets (M1–M8, L1–L5, the Event taxonomy, sensor enumerations) untouched.
- **Fagan-independence:** realizer ≠ verifier (the realizer role, referentially — verify-change/SKILL.md); realize does not edit verify-change/**, audit-change/** (self-change cycles whose surface is the chain's own skills: Fagan-independence is provided by a fresh Tier-2 Verifier, not by a surface ban).
- **Interface discipline:** input = spec + charter + registry + the codebase (independent access).
- **No commits:** land — a per-cycle commit on the author's explicit command.

## Launch

The spec path + charter path + the cycle's slug (tmp-dir) + the audit verdict.
