---
name: audit-change
description: Adversarial verification of a spec before realize (retained for non-tool-authority; lighter/skip for tool-authoritative — Tier-1 continuous-loop pre-empts). Fresh context: 4 categories (silently-made/deferred, mis-classified, scope-completeness incl. traceability-triangle). Verification against a frozen checklist (before round 1); verdict by the exit contract (0 blocker/major + MINOR with disposition); scoped re-inspection; round-ledger + amplitude control bounds M/N. Verdict-only — does not edit the spec, blocks by returning it to specify-change.
---

# audit-change

Adversarial gate between `specify-change` and realize. Terminology — [`../../reference/glossary.md`](../../reference/glossary.md) (chain-stage terms — `coordination mechanism by coupling type`, `decision-defense`, `monitor summary` — are glossary keys of their carrier skills).

## Role in the chain

`scope-change → specify-change → audit-change → realize → verify-change → reconcile-change`

- **Entry:** the spec + charter artifacts exist (`.claude/plans/` or `.claude/tmp/`). Without a spec — does not start.
- **Output:** a verdict by the `audit-cycle exit contract` (glossary): `clean` (0 blocker/major ∧ MINOR with disposition → realize) | `blocked` + typed findings (→ return to `specify-change`).

## Two-tier role

The audit depth is calibrated by `Two-tier verification` (glossary):
- **Tool-authoritative** (dead-code→knip, types→typecheck, behavior→tests): audit **lighter/skip** — the Tier-1 continuous loop (edit→gate→edit) pre-empts; the tool verifies realize as edits land, a pre-realize spec-verify is redundant. (spec = light frame.)
- **Non-tool-authority** (design-fork, contract, high-risk — where research-edits are insufficient and an upfront contract is needed): audit **retained** — full adversarial pre-realize spec-verification (the 4 categories below).

## What is verified (4 categories)

1. **Silently-made** — a decision made in the spec without a registry record.
2. **Silently-deferred** — a decision deferred past the LRM without a revision-condition.
3. **Mis-classified pressure-sensitive** — irreversible + low info-value marked as deferrable (or the reverse).
4. **Scope-completeness** — real surfaces/artifacts/decision-sites touched by the change but absent from the spec/charter. Cross-checked against the codebase (import graph, barrel re-exports — canon: when a file was deleted, its re-export in `index.ts` was forgotten). **For behavior changes — includes the traceability triangle (glossary): are key→test→doc closed for the new/changed behavior (the spec identified F-ID(s) + test-scenarios + doc-surfaces).**

## Cycle (verdict-only, no fix phase)

1. **Freeze the standard before round 1** (glossary: frozen checklist). The orchestrator derives the checklist from the canon (glossary: 4 categories × dimensions + basic grep checks; the derivation procedure — verifier-charter) into the cycle tmp-dir (`checklist-freeze.md`, with a date). No checklist = stop: the round does not start. The checklist is monotonic within the cycle.
2. **File exchange.** Artifacts — files in `.claude/tmp/audit-change-<slug>/`. The orchestrator passes paths, reads only headers (counters), and maintains the role roster (glossary: `role roster`): creates `.claude/tmp/<slug>/roster.md` at the first dispatch, updates a row's state at every state change, and applies the Verifier's output-contract parse rule (glossary: `output contract`) at each return point. Relayed numeric claims (counters, sizes, line counts) enter task-prompts and summaries only as copy-paste from a fresh run, with the run command quoted in the brief — not from memory or arithmetic.
3. **The orchestrator — a pure coordinator.** Does not verify, does not interpret findings; the amplitude control bounds M/N and the exit-predict — counters by algorithm, not interpretation; disposition — the author's decision. Does not edit the spec.
4. **The Verifier** — a fresh subagent (not the author) dispatched per round: every round — full or scoped — opens with a fresh Verifier; round continuity is carried by the round-ledger, not by a persistent agent context. Mandate — [`assets/verifier-charter.md`](assets/verifier-charter.md). Dispatch/return — the two-branch completion rule (glossary: `dispatch-completion`; canon — [`../../norms/dispatch-completion.md`](../../norms/dispatch-completion.md)): the verdict artifact parsing into the header format completes the launch; a launch ending without a parsable verdict is completed by the same agent within the same frame. Receives spec + charter + **the frozen checklist** + codebase access; verifies against the checklist, default-to-suspicion; numbers findings (N1..Nk); per-MINOR recommends a disposition with evidence; an observation on a dimension outside the checklist — a **process finding** (a separate section → round-ledger → reconcile; not included in verdict counters; the author may by an explicit decision promote it to blocking — recorded in the ledger with grounds). All observations of the round additionally pass the trigger-matching point against the deferred-options registry (audit-finding class; the "Trigger-matching point" section of the mandate).
5. **Verdict — the exit contract** (glossary: `verdict`, `MINOR-disposition`). `clean` ⇔ 0 BLOCKER ∧ 0 MAJOR ∧ every MINOR of the last findings has a disposition record in the round-ledger; otherwise `blocked`. The orchestrator's exit-predict = an algorithmic cross-check of the findings counters bl/mj ↔ round-ledger disposition records (no undisposed flag is introduced in findings; the findings header — a momentary snapshot of the round, not rewritten by the orchestrator).
6. **Re-inspection-scope** (glossary). After a MINOR fix-now fix, the changed fragments + immediate links are re-verified, not the full corpus; a BLOCKER/MAJOR in the re-inspected zone → blocked. A full run — after blocker/major fixes or by the author's explicit decision.
7. **Round-ledger + amplitude control bounds** (glossary; process control — not acceptance: acceptance is carried by the exit contract, item 5). The orchestrator keeps `round-ledger.md` in the cycle tmp-dir: round, total, blocker/major/minor, finding class, disposition records, trigger-matching firings (moved from the findings "Trigger-matching point" section — the item-2 paren "(counters)" concerns verdict dispatch, not body channels); after each round checks the bounds: **M** (≥2 same-class findings across cycles) → a mandatory RCA (causal-analysis, glossary); **N** (the first repeated round without a change of the finding class after an applied RCA) → **stop + the authoring question "re-decompose?" to the author** — not an auto-gate, not silent continuation; the author's decision is recorded in the ledger with grounds. The orchestrator's sensor duty: own deviations/bypasses — a `SENSOR` line at the moment of the event (glossary: `sensor line`).

## Invariants

- The orchestrator draws no conclusions about the process — only counters by algorithm.
- Fresh context is mandatory — the Verifier is not the spec's author.
- Does not edit the spec — `blocked` → return to `specify-change` with findings.
- Every finding: type (of the 4) + severity + evidence (`file:line` / quote / grep-result) + remediation.

## Severity

- **BLOCKER** — realize impossible (a pressure-sensitive missed; a scope-gap on a core/seam; the frame incorrect).
- **MAJOR** — silently-deferred; mis-classified reversible↔irreversible.
- **MINOR** — an inaccuracy in the spec not affecting correctness.

**Exit contract** (glossary: `verdict`): BLOCKER/MAJOR → `blocked` (return to specify-change); MINOR — `MINOR-disposition` (fix-now | defer, the author's decision on the Verifier's recommendation, recorded in the round-ledger) — does not block given a disposition record. `clean` ⇔ 0 blocker/major ∧ 0 undisposed MINOR.

## Launch

Give the change slug and the paths to spec + charter. The orchestrator creates `.claude/tmp/audit-change-<slug>/`, passes it to the Verifier, reads the verdict from the header of the output file.
