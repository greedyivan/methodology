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

materialized into: skills/audit-change/assets/verifier-charter.md, P-4
counter-declarations + the Mechanical freeze form riders (the freeze-execution
escalation of this entry's pre-audit-run form; case domain of the escalation:
notes-method-cm-c1 r1 — a freeze carrying "T2 rows — per spec §3.6" while the
independent recount agreed at 24; notes-method-cm-c2 r1 — the freeze pinned
"3 tracked files / 48" from the C1-era note while the live git ls-files showed
4 files / 486 lines; anchors/shas born by the freeze's own run and the
freeze-form over the twins block — gbon-formalization C2/C3/C4)

12. **An explanation of a run-fact is itself a run-fact** (the "unrun-RCA"
     class, 2 instances in one cycle: a pinned exit-code literal transcribed
     from memory; an RCA narrative attributing the wrong pin to a property
     of the "old form" — the explanation itself never run): a claim about
     run behavior — a pinned literal, a count, or a causal explanation of
     why a run behaved as recorded — enters a spec/record only born by the
     run it describes; an RCA explaining a defect without re-running the
     defective thing is a hypothesis, and is recorded as one (or run).
     Reason: the correction record for the first instance was itself the
     second — the correction path re-generates the class unless the run is
     forced; both instances were caught by fresh auditors' runs,
     pre-realize.

materialized into: skills/specify-change/assets/specifier-charter.md, Rules →
control-records bullet (case domain: a dangling md5 reference to a nonexistent
artifact; a count "9" with the fact 14)

## 13. Anchors born by runs — the anchor-precision class

Class: anchor-precision — a file:line/bibliographic anchor enters an artifact
from adjacent reading or memory instead of copy-paste from a run's output at
the moment of insertion. Case domain: specifier charter (2 instances — an
anchor :57 with the fact at :56; the path value.go without the internal/wire
component; the bib-verify class ×2 — an audit citation from memory, a verify
citation from a research artifact, the "Bohner" narrowing refuted by the
edition by_statement — Arnold); audit charter (the anchor-precision RCA ×3
behind D5; a false r1 witness "26-29" at the fact 25-37 — the verifier was
wrong about the line, not the spec). Directive state: the run-born rule lives
in the charters (specifier Rules — anchor re-verification, anchor-born-by-run,
bibliographic anchors; audit Rules — a finding's anchor born by a run; D5 —
G-check re-pin of drifted anchors/HEADs).

materialized into: skills/specify-change/assets/specifier-charter.md, Rules
(anchor-born-by-run + bibliographic-anchors bullets);
skills/audit-change/assets/verifier-charter.md, Rules (finding-anchor bullet)
+ the checklist-derivation D5 rider

## 14. Records born by runs — the generation-time binding

Class: record-born-by-run — a numeric/probe/closure claim in a process
artifact transcribed, anticipated, or self-witnessed instead of being
born by an executed run at the moment of writing. Five verified
instances in one program (carrier-regime c1: a probe artifact cited
before it existed; an unpinned close-run filter form; self-witnessed
exit-table counters. c2: a closure annotation mapping a glossary term
that greps 0 pre-land; an unpinned count inside a remediation fix line),
plus adjacent orchestrator-side events (an eval arm dispatched against
an unverified environment claim; control re-runs guessing marker
patterns instead of paste-executing exit-record commands). The M-bound
fired (≥2 same-class across cycles) → RCA 2026-09-21.

Root cause: record integrity bound only at verification points
(audit/final gates); nothing bound at generation time — every record
line was born unverified in a writing context never forced to be the
running context, and the adversarial sweep arrived a round late. Each
instance cost one extra audit/fix round; detection worked, prevention
did not. The standing twins/exit-check canons bind after the fact.

materialized into: skills/specify-change/assets/specifier-charter.md,
finalization (Birth-check) — every claim line sits beside a same-session
run fence; self-witnessed closures, membership-less counts, and
anticipated runs are red at the FINAL gate, enumerated both directions.

materialized into: skills/specify-change/assets/specifier-charter.md, Rules
(Birth-check clause + the through numeric re-run — the M-boundary class, 3rd
instance; re-runbatch twin-enumeration + value-level closure + twins block +
twins-line strict form — gbon-formalization C2/C3/C4, the before-count
off-by-ones r1-N4/r3-N1 and the $W/{L8} placeholder escapes);
skills/audit-change/assets/verifier-charter.md (D7 baseline-artifact carrier,
D9 run-pin by the output's literal form, instrumental-claims run-pin — a pin
"catches R-n of" refuted by the next specifier round, checklist-baseline-by-
artifact — the G4 process finding); skills/scope-change/assets/decomposer-
charter.md (inventory numeric claims by a run — a charter/profile claiming
"3 edits" at the fact 4); skills/specify-change/SKILL.md (the orchestrator's
control re-run of the spec's own counters);
skills/realize-change/assets/realizer-charter.md (probe-confirmation of
ledger claims — the P-6 claim "es==0 verified" with a live 0/0 panic; the
RL-9 claim "skeleton distinguishability" with a byte tie)

## 15. Birth-enumeration — the mechanical carrier

Class: record-born-by-run, extending entry 14's series (the Birth-check
clause's first live exercise failed). Case domain: carrier-regime c3,
spec audit round 1 (2026-09-21, author-mandated RCA-amendment). The
spec's twins line for a rider literal declared before=10, transcribed
from the allowlist's rider count — a number whose domain includes a
file outside the twins command's own declared domain — while the
adjacent fence output of that exact command read 9; a second instance
the same round carried an anchor range glossed from a zone label over
the run-born line numbers. The exit enumeration, executed as prose
("claim-lines ↔ same-session fences, both directions"), verified the
wrong 10 as clean: it counted claim-lines against fences without
comparing the number tokens byte-to-token, so a transcription from the
wrong carrier passed the very check that existed to catch it.
Amendment: the enumeration is mechanical — claim numbers are grepped
against the fence outputs, a twins line's numbers against its adjacent
pasted outputs; a numeric literal not byte-identical to the number
token in its adjacent fence output is red at the FINAL gate.

materialized into: skills/specify-change/assets/specifier-charter.md,
Rules → control-records bullet (Birth-check — the Birth-enumeration
mechanical carrier)


## 16. Checklist-freeze derivation discipline

Class: freeze-derivation — a checklist freeze transcribing structure or
patterns from memory/spec prose instead of deriving them by runs. Case domain:
the audit charter's derivation section (P-3 inventory patterns with slash-less
variants — a process finding; the section-heading rider series of the same
derivation-norm family). Directive state: audit charter, P-1..P-3 riders.

materialized into: skills/audit-change/assets/verifier-charter.md, the
checklist-derivation section (P-3 + the materializations heading)

## 17. Gate/check pattern run-pin integrity

Class: gates-run-pin + gate pattern-shape — a declared gate/check/pattern
entering a spec without the author's run at entry, or a final-gate pattern
transcribed from an example (partial alphabet, line-anchoring artifacts)
instead of derived from the artifact's own id-inventory. Case domain: gates-
run-pin 2 cross-cycle instances + a relapse chain; the r2 ACK "reformulated
as executable" without runs of the C/Go branches; the gate pattern-shape
chain — notes-method-cm-c2 RL-13 (canon absent from the gate), disposition-c4
(the pattern-shape stamp), gm-c2 RL-10 (a line-anchored ^R-, G-*/@-*/ST-*
uncovered — 18 sites leaked to the staged product, caught only at the
orchestrator's confirmation read); the gate-without-run-pin 2nd instance —
c1 r1-N5 + c2 r1-N5; D2 enum-value quoting (foreign CSS tokens); D3/D4
(a declarative lint ban absent from the eslint config — BLOCKER r2; a literal
grep over existing sites; the Encoder stream outside the pattern); a probe
against non-canonical forms (case/spelling/morphology) as the gate-authoring
edge-form. Directive state: specifier Rules (gate run-pin, remediation-ACK,
5-element form, gate authoring); audit D2/D3/D4; specify SKILL exit self-check
mechanical gate; realizer Rules (final-gate bundle inherits scan canons;
final-gate patterns derived by run from the spec's id-inventory; negative-
path verification of self-written checkers).

materialized into: skills/specify-change/assets/specifier-charter.md, Rules
(gate run-pin + remediation-ACK + 5-element form + gate-authoring bullets);
skills/audit-change/assets/verifier-charter.md, D2/D3/D4 riders;
skills/specify-change/SKILL.md, exit self-check; skills/realize-change/
assets/realizer-charter.md, Rules (final-gate canons + negative-path checkers)

## 18. Gate/probe execution point

Class: gate-execution-point — gates and their artifacts taken at the wrong
point: an intermediate log instead of the final state; the final gate run on
a tree whose surface files are not in the git index. Case domain: the "gate
log not of the final state" class, 2 instances (an intermediate matrix log; a
wire table without an artifact); a CI finding post-land (codec_ptr2iface_
depth_test.go — 3 local gate runs green, CI on land RED: doc band 2 long
blocks vs baseline 0; the consequence — a rewrite of the landed history and
moving the tag); D8 log-zone intermediate pins (M-boundary gate pairs).
Directive state: realizer Rules (gate artifact of the final state; final gate
on the full index surface); audit D8.

materialized into: skills/realize-change/assets/realizer-charter.md, Rules
(gate-artifact + final-gate-index bullets); skills/audit-change/assets/
verifier-charter.md, D8 rider

## 19. Doc numeric claims and doc-factual drift

Class: doc-numeric-claims / doc-factual-drift — numbers, volatile telemetry
and mechanism phrases on doc surfaces transcribed from the spec/charter
instead of re-derived against the assembled implementation. Case domain: the
RCA of the family — 6 instances over one program (the root: carrying spec
numbers over without re-derivation); the 4th instance of doc-factual-drift
(the worked-example elapsed_ns stale already at the final gate of the same
cycle — L1 at verify); the family reaching 3 instances (the matrix, README, a
docstring); verify L1 ×5 despite the claims-map norm (an impl-ledger record
declaring full re-derivation executed as spot updates — stale, mis-derived,
miscounted numbers survived; the pairing table closed the class with a
0-divergence re-inspection); gm-c1 close-out refresh (verify L1 ×4 + 2
read-reinspect residuals: a stale claims-map pair, a stale witness block, a
stale PBT counter, a prose failure-mode list claiming a mode absent from the
run-derived log); gm-c5 mechanism-phrase drift (a calibration-criterion
docstring + procedure pin naming a criterion the code does not use; a
manifest origin cell naming an abandoned parse method; the remediation form:
"byte-position" 0 hits, "within the read rtol" 0 hits). Directive state:
realizer Rules (numeric claims by run/artifact; volatile values by snapshot
annotation; claims-map land-gate form; close-out refresh; mechanism
descriptions as facts of the code); verify charter doc-truth (two-tier
symbols + behavioral claims, phase docstrings, grammar/garble read-through,
replacement-table arity, UI quotes byte-wise).

materialized into: skills/realize-change/assets/realizer-charter.md, Rules
(the doc-claims bullet family); skills/verify-change/assets/verifier-charter.md,
doc factual-truth (I-DOC-semantic)

## 20. Verification mechanics — copies, parsers, mirrors, byte-pins

Class: verification-mechanics — the integrity mechanics of probes and pins: a
probe revert destroying unstaged work; rigid section indexing; mirror-pair
divergence; hand-transcribed byte pins; cache blindness; unrun reading
discipline. Case domain: gbon-canonical-grain 2026-09-16 (git checkout --
over a dirty tree destroyed the realization — dangling-blob recovery; RL-19 —
a re-glue losing a segment of the pin); the "rigid section indexing" RCA
class ×3 (benchstat-like parsers); the mirror pair (routeSignature g1–g4;
filterSearch — the AND-mutation of the PHP side caught only by an external
cross-check); both cache defects living in the unclosed orders; the class
"reading contract inputs >300 in full" ×2 across cycles. Directive state:
verify charter 1a (copies/mirrors), the stateful-gate pattern, Rules (read
contract inputs in full; >300 by ranges); realizer Rules (byte-pin re-glues —
machine length/segment comparison); audit D6.

materialized into: skills/verify-change/assets/verifier-charter.md, 1a +
stateful gate + Rules; skills/realize-change/assets/realizer-charter.md,
Rules (byte-pin re-glues); skills/audit-change/assets/verifier-charter.md, D6

## 21. Volatile-fact pins

Class: volatile-pins — numeric pins of live catalogs/trees taken without the
run's date/HEAD, and volatile baseline pins not re-run each round. Case
domain: a process finding (the base norm); gm-c1 intra-cycle staleness r2 —
the registry drifted 89→90 sections between the r1 and r2 freezes, per-round
re-freeze from r3 resolved it. Directive state: audit charter P-2 (both
riders); verify charter Rules (pins with date/HEAD).

materialized into: skills/audit-change/assets/verifier-charter.md, P-2
volatile-baseline riders; skills/verify-change/assets/verifier-charter.md,
Rules (volatile pins)


## 22. Frame ⊇ pin/oracle carriers — enumeration by run

Class: frame-carriers — a frame blind to paired pin carriers, oracle guards
and derived test carriers because they were enumerated, not run-derived. Case
domain: a frame "exactly 2 edits" with a second dict-count pin in a sibling
test file; a 2nd cross-cycle instance — MAY-regions missed by the frame;
consequence-edits of byte pins outside the enumerated carriers (a 3rd
cross-cycle "frame vs pin-carrier" instance); tri-lang-rework c2-c4 — the D4
checker-blindness RCA-v2, instances ×7 audit-branch + 2 clean applications;
gbon-defcells-c2 2026-09-19 — the render-contract×pinned-guards fork (2
author-resolved realize halts on one surface); the "frame incomplete over
derived test carriers" RCA class, 3 intra-cycle instances. Directive state:
decomposer Rules (carriers of numeric-fact pins by a run; byte pins by a
case-complete run); specifier Rules (CHK-leg carrier enumeration; frame ⊇
anchors and pinned oracle guards; derived test carriers in frame MAY).

materialized into: skills/scope-change/assets/decomposer-charter.md, Rules
(pin-carriers + byte-pins bullets); skills/specify-change/assets/
specifier-charter.md, Rules (CHK-leg enumeration + frame bullets + derived
test carriers)

## 23. Claim-before-fact — declared ↔ authored

Class: claim-before-fact — completeness/coverage declared while the declared
members have no authored content; scenario/wiring declarations without
carriers. Case domain: gm-c1 r1-N1 ("per-class tests frozen @ CP1" with zero
authored test content) and r2-N2 (a per-class route registry emitted complete
while a CR-declared transition class had no row); gm-c3 (the zslice class
admitted with a 7-row expectation table carrying no zslice row — narrated as
"registered open"; the ordering gate checks ordering, not per-class
coverage); an S1 invariant without a "Check:" line (E1); a declared
test-scenario without a real test (D1); gbon-defcells-c1 2026-09-18 (the
declared-check-not-wired class — 3 intra-cycle instances r1-N1/r1-N4/r2-N1)
and c2 2026-09-19 (selector form: wrap/omission-blindness, 6 intra-cycle
instances); the spec-letters-non-executable-shapes class, 5 instances
(RL-6/RL-9/RL-18). Directive state: audit charter cat-4 (P-2/D1 riders, the
declared-frozen ↔ authored clause); specifier Rules (pre-registration
coverage per admitted class; scenario wiring two-point pin + selector form;
post-fix letters of defect scenarios).

materialized into: skills/audit-change/assets/verifier-charter.md, category 4
riders; skills/specify-change/assets/specifier-charter.md, Rules
(pre-registration + wiring + selector + post-fix-letters bullets)

## 24. Authoring sweep discipline

Class: authoring-sweeps — point edits without sweeping the neighbors, the
twins, the paired bodies, the status lines or the carrier canon of the same
authoring artifact. Case domain: an INV allowance lagging behind a CP
decision and a CP threshold contradicting the frame (caught only at the
external audit/verify stage); the probe-loss-on-carrier-move RCA (2 instances
in one cycle); the M7 regression-burst (fix regressions 3 times in a row); a
relapse after the fix-sweep norm (the M-signal "a fix without a cross-section
sweep", 3 instances; S2-1 not synchronized with the fixed INV-1); a stale
reserved list SA-ID docs/schema-artifact.md:14-19 (2 touches of the c2→c3
tail); the M-boundary "fragile instrumental boundaries/anchors"; FINAL-sweep
residue (8 procedural APPEND markers in a FINAL carrier; a mangled sentence
from a fix batch — notes-method-cm-c1); the self-claim/evidence-integrity
class (2 intra-cycle instances — "2 occurrences (:269-270)" with the fact 3);
the carrier-canon cases N7–N12 of audit r2–r6. Directive state: specifier
charter (CP synchronization; carrier-move; the Rules sweep family; FINAL-
sweep; self-referential evidence-records; carrier canon; pinning positive
columns).

materialized into: skills/specify-change/assets/specifier-charter.md, CP
synchronization + Carrier-move + the Rules sweep-family bullets

## 25. Registry trigger-matching integrity

Class: registry-matching — mis-read item status and incomplete matching over
the deferred-options registry. Case domain: notes-method-cm-c1 r1 retracted
r2 (a firing read the provenance-block expiry line "live" inside a
[DROP]-marked section); gbon-formalization C3 2026-09-17 (the 45-vs-46 mirror
divergence — a mechanical walk counted gm-rate-taxonomy dead by its
registration tag) and C2 (matching completeness). Directive state: audit
charter, the trigger-matching point (status by section-header marker only;
marker gloss; matching completeness by mechanical walk).

materialized into: skills/audit-change/assets/verifier-charter.md, the
trigger-matching point (item-status + marker-gloss + matching-completeness)

## 26. Letter-completeness of remediation and implementation

Class: letter-completeness — remediation or implementation truncated to a
subset of the declared letter. Case domain: relapse A5 (a retry block without
a final assert after an explicit instruction); the invariant-letter RCA
hypothesis ("a cache by the record id" — the code cached by view.ID); a
verify finding (the SB declared a render oracle, the execution truncated the
chain to encode→decode→re-encode). Directive state: realizer Rules (P-6
post-remediation re-check; INV letter↔code re-check; per-SB W→T chain
completeness).

materialized into: skills/realize-change/assets/realizer-charter.md, Rules
(P-6 + INV-letter + per-SB-chain bullets)

## 27. Edit discipline under frames

Class: edit-discipline — content-class stripping against MUST-preserve,
doc-line deletion without a behavior probe, no-op scripted replacements,
process markers into target code. Case domain: the impl-pressure verify
finding ("stripping content classes with a runtime string", 224 removals; the
twin incident executed the HALT correctly); a sweep cutting the kindBadRef
contract of MapAt as a "duplicate" — the contract was lost; the descWalk
map-key hook quietly not applying, exposed only by the added L1 test; the
marker_re-conflict class ×2 across cycles (the repo marker gate catching it
— the cost, a red iteration). Directive state: realizer Rules (vocabulary
ban × MUST-preserve; doc-line deletion under behavior-absence probe;
scripted-replacement count assert; process markers stay out of target code).

materialized into: skills/realize-change/assets/realizer-charter.md, Rules
(vocabulary-ban + doc-line + scripted-replacements + process-markers bullets)

## 28. Authorship boundaries

Class: authorship-boundaries — executor appropriation of authoring; the
authorship homogeneity of RUN artifacts; ownership/identity fabrication. Case
domain: the M4 signal "a subagent appropriates authoring", 2 instances; the
run-discipline RCA (a 3-record series: template-trap × implicit
role-boundary; the norm confirmed by 6 charter replicas of the incident
series); the cross-cycle RCA "silent edits outside units", 2 instances
(stray process markers in code; a fabricated license-holder name in docs —
deriving the owner's name from a nickname/domain and writing it into a
license is authorship fabrication). Directive state: realizer Rules (the
authoring-appropriation ban; RUN-artifact role homogeneity;
ownership/identity files outside may_modify).

materialized into: skills/realize-change/assets/realizer-charter.md, Rules
(appropriation ban + RUN artifacts + ownership/identity bullets)

## 29. Spike timing

Class: spike-timing — research executed at the wrong point of the unit. Case
domain: vite-middleware — the research was executed at the wrong point.
Directive state: realizer-charter, Spike-before-edit (R4) — the spike precedes
the edit.

materialized into: skills/realize-change/assets/realizer-charter.md,
Spike-before-edit (R4)

## 30. Execution-boundary canons — the Docker boundary

Class: execution-boundary — which execution the Docker-only canon covers.
Case domain: the instance's incident series behind the term (host-side parsing
of ready artifacts vs target-project/lab code execution). Directive state:
glossary, "Docker boundary of execution" (gate-integrity section).

materialized into: reference/glossary.md, the Docker-boundary term

## 31. Corpus merge discipline

Class: the corpus merge precedent (the founding integration conflict of the
shared pool). Case domain: a real conflict series of the pre-publication history (two
process lines, append-hotspot conflicts). Directive state: integration canon,
Merge model (merge, not rebase).

materialized into: norms/integration-canon.md, Merge model (merge, not rebase)

## 17. Awk over an empty stdin — probes that hang on missing input

Class: probe-mechanics — a mechanical check piped a command whose input
artifact was absent at run time, leaving the probe to hang or return
an empty-stream success instead of a failure. Instance: the realizer
charter's awk-based doc-numerics probe family (the awk-empty-stdin
incident, salvaged from the narrative-sweep's dropped instance list;
the lesson: a probe reading a file names the file's existence as a
precondition — a `test -f` guard before the pipe, else the empty stream
reads as a pass). Adjacent family: the c2 eval's anchor-validation leg
(`grep -Fc >= 1, else the ARM IS INVALID`) — the same existence-guard
pattern applied to scoring inputs.

materialized into: skills/realize-change/assets/realizer-charter.md,
mechanical-probe riders (the existence-guard form rides the probe
canon's next editorial touch; recorded here as the case domain).
