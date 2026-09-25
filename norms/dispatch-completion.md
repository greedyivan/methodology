# Dispatch completion — the two-branch rule at every dispatch/return point of the change chain

The dispatch/return canon of the change chain: every dispatched launch ends in
one of two branches, every return point is judged against the role's output
contract, and the cycle's launches are journaled in the role roster.
Terminology — [`../reference/glossary.md`](../reference/glossary.md)
(`dispatch-completion`, `output contract`, `role roster`, `identity branch`,
`judge-stop`, `handover brief`); the per-role completion moments and the
Output contract blocks live in the role charters (progressive disclosure —
this file is the procedure's single source; the dispatch sites in the stage
SKILL.md files carry a one-line rule + a pointer here).

## Two-branch rule

Every dispatched launch — a session subagent or a workflow run — is in one of
two states, judged at the return point:

- **Completed.** WHEN the launch returns a response that parses into its
  role's output contract, the orchestrator marks the launch completed and
  never resumes or re-enters it — under no conditions, including an
  author-commanded rework. Follow-up work on a completed launch's product is
  a fresh dispatch whose brief carries the loop state from the cycle zone
  (findings, ledgers, diff); the completed launch is not addressed again. An
  author command that concerns a completed launch converts into a fresh
  dispatch — the author's disposition selects work, never an agent.
- **Incomplete.** WHEN the launch ends without a response parsing into its
  role's output contract — a disconnect, a crash, a provider failure, a
  timeout, a neutral timebox stop, or a malformed response — the orchestrator
  resumes the SAME agent for completion of the SAME task within the SAME
  frame (the identity branch); the resume brief carries only the original
  question's disposition/state. The incomplete branch routes:
  - IF the author's disposition removes the task of an incomplete launch, the
    orchestrator closes that launch without awaiting a return; subsequent
    work enters through its own stages as fresh launches.
  - WHEN a stop ruling declares the path wrong (a `judge-stop`), the
    orchestrator closes the launch, continues via a fresh agent whose brief
    states the stop reason, and records the stop (a ledger record; a SENSOR
    line where the stop itself was the executor's deviation).
  - WHEN a launch's transcript is non-reproducible, the orchestrator falls
    back to a fresh agent with a `handover brief` assembled from the cycle
    zone and emits a SENSOR line.
  - IF completion attempts of an incomplete launch repeatedly fail, the
    orchestrator escalates to the author's decision (no automatic retry cap,
    no automatic abandonment).
- **A halt is a wait, not a completion.** WHILE a halt inside the mandate is
  pending (a checkpoint, a frontier batch, a halting-table STOP), the launch
  is incomplete — the same agent continues after resolution; a completed
  launch is re-entered by nothing.

**Rounds.** WHEN an audit round starts (full or scoped), the orchestrator
dispatches a fresh Verifier for that round; round continuity is carried by
the round-ledger, not by a persistent agent context.

## Fences

- **The identity branch preserves the authoring gate.** A resumed launch
  continues its own task; an authoring question (a scope/realization fork, a
  frame threat, a significant fork) still stops the loop and goes to the
  orchestrator — the identity branch never lets a subagent self-close an
  authoring question, and author commands never select agents.
- **The resume brief stays inside the original question.** The brief carries
  the original question's disposition/state only; new scope, a changed frame,
  or a re-specified task enter as fresh dispatches through their own stages.
- **Freshness is evaluated over the whole roster.** A freshness/≠ constraint
  (the Fagan exceptions: the audit Verifier, the read-reinspect reader) is
  evaluated over every launch row of the cycle's role roster, not only the
  last launch or the named counterpart; a resumed launch stays its own roster
  row, so the identity branch does not collide with freshness.

## Per-role completion moments

The canon defines exactly one parseable completion moment per dispatchable
role (the contract form — §Output contracts; the role charters carry the
role-local blocks):

- **Profiler** (`scope-change`): the charter + `options_for_authoring`; the
  post-decision authoring-record enters the charter verbatim (the
  orchestrator's transcription); a re-profile = a fresh Profiler.
- **Specifier** (`specify-change`): the spec at FINAL (the exit self-check).
  Work continuing after a checkpoint resolution or a frontier answer
  continues in the same Specifier launch (a halt is a wait); a post-FINAL
  return — a control re-run counter mismatch, audit `blocked` findings, a
  MINOR fix-now — is a fresh Specifier with a fix-pass brief (spec + charter
  + findings + round-ledger with class history + RCA outcomes + disposition
  records); the checkpoint canon applies to the fix-pass.
- **Realizer** (`realize-change`): green delivery confirmed by the
  orchestrator. WHEN the orchestrator confirms Tier-1 red, or an L1 fix (a
  verify adjudication) is to be applied, a fresh realizer is dispatched (not
  a resume); halting-table stops inside the mandate return to the same
  realizer.
- **Verifiers/readers** (the audit Verifier, the verify Tier-2 Verifier, the
  read-reinspect reader): the verdict/report — always completed as a
  completion moment. WHEN the verdict/report parses into the role's output
  contract, the launch is completed and is never re-entered; a verifier/reader
  launch ending without a parsable verdict/report (a disconnect, a crash, a
  provider failure, a timeout, a malformed response) is an incomplete launch
  on the identity branch — the SAME agent completes the SAME verdict/report
  within the same frame; a transcript unrecoverable mid-completion falls back
  to the `handover brief`; repeated completion failures escalate to the
  author.
- **Dispatchable spikes** (the R2 mandatory spike, the formation spike, the
  alternatives spike): completion = the spike's named product artifact exists
  in the cycle zone and parses into the mandate's declared contract form (the
  claim-list canonical line `CL-<n> | statement | anchor | confidence`; the
  formation brief), integrated by artifacts, not shared context; a spike
  return without its named product is incomplete (the identity branch). The
  R4 spike-before-edit is NOT a dispatch — the realizer executes it themself
  — and stays outside the class.
- **Calibration interview** (`init-change`): the compiled calibration + the
  surfaced divergences.
- **Fixes:** WHEN a fix is needed, the corpus's dispatch-threshold logic
  applies to the fix's own size: Tiny/Small mechanics — the orchestrator
  inside its own Tier-1 loop (orchestrator-internal mechanics are not
  launches and are not governed by completion/resume); larger — a fresh
  subagent; the identity branch applies only in the subagent branch.

## Role roster protocol

- The orchestrator maintains a **role roster** file in the cycle workspace
  for every cycle: `.claude/tmp/<cycle-slug>/roster.md`; one data row per
  dispatched launch (role | launch id | state), updated at the moment of each
  state change; the state vocabulary is closed: `dispatched | completed |
  incomplete | closed`.
- The orchestrator is the roster's single writer; the roster references the
  role output contracts, never redefines them.

## Output contracts

- Every dispatchable role carries an explicit output contract: the deliverable
  artifact + the parsing rule the orchestrator applies at the return point
  (parseable done/not-done). The contract lives in the role charter's Output
  contract block (the `## Output` section convention); the orchestrator
  applies the parse rule at the return point and marks the roster row.
- A deliverable MAY end with a completion line only where its contract block
  declares one; the parse rule remains the orchestrator's application of the
  charter contract against the artifact.
- **Spike mandates:** a dispatchable spike carries no role charter — the
  dispatch brief is the contract's carrier: it names the product artifact +
  the parse rule (the claim-list canonical line, the formation brief).
- WHERE a role's completion criterion is implicit, the charter restates it as
  an explicit contract of this form; the restatement strengthens the
  postcondition (no existing completion loosens).

## Carrier-agnostic form

The canon governs session subagents and workflow runs alike. The corpus text
names the abstract carrier categories only ("session subagents", "workflow
runs", "launches", "dispatches"); a concrete harness, session mechanism, or
product name does not enter canon text.

## Attributions (single-source)

- **Two-branch rule** — Gray–Reuter 1993, *Transaction Processing: Concepts
  and Techniques* (the recovery discipline: committed results are never
  re-entered; in-doubt work is completed by the same execution path) — the
  state discipline of a launch, read as completed/incomplete.
- **Output contracts** — Meyer 1997, *Object-Oriented Software Construction*,
  2nd ed. (design by contract: the contract stated at the supplier, checked
  by the client at the return boundary).
- **Role roster / freshness over the whole set** — Fagan 1976, *IBM Syst. J.*
  (inspection independence from authorship, re-applied per round and over the
  whole participant set); Parnas 1972, "On the Criteria To Be Used…", *CACM*
  15(12) (state hidden behind a role interface).
