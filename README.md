# methodology

An agent-driven engineering change methodology: portable skills (the
SKILL.md format) + canonical texts of the change chain. This README is a
router: the adoption entry point and skill tables. The corpus description
"what, how, why" — [`docs/methodology.md`](docs/methodology.md); the term
canon — [`reference/glossary.md`](reference/glossary.md).

## Get started

Prerequisites: `bash`, `git`, `python3` on PATH (check:
`git --version && python3 --version`), and a harness with skills support
(Claude Code / opencode / equivalents — a directory of `SKILL.md` files
exposed to the agent) for the project you adopt the methodology in.

1. Clone the corpus and connect it to your project:

   ```bash
   git clone <repo-url> methodology
   mkdir -p <project>/.claude
   ln -s /absolute/path/to/methodology/skills <project>/.claude/skills
   ```

   The symlink target is absolute (a relative one breaks when the clone and
   the project are not siblings). The clone is the adoption unit: consumed
   as-is, no install step. Verify the hookup: the skill file opens through
   the project path — `cat <project>/.claude/skills/init-change/SKILL.md`.

2. Provide the operational carriers — the instance's side of the carriers
   contract (the reference topology — glossary: `instance`; the carrier
   classes — glossary: `instance-state role`). The instance obligations:

   - a carrier declaration (glossary: `carrier declaration`) covering
     every role referenced by the corpus instructive text — the typed
     table resolving each instance-state role to a path at one of the two
     instance-topology bases;
   - the declared carriers exist and stay existing at their bases;
   - the corpus-shipped checker (`tools/check-carriers`) wired into the
     instance selfcheck over the live declaration.

3. First chain run: read
   [`skills/init-change/SKILL.md`](skills/init-change/SKILL.md) and run the
   calibration interview in your project; the output —
   `docs/change-calibration.md` + a pointer in the project's
   agent-instructions file (CLAUDE.md / AGENTS.md — the harness's
   instruction file). Every subsequent `scope-change` run reads the
   calibration.

## Structure

- `skills/` — skills ×7; every directory is self-contained (`SKILL.md` + resources:
  everything needed to run the stage lives inside).
- `reference/` — the glossary (`glossary.md`): the term canon the chain's
  skills refer to (no inline redefinitions).
- `norms/` — corpus norms ×5: `dispatch-completion.md` (the two-branch dispatch/completion canon: per-role completion moments, the role roster, output contracts),
  `llm-consumed-invariants.md` (authoring
  invariants of LLM-consumed surfaces; No. 6 — the class inventory + the
  resync rule), `legitimacy-invariants.md` (L1–L5: the self-change
  proof obligation), `integration-canon.md` (sync discipline/merge model/
  integrity checks of the shared corpus), `monitor.md` (M1–M8 aggregation,
  signals against the norms).
- `tools/` — maintenance scripts ×6: a container runner, an XES converter,
  events/sensor validators, a d′ meter, a carrier-declaration checker.
- `docs/` — the casebook (`docs/casebook.md`: case-derived norms — an
  instructive asset of the No. 6 class) + descriptive prose
  ([`docs/methodology.md`](docs/methodology.md) — a corpus overview).

Operational artifact carriers (glossary: `instance-state role`) are
instance state — the metrics-ledger of the Monitor's formal-era window
list among them: placed by the instance, resolved per its carrier
declaration (glossary: `carrier declaration`); the corpus prescribes
roles, the instance prescribes paths.

## Skills

### Change chain

`init-change` (once) → `scope-change → specify-change → audit-change → realize-change → verify-change → reconcile-change`

| Skill | Purpose |
|-------|-----------|
| [`init-change`](skills/init-change/) | Project calibration elicitation via a Q&A interview (ISO 9001/27001 Clause 4 + Bass–Clements–Kazman ABC). Run once at adoption; the calibration is read by every `scope-change` run. |
| [`scope-change`](skills/scope-change/) | Decomposition gate: change profiling, a multi-surface DSM (code/docs/tests/configs), the decomposition verdict over the work/verify/land axes (single-cycle \| program+sequencing \| coupled-block; collapse — via the Collapse-checklist), the necessity filter (DO/DEFER/DROP; DEFER — a record in the deferred-options registry; the Profiler reads the registry at start: the expiry revision point + a trigger reconciliation). formation-brief (R1: pre-request reading ≥2 blocks/~100k → a formation spike ≤40k, output — a program-brief = claim-list + topic outline — a Profiler input option) + the knowledge-gap registry (R2: cat.4/BLOCKER-potential OR an M4-recurrent priority → a spike before freezing the frame). Dispatched launches (the Profiler, the formation spike) — the two-branch completion canon (`norms/dispatch-completion.md`). Output — a charter. |
| [`specify-change`](skills/specify-change/) | A change spec: 5 strata (intent, contract+frame, examples/properties, registry, realization-design-set). Spec depth is calibrated by process mode: light/emergent for tool-authoritative, full 5 strata for non-tool-authority. S1/S2 requirements — EARS format (mandatory for full 5-strata). The frontier elicitation protocol (questions in batches with recommended answers); Stratum-4 — polarized `SBCE` (≥2 designs, fixed axes, a recommendation; the "alternatives" facet of the claim-list — a Stratum-4 input: a shortfall of ≥2 polarized ones → the frontier question "an alternatives spike?"); the registry extends into realize (a decision recorded at the moment it is taken). Checkpoint-halted work continues in the same Specifier launch; a post-FINAL return (counter mismatch, audit blocked, MINOR fix-now) — a fresh Specifier with a fix-pass brief (the completion canon, `norms/dispatch-completion.md`). Output — a spec. |
| [`audit-change`](skills/audit-change/) | Adversarial verification of the spec before realize (retained for non-tool-authority; lighter/skip for tool-authoritative). 4 categories: silently-made/deferred, mis-classified, scope-completeness. A check against the frozen checklist (the freeze precedes round 1); a fresh Verifier per round — full or scoped (the completion canon, `norms/dispatch-completion.md`); the verdict by the audit-cycle exit contract (0 blocker/major ∧ MINOR with disposition); scoped re-inspection. Round observations pass a trigger reconciliation with the deferred-options registry (a hit → the R4 authoring question at the verdict point). Round-ledger + amplitude control bounds M/N (RCA / the stop question "re-decompose?"). Verdict-only, does not edit the spec. |
| [`realize-change`](skills/realize-change/) | The execution stage: a Tier-1 continuous closed-loop (edit→gate→edit) over the spec's implementation-units within the frame; the exit criterion — Tier-1 green, confirmed by the orchestrator (executor ≠ authority: a product repo — the test/typecheck/knip gates; a process repo — authoring invariants + grep canons + self-application). The Realizer — a subagent or the orchestrator in the Tier-1 loop (the R-21 threshold: process-mode × severity — realizer-charter); every realize decision — an impl-ledger record at the moment it is taken; spike-before-edit (R4: the registry flag "unfamiliar mechanics" → a spike before the edit, the product — claims); halting — STOP + an authoring question (frame threat / research need / a significant fork). Dispatch/return points — the two-branch completion canon (`norms/dispatch-completion.md`): a fresh realizer at confirmed Tier-1 red or a due L1 fix; halting stops return to the same realizer. |
| [`verify-change`](skills/verify-change/) | A Tier-2 sparse semantic checkpoint post-realize: assertion-guards (observable outcome + an independent `test-oracle`), doc factual truth, design aptness. A fresh Verifier (≠ realizer). Adjudications pass a trigger reconciliation with the deferred-options registry (the verify-adjudication class). Output — adjudication L0–L4 + trigger classification; applied L1 fixes close with a read-reinspect (a fresh reader; glossary). The Verifier's verdict and the reader's report are their completion moments (the completion canon, `norms/dispatch-completion.md`). |
| [`reconcile-change`](skills/reconcile-change/) | The final stage: deferred-options registry revision (the revision point), disposition of process findings/RCA (micro-edits of process artifacts \| DEFER \| kept-for-tracking), the lab task-list sync (a standard deliverable), the instance-spec delta (an inventory of the instance's surfaces; ADDED/MODIFIED/REMOVED per the cycle's changeset), the k12 protocol of ambiguities, the materialization form of process edits (directive-form output; history to the casebook with a forward link). |

