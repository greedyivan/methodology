# Casebook — case-derived norms of the change chain

Case law of the chain: norms materialized by reconcile from real incident
series. Each entry = a norm (the rule, kept normative) + the case domain it
was earned in (kept concrete — that is the entry's value). Grows by
reconcile; entries are never edited in place without a reconcile record.
Consumed by the Specifier/Realizer at authoring time; terminology —
`reference/glossary.md`.

The originating domain of the first eleven entries: a binary-codec program
(wire formats, hand-computed hex vectors, byte-exact fixtures) — the norms
generalize to any spec carrying derived fixtures and numeric pins.

1. **Hand-computed golden vectors** (materialized by reconcile from a real
   incident series — the anchor-drift RCA class, 4 instances in one cycle):
   every hand-computed hex vector of S2 is accompanied by a derivable chain
   in the column note (token class → ARG width → BE bytes) — the chain makes
   the recount trivial for the audit and excludes a lost/extra byte relative
   to one's own invariants (defect precedents: int-max/f64-subnormal values
   a byte short of their declared invariants; a u16 selector for 2^20).

2. **Self-recount of the golden corpus** (an RCA escalation of the same
   program): after writing S2 the specifier performs a second pass — a
   byte-by-byte recount of ALL vectors by their own chains (independently of
   the computation source); discrepancies are fixed before the CP
   submission; the fact of the self-recount is recorded in an S2 note. The
   audit r1 recount — the full corpus, not a sample (defect precedent: a
   cycle where 5 of 25 vectors were wrong in the presence of chains — a
   chain without a recount does not catch its own computation error).

3. **CP-close checklist** (the 2nd cycle of the CP-desynchronization class):
   after the CP resolutions and before the FINAL status the spec body is
   synchronized with EVERY resolution by the checklist: (1) the S1 invariant
   added/updated; (2) the S2 scenario and the TK row exist; (3) the header
   counters; (4) the status; (5) the fitness map mentions the new INV. The
   checklist is closed by a record in the resolutions section
   (per-resolution ✓).

4. **Doc-surface claims with cycle markers** (the legacy-vision-text RCA
   class, 3 instances): behavioral claims in doc surfaces
   (package-doc/README) describing the implementation state are marked with
   the carrier's cycle-id; the cycle reviving the corresponding
   functionality must revise the claim for accuracy in that same cycle (not
   "later"). This turns the status text from a vision narrative into a
   maintained contract (caught by verify — true, but post factum).

5. **The orchestrator's pre-audit golden recount** (the cross-cycle class "a
   golden byte-defect surviving self-recount": the same defect survived one
   cycle's recount and recurred in the next): right after the spec is
   finalized (CPs closed) and BEFORE audit is launched, the orchestrator
   performs a full byte-by-byte recount of the golden corpus by the grammar
   (not by the specifier's chains — an independent trajectory from the norm
   to the vector); discrepancies are returned to specify before the audit.
   Reason: the specifier's self-recount is correlationally blind (the chain
   and the vector — one author, one computation error survives both passes).

6. **An addition to the pre-audit recount** (an RCA of the same program):
   the golden recount from the grammar includes the SEMANTIC parameters of
   the encoded entities (width = sizeof(T) for numeric tags and the like),
   not only the byte structure — precedent: a width value (a copy-paste of
   the wider type) survived both recount lines, caught by the
   implementation.

7. **An id-scan in the pre-audit recount** (the 4th instance of the
   recount-blindness class): the golden recount with intern ids numbers
   EVERY literal of the flow (kind-desc, name, record) in byte order; do not
   trust the id tables of the spec's chains — they are a product of the same
   author as the error (precedent: an off-by-one — a name literal without an
   id — survived two "independent" recount lines).

8. **The re-spec ACK checklist** (the claim-vs-body class, 7 instances
   across cycles): every re-spec fix touching an INV is REQUIRED, before its
   claim is entered into the re-spec table, to have grep confirmation over
   ALL propagation channels: (1) the INV body — the invariant's line; (2)
   the frame — the MAY/MUST line; (3) the SB/ST scenario — the number; (4)
   the TK row — the number. A claim without the 4-line grep check is not
   recorded. Invariant shifts (N counters, mappings) are checked by a
   separate line.

9. **Typology→mechanics knowledge transfer** (the RCA K4 hypothesis: the
   project's typology artifact knew about slice/map cycles — the knowledge
   was lost in the transfer into the visited mechanics): when formulating an
   INV closing a typology class, the specifier must grep-verify the
   formulation against the corresponding line of the typology artifact /
   the primary source (spike/discussion) — source knowledge cannot be lost
   silently; a discrepancy = a stop and a question.

10. **INSERT absorption in operational fixtures** (the "an edit introduces a
    defect into a fixture" class: 2 findings + 10 SENSOR of the same class
    for one spec): a re-spec fix editing operational fixtures (ranges,
    patterns, pins, counters), after every insertion-edit is accompanied by
    (a) re-reading the adjacent blocks of the affected section — the
    insertion does not absorb neighboring lines/headers — and (b) a live run
    of every affected pattern/counter before the record; the boundary form
    of a pattern (`\b`, quotes) — by the verifier-charter D2 canon. An
    insertion without re-reading = a silent corruption of the fixture,
    caught only by the next audit round.

11. **The orchestrator's pre-audit run of fenced fixtures** (the "an
    operational fixture recorded without a run" RCA class: 2 BLOCKERs across
    the rounds + 4 SENSOR for one spec): right after the spec is finalized
    (CPs closed) and BEFORE audit is launched, the orchestrator executes
    every fenced command fixture of the spec in its exact form and
    reconciles the output with the declared one; a discrepancy is returned
    to specify before the audit. Reason: the rule "a pattern is written by a
    run" has no forcing function at the Specifier's — the fenced block
    documents the run, but does not execute it, and an aspirational entry
    survives the self-check (two lines are blind identically: the author of
    the insertion and its re-reading). The successor of the form — entry 5;
    applied in a later cycle (3 fixtures → the verifier zone reproduced
    before launch, no relapses of the class).
