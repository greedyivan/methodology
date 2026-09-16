---
name: reconcile-change
description: The final stage of the change chain — a revision of the deferred-options registry (the revision point: the expiry check, drop/re-derive by R4), the disposition of process findings and RCA classes (a micro-edit of process artifacts | DEFER | to-tracking), the sync of the lab task lists (the stage's standing deliverable), the instance-spec delta (the inventory of the instance's surfaces: ADDED/MODIFIED/REMOVED over the cycle's changeset), the k12 protocol of terminological ambiguities, the materialization of new dimensions into the verifier-charter canon. Launch: at the completion of verify-change (or by the author's explicit command).
---

# reconcile-change

The final stage of the chain. Terminology — [`../../reference/glossary.md`](../../reference/glossary.md) (chain-stage terms — `instance`, `decision-defense`, `monitor summary`, `terminal authority` — are glossary keys of their carrier skills).

## Role in the chain

`scope-change → specify-change → audit-change → realize → verify-change → reconcile-change`

- **Entry:** verify-change is complete (the verdict + the disposition of the L0 findings), or the author's explicit command (a registry revision outside a cycle).
- **Output:** the reconcile report + the updated process artifacts (the registry, charters, glossary, lab task lists) + ledger records.

## What it does

1. **Registry revision** (the revision point — operational-repo/registry/deferred-options.md, the schema/R4 there as well): a per-item expiry check; the expired and the fulfilled → drop with a rationale (bypassing the registry) by the author's decision; the alive — stay. The items that fired in the cycle — their firings have already been processed by the trigger-matching points (glossary: `trigger-matching point`) of their own stages; here — only the item's fate.
2. **Disposition of process findings:** the process findings of the round-ledgers, the RCA notes of verify, L0-tolerations with a revision-condition — each receives an outcome:
   - **process edit** — a micro-diff of an artifact (a subagent's charter / the glossary / the monitor norms), materializing the dimension into the next cycle's checklist (glossary: `frozen checklist`);
   - **DEFER** — a record into the registry by the 7-field schema (by a `trigger predicate` (glossary), not by a date);
   - **to-tracking** — a report line with an escalation trigger condition.
3. **k12 protocol** (enters here by the k12 item's build-path): adjudications L2–L4 with a terminological root-cause → the "Flagged ambiguities" section in the glossary (the term split/banned + the ground). The section is started by the first case, not in advance.
4. **Ledger hygiene:** a check of the metrics-ledger against the artifacts (the formal-era windows, SHADOW lines, sufficiency marks); a divergence — a reconcile finding.
5. **Task-list sync** (the stage's standing deliverable; the carrier — `operational-repo/tasks/task-list.md`): a check of the "Deferred" mirror against the registry (id + expiry; a divergence — a sync defect) and the removal of the completed items' cards; the mechanics of the lists — the instance-topology task-list norm of the instance's agent-instructions surface.
6. **instance-spec delta** (the stage's standing deliverable; the carrier — the instance's surface inventory `instance-spec.md`, an instance-state artifact at the typed path of the operational overlay — the live inventory of the instance's surfaces): the ADDED / MODIFIED / REMOVED delta is applied to the completing cycle's changeset — a mechanical derivation from `git diff --name-status` against the registry's rows and classes (not an opinion). The depth — the registry's rows: a skill — the skill's row (SKILL.md); the assets of all skills are accounted for by a class row (a new skill: ADDED of the skill's row + the increment of the assets class row); mass directories — by class rows; paths outside the inventory classes (the `cycle workspace` (glossary), session memory) generate no delta; a rename (R100) — MODIFIED of the row with the path updated; a delete and a re-add in one changeset — MODIFIED. The moment — intra-changeset: the edit of the inventory body enters the cycle's closing changeset before the land (reconcile's self-application — in the same order); the delta list (classes + rows) — in the reconcile report and the commit message. By the same step — a drift check: `git ls-files` of both repos against the registry's rows; a divergence (an orphan row, an uncovered file) — a finding, closed by the same cycle's delta or by an authoring question.

## Rules

- Every drop/edit/DEFER — an authoring question by the R4 canon (a recommendation with evidence; the author's decision; not an auto-gate).
- Own deviations exposed by the check (missed stops, unraised signals) — a `SENSOR` line (glossary: `sensor line`) with `point=post-factum` into the report and the ledger; old deviations are extinguished here, not replicated.
- Spec/code are not edited: L1 is closed by verify; L2–L4 require their own cycle (re-spec), not ad-hoc.
- Resync (k14): a new/changed skill ⇒ a same-changeset delta of the corpus README and the glossary.

## Cycle

1. File exchange: `.claude/tmp/reconcile-change-<slug>/` (the slug of a cycle or a program).
2. The orchestrator gathers the inputs: the registry, the metrics-ledger, the cycle's round-ledgers and verdicts, the glossary; prepares a per-item summary with recommendations.
3. The authoring point: the author's package of decisions (drops / edits / DEFER).
4. Application: artifact edits + the report + the task-list sync (item 5 of "What it does") + the instance-spec delta (item 6 of "What it does"); the skill's VERIFY — the run itself (the processing of a real case).

## Launch

slug + the list of cycles to revise (round-ledger/verdict paths) + the registry path.
