# Legitimacy invariants — the list of process-legitimacy invariants

A closed list of legitimacy states (Dijkstra): a self-change cycle proves the preservation of every invariant (PCC — proof-carrying change); product cycles preserve them vacuously (the surface contains no process artifacts).

L1: **Checklist freeze before r1** — the frozen standard precedes round 1 of every audit cycle; monotone within it. Canon: glossary `frozen checklist`.

L2: **Authoring-gate** — scope/realization decisions go through authoring: explicit notification of the author + confirmation; autonomy — only track/routing/necessity. Canon: glossary `authoring-gate`.

L3: **Audit-cycle exit contract** — verdict = 0 BLOCKER/MAJOR ∧ MINOR with disposition; the round-ledger is the authoritative carrier of the undisposed; scoped re-inspection; M/N — process-control bounds. Canon: glossary `audit-cycle exit contract`.

L4: **Baseline immutability + the revert invariant** — the base commit of a program's self-change is unchanged until the switch decision; a git-tag on the baseline; revert = convergence to a legitimate state from any (closure); the metrics-ledger — append-only, recomputable from round-ledgers (canon: monitor.md "Row-schema metrics-ledger", "Signal rules" — pre-registered thresholds). The base-commit hash — in the charter of the program's self-change; a new canon — the present artifact.

L5: **Anytime form of improvements** — every step of self-change is independently landable (a monotone envelope: interrupt at any point — never worse); no big-bang process rewrites. A new canon — the present artifact (Dean–Boddy 1988; Zilberstein 1996).

## Proof obligation (PCC)

Every self-change cycle carries proof of preserving the list: the invariant table `L(i) × evidence` (per invariant: a pointer to a run artifact). Product cycles — vacuously (no proof obligation).

## Import of the frozen checklist into the verdict

verifier-charter audit-change, "Checklist derivation procedure":
- **The invariant dimension — conditionally:** only for self-change cycles (a binary criterion: does the charter's surface contain process artifacts, yes/no); an instance of the checklist carries the invariant-table check.
- **Category 5 "ADR reconciliation" — unconditionally:** in all audit cycles (a contradiction of a recorded decision = a finding requesting revision, not a code error; resolution — the R4 canon; narrowing by Event class is not allowed).

## Shadow phase (R6)

Every process improvement, before land, self-applies in instrumented mode (RTA/Simplex); the baseline (commit/data/thresholds) is untouched until acceptance. Emission of the **SHADOW delta of GQM metrics** as a marker line into the metrics-ledger (the `revert-guard` signal, R9). Acceptance = the authoring gate (the switch decision by the author); revert automation outside the TCB.

SHADOW line format: `SHADOW | program=<slug> | M1=<baseline→actual> | ... | verdict=preserved|violated L(i) | table=<path>`

Lines emitted before the W3 latinization carry the legacy RU field spellings (`программа=`, `verdict=сохранены/нарушен L(i)`, `таблица=`) — they remain valid historical records of the metrics-ledger.

## Acceptance canon

A shadow delta ≥ baseline norms (M1 within bounds; the invariant table complete) → the authoring question "land?" → the switch decision. Not an auto-gate.

## Attributions (single-source)

- **Self-stabilization** — Dijkstra 1974 (*Communications of the ACM*; the inaugural E.W. Dijkstra Prize): legitimate state + closure.
- **Proof-Carrying Code** — Necula–Lee, PLDI 1996: a modification carries a verifiable proof of property preservation.
- **Anytime algorithms** — Dean–Boddy 1988; Zilberstein 1996: a monotone envelope, safe interruption.
- **RTA/Simplex** — Sha–Rajkumar–Gheorghe 1994–: baseline + advanced + guard.
