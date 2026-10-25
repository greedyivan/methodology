---
name: init-change
description: Elicitation of the project's calibration (the external framework for changes) via a Q&A interview. Canonical dimensions — ISO 9001/27001 Clause 4 (Context of the organization) + Bass-Clements-Kazman (Architecture Business Cycle). Not an auto-scan — an interactive elicitation of tacit/contextual knowledge. Output — docs/change-calibration.md + the project's green-baseline.sh (the executable gate set) + a pointer in the project's agent-instructions file + the adoption flag (the machine-readable completion marker in the operational layer; scope-change checks its presence at every launch).
---

# init-change

Elicitation of the **calibration** — the third layer (the project parameters the process runs on). Terminology — [`../../reference/glossary.md`](../../reference/glossary.md) (the chain-stage term — `audit-cycle exit contract` — is a glossary key of its carrier skill). Launched ONCE (adoption); afterwards `scope-change` reads the calibration (does not re-derive it).

## Q&A elicitation, not auto-scan

Calibration = a mix of the **explicit** (auto-scannable: tools, files) and the **tacit/contextual** (only by elicitation: what is core, what is a seam, what a policy means, stakeholder context).

→ init = **interactive Q&A elicitation**; auto-scan (grep) — merely a supplement for the explicit part.

## Canonical dimensions (grounded, not invented)

**ISO 9001/27001 Clause 4** (Context of the organization) + **Bass-Clements-Kazman ABC** (Architecture Business Cycle):

| # | Source | Dimension |
|---|---|---|
| 1 | ISO 4.1 external | external issues (customer, upstream deps, regulatory, deadlines, deploy-domains) |
| 2 | ISO 4.1 internal | internal issues (architecture, codebase-state, team/org) |
| 3 | ISO 4.2 + ABC stakeholders | stakeholders + concerns (who; quality-attributes rank) |
| 4 | ISO 4.3 scope | boundaries (what is in/out) |
| 5 | ISO 4.4 + ABC tech-env | seams/contracts + tooling (seams; gates; tooling conventions) |
| 6 | ISO 4.4 processes | dev process + commit/deploy policy + doc-framework |
| 7 | ABC developing-org | business goals, org structure, product-lines |
| 8 | derived (risk-tolerance) | severity calibration (Tiny/Small/Standard/Deep thresholds) |

## Method (Cooke / Contextual-Inquiry)

- Ask per dimension (or in tight clusters); the owner answers.
- **Do NOT pre-draft from existing docs/memory** — they may be stale/wrong; pure elicitation (the owner is the source of truth).
- Record the answers with a rationale (where the owner gives one).
- After all dimensions → compile the calibration + check it against the existing docs (the agent-instructions file/memory) → surface the divergences (they are fixed afterwards).

## Output

`docs/change-calibration.md` + a pointer in the project's agent-instructions file ("Change process — calibration: `docs/change-calibration.md`") + the project's `green-baseline.sh` (the operational layer, `projects/<id>/`): the executable form of the gate set collected in the interview — per-gate project checks, or, where no gates apply, an always-GREEN stub marked as such in the header. The script is verified by execution at creation (run on the current tree with the expected outcome; a seeded-failure negative test at the owner's discretion). The script's contract: exit 0 = green, non-zero = red; stdout carries per-gate results — `scope-change` invokes it at every launch. **The adoption flag** (`calibration.flag` in the operational layer, next to the script) — the last artifact, written when the calibration is fully done (the elicitation compiled and the script verified by execution). The flag is an empty marker: its presence is the boolean — the completion is recorded, not re-derived; `scope-change`'s pre-condition reads it at every launch through the corpus-shipped [`../../../tools/check-calibration`](../../../tools/check-calibration) (the caller reads the status only). Until the flag, the project is not initialized — `scope-change` routes to `init-change` first. The calibration — the **project layer** (change-independent); reused by every `scope-change` launch; updated through reconcile (if the project's parameters change).

## Protocol

Per-dimension questions — [`assets/interview-protocol.md`](assets/interview-protocol.md).

## Attributions (single-source)

- **Knowledge Elicitation** (Cooke 1994, *Varieties of KE*) — the knowledge lives in a human; elicit it, do not extract it.
- **Tacit→explicit** (Polanyi; APQC) — via processes that prompt expression.
- **Elicitation ≠ collection** (Wiegers) — active inquiry, not passive gathering.
- **Contextual Inquiry** (Holtzblatt-Beyer) — context is critical; decontextualized questions miss.
