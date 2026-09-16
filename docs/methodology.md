# Change methodology — a corpus overview

An inventory of the corpus — "what, how, why": skills, scripts, canon carriers.
This file is descriptive prose for humans; the rules and terms live elsewhere in
the repo (the map — the "Where the rules live" section). The corpus norms
(norms/) prescribe, this inventory explains: no norms are retold here, only
pointers.

## Introduction

The corpus is an agent-driven engineering change methodology, portable and
self-contained: skills (the change-chain stage processes), a glossary (the
term canon), norms (authoring and legitimacy rules), maintenance scripts.
It serves two kinds of consumers: the human
operator (this inventory) and the harness's LLM sessions (SKILL.md, the norms,
the glossary, the README router — the class of LLM-consumed surfaces; the term
is canonized by the `LLM-consumed` entry in the glossary). The README carries a
double load: an index-overview for the human and routing for LLM sessions
(No. 6 in norms/llm-consumed-invariants.md).

Hence the separation of the corpus's two loads: descriptive prose addresses the
human's cognitive load (the picture of the whole, the index of "what exists and
when to take it"), instructive surfaces carry the contextual load of sessions
and are therefore economized and guarded by dedicated norms (the rule — No. 1
in norms/llm-consumed-invariants.md; here — only a pointer). This very file
would violate it if it repeated rules or terms: it explains structure and
history, it does not prescribe.

## Repo structure

- `skills/` — seven skills; every directory is self-contained: `SKILL.md` +
  resources (assets/, reference/, profile/), everything the stage needs lives
  inside the directory.
- `reference/` — the glossary (`glossary.md`): the single carrier of terms.
- `norms/` — four norms: skill authoring invariants, self-change legitimacy
  invariants, the integration canon of the shared corpus, the Monitor
  procedure.
- `tools/` — five maintenance scripts (telemetry, validators, a container
  runner).
- `docs/` — the casebook (`docs/casebook.md`: case-derived norms, an
  instructive asset) + descriptive prose (this file).

The corpus version is the repo's commit hash. Consumption is a direct
clone: the adopting operator clones the repository and connects it to a
project by a symlink to `skills/` (the README "Get started" section
documents the hookup; the consumption pin — the commit the clone is at).
The corpus clone is portable as a whole; instance operational artifacts
(program audit registries, telemetry) live outside it — in the
operational-repo at typed paths (the instance-state convention, glossary).

## The change chain

A change passes through stages; every stage is a skill, every one produces its
own artifact. The sequence:

`init-change` (once) → `scope-change` → `specify-change` → `audit-change` →
`realize-change` → `verify-change` → `reconcile-change`

**Calibration (init-change).** Once per adopted project: a Q&A interview
extracts the organization's context (ISO 9001/27001 Clause 4 + the
Architecture Business Cycle). The output is the calibration; every subsequent
scope run reads it, so the context is collected once.

**Decomposition (scope-change).** Profiles the requested change, builds a
surface dependency matrix (code, docs, tests, configs), delivers a granularity
verdict: a single cycle, a program with sequencing, or a coupled block (landed
together). Every cycle passes a necessity filter (DO/DEFER/DROP). The output is
the charter. The point of the stage: the cost of a structural mistake exceeds
the cost of an execution mistake — structure is cheaper to check before
specification.

**Specification (specify-change).** Five strata: intent, contract+frame,
examples/properties, the registry, the realization design set. Requirements are
EARS-form; design choice is a comparison of ≥2 polarized options over fixed
axes (SBCE). The output is the spec. Depth is calibrated by process-mode: where
an authoritative tool checks correctness, the spec is light (frame +
fitness-tools); where no tool exists — a full contract with invariants and a
decision registry.

**Audit (audit-change).** A fresh context adversarially checks the spec before
execution: silently-made decisions, misclassifications, scope completeness
against the theory of the change type. The output is a verdict per the exit
contract; the auditor does not edit the spec. Why before execution: finding a
contract defect on paper is cheaper than finding it in a realized tree.

**Realization (realize-change).** A closed edit→gate→edit loop over the spec's
units within the frame. The executor's decisions are recorded in the
impl-ledger at the moment they are taken; a frame threat or a significant fork —
stop and a question to the author. The exit criterion is Tier-1 green,
confirmed by the orchestrator.

**Verification (verify-change).** A sparse semantic check by a fresh agent (not
the realizer): do the tests guard the claimed behavior, is the doc factually
true, is the design apt. The mechanical part is closed by the realization loop;
what lands here is only what a tool cannot see — authorial bias.

**Reconciliation (reconcile-change).** A revision of the deferred-options
registry (expiry, triggers), disposition of process findings, the instance
surface-inventory delta, a sync of task lists. Closes the cycle: deferred items
do not age silently, findings get an addressee.



## The tools/ scripts

Five maintenance scripts; paths — from the repo root.

- `tools/run-in-docker.sh` — the container runner: any project tool executes in
  Docker only. A single point of foreign-code execution: the environment is
  reproducible, the host isolated.
- `tools/collect_xes.py` — a converter of cycle telemetry into an XES log (the
  process mining format): chain events become traces for process analysis.
- `tools/validate_events.py` — a validator of events.jsonl against the closed
  telemetry catalog; catches event-schema drift at the entrance to measurements.
- `tools/validate_sensor.py` — a validator of SENSOR lines in cycle artifacts
  against the format canon (glossary: sensor line).
- `tools/dprime_measure.py` — a d′ measure of the verification loop by
  hits/false-alarms (signal detection theory): the sensitivity of verification
  is separated from its noisiness.

## Glossary

`reference/glossary.md` — the single carrier of terms: skills refer to entries
without redefining them inline. That way every session pays for a term once,
and an edit of a definition reaches all consumers. A living artifact: it grows
with new skills; editing existing entries — through reconcile. The casebook
(docs/casebook.md) follows the same growth rule: entries are added by
reconcile, never edited in place without a reconcile record. The
`LLM-consumed` entry defines the property of surfaces whose instructions are
consumed by sessions; the inventory of the class's surfaces — No. 6 in
norms/llm-consumed-invariants.md.

## Where the rules live

The carrier map (pointers, not a retelling of content):

- `skills/<name>/SKILL.md` — every stage's process: executors, steps, outputs,
  stopping points;
- `norms/` — the corpus's rules: skill authoring invariants (including No. 6 —
  the class of LLM-consumed surfaces and the resync rule), self-change
  legitimacy invariants, the integration canon of the shared corpus, the
  Monitor procedure;
- `reference/glossary.md` — terms;
- `README.md` — the router: skill tables, the adoption entry point
  (Get started);
- `docs/` — this overview (prose) + the casebook `docs/casebook.md`
  (case-derived norms; an instructive asset).

The instance's operational state — the deferred-options registry, session
memory, telemetry, tasks — lives in the operational-repo outside the corpus;
path typing — the instance-state convention (glossary).
