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
a documentation-canon program's first cycle r1 — a freeze carrying
"T2 rows — per spec §3.6" while the independent recount agreed at 24; the
same program's second cycle r1 — the freeze pinned "3 tracked files / 48"
from the C1-era note while the live git ls-files showed 4 files / 486 lines;
anchors/shas born by the freeze's own run and the freeze-form over the twins
block — a formalization program's C2/C3/C4)

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
anchor :57 with the fact at :56; a leaf-file path without the parent-package
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
instances in one program (c1: a probe artifact cited
before it existed; an unpinned close-run filter form; self-witnessed
exit-table counters. c2: a closure annotation mapping a glossary term
that greps 0 pre-land; an unpinned count inside a remediation fix line),
plus adjacent orchestrator-side events (an eval arm dispatched against
an unverified environment claim; control re-runs guessing marker
patterns instead of paste-executing exit-record commands). The M-bound
fired (≥2 same-class across cycles) → the RCA amendment.

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
twins-line strict form — a formalization program's C2/C3/C4, the before-count
off-by-ones across rounds and the $W/{L8} placeholder escapes);
skills/audit-change/assets/verifier-charter.md (D7 baseline-artifact carrier,
D9 run-pin by the output's literal form, instrumental-claims run-pin — a pin
"catches R-n of" refuted by the next specifier round, checklist-baseline-by-
artifact — the G4 process finding); skills/scope-change/assets/decomposer-
charter.md (inventory numeric claims by a run — a charter/profile claiming
"3 edits" at the fact 4); skills/specify-change/SKILL.md (the orchestrator's
control re-run of the spec's own counters);
skills/realize-change/assets/realizer-charter.md (probe-confirmation of
ledger claims — the P-6 claim "es==0 verified" with a live 0/0 panic; the
a ledger record's "skeleton distinguishability" claim with a byte tie)

## 15. Birth-enumeration — the mechanical carrier

Class: record-born-by-run, extending entry 14's series (the Birth-check
clause's first live exercise failed). Case domain: a conformance program's third cycle,
spec audit round 1 (author-mandated RCA-amendment). The
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
as executable" without runs of both language branches; the gate pattern-shape
chain — a documentation-canon cycle's ledger record (canon absent from the gate), a disposition round
(the pattern-shape stamp), a gate-mechanics cycle's ledger record (a line-anchored ^R-, G-*/@-*/ST-*
uncovered — 18 sites leaked to the staged product, caught only at the
orchestrator's confirmation read); the gate-without-run-pin 2nd instance —
the same round finding in two consecutive cycles; D2 enum-value quoting (foreign style-sheet tokens); D3/D4
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
wire table without an artifact); a CI finding post-land (a depth-test
file — 3 local gate runs green, CI on land RED: doc band 2 long
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
0-divergence re-inspection); a gate-mechanics cycle's close-out refresh (verify L1 ×4 + 2
read-reinspect residuals: a stale claims-map pair, a stale witness block, a
stale PBT counter, a prose failure-mode list claiming a mode absent from the
run-derived log); a later cycle's mechanism-phrase drift (a calibration-criterion
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
discipline. Case domain: a canonical-grain conformance cycle (git checkout --
over a dirty tree destroyed the realization — dangling-blob recovery; a ledger record —
a re-glue losing a segment of the pin); the "rigid section indexing" RCA
class ×3 (benchstat-like parsers); the mirror pair (a routing probe g1–g4;
its filter twin — the AND-mutation of the query side caught only by an external
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
domain: a process finding (the base norm); a gate-mechanics cycle's intra-cycle staleness r2 —
the registry drifted between the r1 and r2 freezes, per-round
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
cross-cycle "frame vs pin-carrier" instance); a three-language rework cycle's passes — the D4
checker-blindness RCA-v2, instances ×7 audit-branch + 2 clean applications;
a definition-cells cycle — the render-contract×pinned-guards fork (2
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
carriers. Case domain: a gate-mechanics cycle's round finding ("per-class tests frozen @ CP1" with zero
authored test content) and a second round's (a per-class route registry emitted complete
while a CR-declared transition class had no row); a third cycle (the slice class
admitted with a 7-row expectation table carrying no slice row — narrated as
"registered open"; the ordering gate checks ordering, not per-class
coverage); an S1 invariant without a "Check:" line (E1); a declared
test-scenario without a real test (D1); a definition-cells cycle's first pass (the
declared-check-not-wired class — 3 intra-cycle round findings)
and its second pass (selector form: wrap/omission-blindness, 6 intra-cycle
instances); the spec-letters-non-executable-shapes class, 5 instances across three
ledger records. Directive state: audit charter cat-4 (P-2/D1 riders, the
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
a stale reserved list SA-ID of a schema doc (2 touches of the cycle-boundary
tail); the M-boundary "fragile instrumental boundaries/anchors"; FINAL-sweep
residue (8 procedural APPEND markers in a FINAL carrier; a mangled sentence
from a fix batch — a documentation-canon program's first cycle); the self-claim/evidence-integrity
class (2 intra-cycle instances — "2 occurrences (:269-270)" with the fact 3);
the carrier-canon cases of the audit rounds. Directive state: specifier
charter (CP synchronization; carrier-move; the Rules sweep family; FINAL-
sweep; self-referential evidence-records; carrier canon; pinning positive
columns).

materialized into: skills/specify-change/assets/specifier-charter.md, CP
synchronization + Carrier-move + the Rules sweep-family bullets

## 25. Registry trigger-matching integrity

Class: registry-matching — mis-read item status and incomplete matching over
the deferred-options registry. Case domain: a documentation-canon cycle's r1 retracted
at r2 (a firing read the provenance-block expiry line "live" inside a
[DROP]-marked section); a formalization program's C3 (the mirror-count
divergence — a mechanical walk counted a rate-taxonomy item dead by its
registration tag) and C2 (matching completeness). Directive state: audit
charter, the trigger-matching point (status by section-header marker only;
marker gloss; matching completeness by mechanical walk).

materialized into: skills/audit-change/assets/verifier-charter.md, the
trigger-matching point (item-status + marker-gloss + matching-completeness)

## 26. Letter-completeness of remediation and implementation

Class: letter-completeness — remediation or implementation truncated to a
subset of the declared letter. Case domain: a relapse case (a retry block without
a final assert after an explicit instruction); the invariant-letter RCA
hypothesis ("a cache by the record id" — the code cached by the record's identity field); a
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
twin incident executed the HALT correctly); a sweep cutting the reference-validation
contract of a map-access routine as a "duplicate" — the contract was lost; the
map-key hook quietly not applying, exposed only by the added L1 test; the
marker-pattern-conflict class ×2 across cycles (the repo marker gate catching it
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
domain: a middleware-integration cycle — the research was executed at the wrong point.
Directive state: realizer-charter, Spike-before-edit (R4) — the spike precedes
the edit.

materialized into: skills/realize-change/assets/realizer-charter.md,
Spike-before-edit (R4)

## 30. Execution-boundary canons — the Docker boundary

Class: execution-boundary — which execution the Docker-only canon covers.
Case domain: the instance's incident series behind the term (host-side parsing
of ready artifacts vs target-project code execution). Directive state:
glossary, "Docker boundary of execution" (gate-integrity section).

materialized into: reference/glossary.md, the Docker-boundary term

## 31. Corpus merge discipline

Class: the corpus merge precedent (the founding integration conflict of the
shared pool). Case domain: a real conflict series of the pre-publication history (two
process lines, append-hotspot conflicts). Directive state: integration canon,
Merge model (merge, not rebase).

materialized into: norms/integration-canon.md, Merge model (merge, not rebase)

## 60. Awk over an empty stdin — probes that hang on missing input

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

## 32. Numeric anchors without a run — the D5 trap family

Class: spec/pin hygiene — numeric anchors and counters (line numbers,
sha sums, pattern-dependent counts) asserted without a run at writing
time; the self-referential sub-class (counts invalidated by the very
act of recording them) is structurally unhonest-able: agents tried
"fair" pins with out-of-count caveats and reproduced the defect.
Instance: a slot-population census audit — a pin-counter RCA class ×3,
a pin-precision RCA class ×4 (line-anchored RCA records in the audit
round-ledger), a recurrence RCA — the recurrence after discipline RCAs exposed a
design defect of the enumeration itself (raw uniq catches any new
"@-token"); fixed by whitelist-filtering the enumeration command
(design-level, not vigilance). In-cycle remediation: every numeric
anchor carries its deriving command adjacent; content-counters
(REQ/INV/PBT/scenario tags) are stable and pin by a run; self-
referential size-pins banned; named-anchor convention + mechanized
lint (entry 33) as the durable exit.

materialized into: skills/specify-change/assets/specifier-charter.md,
anchor discipline (rides the canon's next editorial touch; recorded
here as the case domain per entry 60's form)

## 33. Manual anchor re-pinning at scale — mechanize the lint

Class: spec maintenance — hand re-pinning anchors across a large
living spec errs always (850-line spec, six-round drift streak);
discipline RCAs raise the writing bar but do not survive scale.
Instance: a slot-population census audit — a pin-class RCA ×6;
remediation applied in-cycle: a mechanized anchor lint
(DEAD(eof)/MOVED(span)/SUSPECT(non-func identifiers)) — the lint run
is a mandatory exit-self-check pre-condition of the FINAL status;
SUSPECT types are hand-verified, only the removed-function class is
blocking. The durable directive: any cycle carrying named anchors
against a moving tree ships its anchor lint as a gate, not a habit.

materialized into: skills/specify-change/assets/specifier-charter.md
+ skills/verify-change/assets/verifier-charter.md, anchor/lint canon
(rides the canon's next editorial touch; recorded here as the case
domain)

## 34. WIP-basis drift between realize waves — one active basis

Class: basis discipline — amendments pin their anchors against a
moving WIP tree between realize waves; basis layers accumulate and
the spec becomes multi-basis without declaration (line-count and
MAY-anchor verifications die silently).
Instance: a slot-population census audit — a basis-drift RCA ×2
(two findings incl. a BLOCKER, amplitude-M); remediation applied in-cycle
(a charter annex ruling): ONE active WIP basis — every amendment takes a
fresh snapshot (git diff HEAD, both index and worktree states) and
re-pins ALL WIP anchors against it; the previous snapshot retires to
history; the basis declaration (sha256 + wc pins) lives in the spec
header.

materialized into: skills/realize-change/assets/realizer-charter.md,
WIP-basis section (rides the charter's next editorial touch; recorded
here as the case domain)

## 35. Dispatch/return completion discipline — the two-branch rule

Class: dispatch-completion — return points at every dispatch boundary of the
chain governed by no stated contract: a completed launch re-entered on a
rework command; a crashed launch's task silently re-dispatched fresh (or
lost); completion judged by no parseable rule; freshness constraints scoped
to named counterparts instead of the whole launch set.
Case domain: the corpus's own dispatch-completion canon program (cycle A, corpus): the
provider-empty-return incident class (12+ instances recorded in the
deferred-options registry's fate blocks; the change card's explicit
request), the relayed-numeric-claims class, and this program's own
orchestration.
Derivation: profiled as a program of 2 (corpus A / workspace B, sequenced);
the canon's placement resolved at CP1 — the procedure in a norms file, the
terms as glossary keys, the role moments inline in the role charters, a
one-line rule + pointer at each dispatch site; the return-point judge
resolved at CP2 — orchestrator-judged (the role emits its deliverable per
its charter's Output contract, the orchestrator applies the parse rule and
is the roster's single writer; the in-artifact completion marker absorbed as
an optional contract-field); the spike class reconciled into coverage
(completion = the named product artifact parses into the mandate's declared
contract form; the R4 spike-before-edit stays outside the class — executed
by the realizer themself); the verifier-crash case reconciled at fix-pass
round 3 ("always completed" names the completion moment — the verdict/report
— not an exemption from the two-branch rule; a launch ending without a
parsable verdict/report is incomplete on the identity branch).
Directive state: `norms/dispatch-completion.md` (Two-branch rule / Fences /
Per-role completion moments / Role roster protocol / Output contracts /
Carrier-agnostic form); one-line rule + pointer at the SKILL.md
dispatch/return sites and the orchestrator's roster steps; Output contract
blocks in the six role charters; the six glossary keys.

materialized into: norms/dispatch-completion.md, all sections;
skills/scope-change/SKILL.md + skills/specify-change/SKILL.md +
skills/audit-change/SKILL.md + skills/realize-change/SKILL.md +
skills/verify-change/SKILL.md, the dispatch/return sites + the orchestrator
steps; skills/scope-change/assets/decomposer-charter.md,
skills/specify-change/assets/specifier-charter.md,
skills/realize-change/assets/realizer-charter.md,
skills/audit-change/assets/verifier-charter.md,
skills/verify-change/assets/verifier-charter.md,
skills/init-change/assets/interview-protocol.md, the Output contract blocks

## 36. Registry hygiene — a closure record transplanted into a live item's section

Class: registry-hygiene — a fate/closure block narrating one item's
build-path copied into a different (live) item's section; a status read by
the narrative instead of the section-header marker then mislabels the live
item as dead (the header-only status rule caught the divergence: the mirror
bijection counted the item live while the fate block claimed drop-executed).
Case domain: the corpus's own dispatch-completion canon program (cycle A reconcile): the
provider-empty-return section carried the closure record of
a narrowing-cells closure cycle (the decode-fix build-path narrative) and was
read as drop-executed by the profiling stage's trigger-matching walk.
Derivation: the disposition restored the section to its own fields
(id/essence/anchors/trigger/build-path/expiry/provenance), added no death
marker (the item is live — a future expiry), and pinned the correction in
the provenance line; the class joins the header-only status canon rather
than weakening it.

materialized into: the deferred-options registry (an instance-state role), the
provider-empty-return section (provenance line)

## 37. Stale embedded triggers — charter text pointing at a dead registry item

Class: stale-embedded-trigger — a process artifact's operative text embeds a
live pointer to a registry item's checkpoint branch; when the item dies, the
pointer rots and every future edit of the artifact re-arms a question whose
referent no longer exists (the spike inventory caught it as a live
self-referential trigger; the spec carried it as an author-decision row).
Case domain: the corpus's own dispatch-completion canon program (cycle A reconcile): the
realizer charter's sentence activating the checkpoint branch of
a mechanical-sweep carrier item ([DROP-marked absorption], verified by a
registry probe before the deletion — the behavior-absence probe of the
doc-line rule).
Derivation: the sentence removed outright (the item is dead; no replacement
pointer exists); the removal recorded here; embedded item references in
operative text are candidates for the same probe at every reconcile touching
the artifact.

materialized into: skills/realize-change/assets/realizer-charter.md, the
Rules section (the sentence after the close-out-refresh clause, removed)

## 38. Findings-header reconciliation — the header re-derives from its own list

Class: findings-header-arithmetic — a findings artifact's header counters
(total / blockers / majors / minors) diverging from the artifact's own
findings list (a minor counted twice through a re-label); the round-ledger
inherits the header numbers and propagates the defect into dispositions and
monitor rows.
Case domain: the corpus's own dispatch-completion canon program (cycle A audit round 1): the
header printed minors: 6 over a list carrying five MINOR rows (1+1+6 ≠ 7);
caught by the next round's process observations; the ledger corrected to the
list's ground truth with a provenance note.
Derivation: the header's issuance rule now requires the reconciliation at
the moment of writing — the list is the ground truth, a diverging header is
fixed before issuance.

materialized into: skills/audit-change/assets/verifier-charter.md, the
Output section (the header-reconciliation sentence)

## 39. Correlated adversarial generation — the witness author is the pattern author

Class: correlated-adversary — negative witnesses for a birth fence are
crafted from the same mental model that authored the pattern, so the
witness's blind spot coincides with the pattern's; the fence records a
run over a class the check cannot miss by construction, while the
realistic leak class (a differently-shaped spelling of the same token)
stays green.
Case domain: a constitution cycle (audit round 1): a
version-token ban `\b0\.[12]\b` was born green over the bare form
"0.2" while the repository family's tags are all v-prefixed (v0.2.1);
a neutrality seed word-bounded and singular-only was born green while
plurals and verbal paradigms (slicing, panicked) are the natural
English leak forms. The audit's independent crafts reddened both; the
M-bound RCA traced the cluster to this mechanism (a second instance
the same round: a birth fence diffing against a nonexistent witness
path — a green byte-identical to file-not-found).
Derivation: negatives are drawn from corpus facts (live spellings,
baseline shapes) wherever they exist; a positive whose output is
byte-identical to the failure mode is no witness; the fix-pass
applied a per-escape-class sweep (a check × escape-class table, every
cell legged or bounded) and the class collapsed from 4 MAJOR to 2
zone MINORs in two rounds.

materialized into: skills/specify-change/assets/specifier-charter.md,
the 5-element-form canon (adversary-independence / per-escape-class
witnessing / degenerate-positive ban clauses)

## 40. Escape-class residuals — closure at the boundary of the enumerated list

Class: escape-class-residual — after a per-escape-class closure sweep,
surviving findings sit on the boundary of the fixed class list itself
(carrier well-formedness of the stripping helper, typo-depth of
mention suffixes, prefix casing), not on the classes the sweep
enumerated; each is either one more leg, one more bound, or a
declared noise-floor edge.
Case domain: a constitution cycle (audit rounds 3-4): all
legged claims of the closure table held under independent crafts; the
residuals were an unclosed-fence suppression in the shared prose
stripper, a mention token still forgiving 4-letter suffixes, a
skeleton-prefix casing surface, and two record-level inaccuracies —
each one-guard or one-bound sized, disposed at the noise floor.
Derivation: the sweep is the standing remedy shape for a
false-security cluster: enumerate the classes once, leg or bound every
cell, and verify the table itself for completeness at every audit
round of the cycle.

materialized into: skills/audit-change/assets/verifier-charter.md,
the Checklist derivation procedure (escape-class closure dimension);
skills/specify-change/assets/specifier-charter.md, the per-escape-class
witnessing clause

## 41. Acceptance-domain mismatch — the instrument accepts less or more than the declaration

Class: declaration-instrument-domain — the realized gate accepts a
domain narrower or wider than the declared oracle it claims to
implement; the divergence lives on structural grains the declaration
does not name (heading level, list membership, whitespace skeleton,
column-value domain, role association, extraction orthography), so
every projection of closure (leg↔Check, tag↔unit, counter↔run,
twin↔pin) stays green while the acceptance domains disagree.
Case domain: a grammar cycle (audit round 1: six MAJOR of
one family — fence-blind banned scan, unpinned refusal-list
composition, unpinned frozen-table rows, level-blind id scan, global
equality instead of per-article walk, MUST-preserve without a leg)
after two prior cross-cycle instances of the same family; the RCA
family treatment (six mechanisms) closed the cluster 12→5→4→3→1 over
five rounds, with the residuals predicted as boundary-of-closure
grains and confirmed as such.
Derivation: routing a canon candidate into a registry trigger-item
without landing the clause gives detection without prevention — the
next cycle pays a blocked round, a fix-pass, and a re-audit to
re-discover the same family; the landed clause (quantifier mirroring,
composition pins, direction-pair cells, substrate inheritance, frame
projection) moves the forms from author discipline into the letter of
the charter.

materialized into: skills/specify-change/assets/specifier-charter.md,
the per-escape-class witnessing clause (direction-pair cells) and the
quantifier-mirroring / composition-pin / substrate-inheritance /
frame-projection clauses

## 42. Unprobed angles — verify-stage semantics on what S2 never shot at

Class: s2-angle-gap — the semantic verifier finds discrepancies on
angles of the contract that the spec's scenario set never aimed at:
the open tail of an "exhaustive" definition (a probe satisfying every
literal predicate while violating the definition's intent), and
interpretational ambiguity where two readings of the same articles
both stand (an L0 with no provable contradiction).
Case domain: a grammar cycle (verify: the two-root stream
probe passing the letter of CONF-1 — closed by an L1 one-line
requirement plus a refusal-class phrase; the intern-space view
identity question — tolerated with an authoring fork recorded for
reconcile).
Derivation: an invariant declared exhaustive earns boundary probes in
S2 — the degenerate compositions of the defined whole (empty body,
two roots, surplus tail, deficit tail) each get a scenario pinning
the refusal class that catches it; where two readings coexist, the
spec records the fork instead of resolving it silently.

materialized into: skills/specify-change/assets/specifier-charter.md,
the frame-projection clause (the frame leg pairing); the boundary
probe practice rides the scenario-wiring canon of this charter

## 43. Letter-only clauses — the family migrates to the parts the clause does not reach

Class: part-level witnessing gap — a materialized canon clause executed at
the granularity of the whole (the gate, the check, the artifact) while the
defect lives in a part (one conjunct of a composite predicate, the
pattern's carrier form, a transcribed literal); every projection of
closure stays green because the unit of witnessing is coarser than the
unit of failure.
Case domain: a binding-parameters cycle (audit round 1: six
findings of the standing declaration-instrument family despite the canon
landed by the predecessor cycle — a vacuous phrase subcheck blind to the
target's own line wrap, a line-count where an occurrence-count was
declared, a token-blind carrier pattern missing a live requirement line,
transcribed anchors not born by runs; the RCA separated the causes: a
transposed escape-matrix executed as class→demo-check prose, the leg as
the witnessing unit instead of the conjunct, adversary-independence
binding the witnesses but not the pattern sources, and a finalization
manifest that was incomplete without blocking; the family treatment
materialized the matrix as a 12×8×2 table, isolated every conjunct with
its own red witness, re-derived the carrier patterns from live trees,
and closed the cycle 11→5→7→3→1 over five rounds).
Derivation: a clause with a mechanical carrier prevents — the
substrate-inherited fence guard closed its sub-family to zero findings
across two consecutive cycles; a letter-only clause shrinks the family
without preventing it, because execution prose can satisfy the clause's
letter at a coarser grain; the fix is to name the unit — the cell, the
conjunct, the pattern source, the manifest pass — inside the clause and
give that unit a mechanical enumeration at exit.

materialized into: skills/specify-change/assets/specifier-charter.md,
the material escape-matrix carrier / conjunct-level witnessing /
pattern-source independence / finalization-pass manifest clauses

## 44. The carrier inventory — the same class re-entering through each new instrument

The case: a docs cycle whose audit returned the same blocker class
four rounds in a row — first a gate scoped to one section while its
invariant was section-independent, then the same narrowing inside the
remediation's own wiring table, then a discriminator authored from
the spec's citation of the forms (a correlated witness), then a
provenance tail no enumeration had swept. Each fix added a new
instrument and the class re-entered through it; incremental,
finding-local closing moved it one carrier at a time. The cure was
exhaustive, not incremental: a one-pass enumeration of every
carrier shape an assertion could ride (fields, zones, tails,
mentions, bodies, bindings — the full carrier inventory) closed as a material matrix,
cell by cell, both directions; the next round's hunt for a 26th
shape came up empty (~20 candidates, every one caught or grounded),
and the class did not return. Three author rulings carried the
escalation ladder (continue with fix self-verification → derive
patterns from independent sources → close the inventory
exhaustively).

materialized into: skills/specify-change/assets/specifier-charter.md,
the assertion-carrier matrix clause; skills/audit-change/assets/
verifier-charter.md, the assertion-carrier matrix standing dimension
and the next-shape hunt standing duty.

## 45. Fix-pass self-verification — instruments that reproduce the disease they treat

The case: two consecutive fix-passes closed their findings and
simultaneously re-created the same defect class inside the new
instruments they introduced — a wiring row that silently narrowed
the invariant's domain, a pin-table discriminator with holes in both
directions. The self-verification duty (re-run every prior round's
probe forms plus own negative probes of the fixed class before
returning FINAL) exposed the blind spots of the next fix, and the
pattern-source rule (runner patterns derived by enumeration runs
over independent carriers, transcripts beside the pattern) removed
the correlated-witness root. After both were in force, the remaining
findings were mutation-coverage gaps inside closed rows, and the
final rounds closed at the minor noise floor.

materialized into: skills/specify-change/assets/specifier-charter.md,
the post-FINAL fix-pass self-verification clause and the
pattern-source rider for gate-runner discriminators.

## 46. Edges in no arm — projections whose decode/encode edges nobody enumerated

The case: a verify stage found two discrepancies of one class — a
binding's projection mapped a sort onto its carrier and a position
onto its rendering without enumerating the EDGES: which wire inputs
the decode position accepts (an odd-length byte sequence at a
character-sequence position), which carrier values the encode
accepts (a nonzero scale on an arbitrary-precision integer). Each
edge lay in no arm of the declared outcome trichotomy
(preserve / refuse / surrogate), so the document was silent where a
decoder or encoder had to behave somehow. Neither the cross-check's
union leg (encode-side observability only) nor any form gate swept
per-projection edge coverage — the class is invisible to both
mechanical and comparative checks unless edges are enumerated
against arms explicitly.

materialized into: skills/audit-change/assets/verifier-charter.md,
the projection-edge arm coverage dimension.

## 47. Relay transcription ×2 — brief-borne literals nobody verified at dispatch

The case: two orchestrator relay defects in one session, both caught
downstream by the receiving verifier with zero blast radius — a
prestate witness hash relayed into an audit round brief with one
doubled character (65 hex chars against the authoritative zone pin's
64; deleting the doubled char yields the true value), and a verify
brief citing a verdict-form asset the corpus never carried (a
glitched listing; the corpus git history is empty for the path). The
standing relayed-claims canon covered numeric claims only (counters,
sizes, line counts), so a hash string and a path/asset reference
passed unverified at dispatch. The cure generalizes the canon's form
without touching its shape: every relayed literal — numeric or
string-form (hash, path, asset reference) — is copy-paste from its
authoritative carrier (a fresh run for numbers; the pinned file, the
live tree, or the corpus index for a string reference) and is
verified against that carrier before dispatch; a relayed value is
never load-bearing — the receiving verifier re-hashes/re-reads the
authoritative pin regardless.

materialized into: skills/audit-change/SKILL.md,
skills/realize-change/SKILL.md, skills/specify-change/SKILL.md — the
relayed-literal-claims rule of the Cycle item 2 (the orchestrator
side).

## 48. Spec-pinned volatile state — transcribe nothing, re-derive by run

The case: a migration cycle whose spec's operative record pinned a
live census of the carriers the units edit (task-list line map,
mirror size, store event counts, note count). Between the spec's
birth and realize, sibling sessions moved the live state (the list,
the mirror and the store counts all drifted upward between the two
censuses); the spec's numbers were honest at birth and stale at
realize. The realizer pinned the birth state by run before the first
edit (file witnesses + sha256 pins + repository HEAD pins),
re-derived every consumed census value by run at the moment of use,
and recorded each spec-pin↔live delta as a dated ledger record —
the migration arithmetic was built from the re-derived values, and
the conservation expectations closed against the re-derivation, not
against the spec's transcription. The verify-side volatile-pin norm
(drift with date/HEAD is not a discrepancy) already covered the
adjudication; the realize-side duty — pin at birth, re-derive by
run, record per delta — was not carried.

materialized into: skills/realize-change/assets/realizer-charter.md,
the volatile-state reads clause (Rules).

## 49. Self-referential count — a filter that does not cover its own transcription

The case: a spec's fix-pass twins block carried count lines whose
printed pipelines reproduced neither their before- nor after-values —
a `grep -c … | grep -cv <marker>` filter under-selected the record's
own transcription lines (four self-referential sites against the
declared zero), and one count line declared a value no run could
produce (four against the honest three; the claimed fourth site
carried different bytes than the literal). The freeze caught both at
freeze time by paste-executing every line as printed — the catching
mechanism (the strict freeze-form clause over the twins block) worked;
the defect lived in the authored form, not in the standard. The cure,
executed in the same cycle under the orchestrator ruling: each line
re-printed in the form that actually reproduces its pinned values,
every line re-run as printed immediately after the edit, values
unchanged; the rule the case fixes — a mechanical claim about a
record's own text carries a domain exclusion proven to cover the
record's own transcription lines, and a count no run produces is not
FINAL (the birth-check's "a divergence is not FINAL").

materialized into: skills/audit-change/assets/verifier-charter.md —
the freeze-form-over-the-twins-block strict-lines clause (the standing
catching mechanism; no new clause minted — the case closes under the
existing canon); skills/specify-change/assets/specifier-charter.md —
the birth-check finalization rule (the not-FINAL leg).

## 50. A run-ground that fails as printed grounds nothing

The case: a disposition record claimed an audit citation did not
resolve on the live tree, grounding the claim on an annex command that
failed as printed (a malformed grep invocation, exit 128 — no output
was read as a negative). The audit round re-ran the resolution with a
working form, found the second locus live on the tree (the same
sentence in a casing variant), and inverted the record; the fix-pass
re-resolved it, restored the dropped leg into its fix domain, and
re-pinned the ground with the working command and its fresh output.
The record's claim was a run-claim like any other — and the canon
already demanded exactly this: a check formulated without a run that
executes as printed is a false-security form (the D4 run-pin rule),
every count born by a same-session run pasted beside the command (the
birth-check), and a diverging re-derivation is a finding, not an edit.
The case adds the disposition-scale statement: an unverified negative
("does not resolve") silently narrows a fix domain — the vector leaves
the object only when the run domain is proven case-complete by a
command that runs.

materialized into: skills/specify-change/assets/specifier-charter.md —
the D4 instrumental-check run-pin rule and the birth-check FINAL rule
(the standing catching mechanism; no new clause minted — the case
closes under the existing canon).

## 51. Obligation-keyed instrumentation — the check set tiling the input pipeline

The case: a spec committed edit obligations (additions, relocations,
rewritings its own tables enumerated) while its instrument legs were
keyed to finding ids — the legs covered the findings the audit had
already named, and every obligation no finding had named passed
unlegged; the finalization frame projection legged MUST-preserve
articles only, and the must-LAND direction was an open gap. The family
then tiled itself across the whole input pipeline over three cycles of
the program: the generating-command internals (a composite check over
generated artifacts legged the author's fixtures while the generator
emitted shapes no fixture reproduced), the generator's output shapes,
the checker's invocation forms (swapped, doubled and extra arguments
and partial-range inputs stayed green; a usage string fenced nothing),
and the metadata carriers of a declared clause (a tag/tagger clause
declared and never probed — an annotated tag with the legacy tagger
shape passed the whole battery green until objecttype/tagger probes
legged both directions). Sixth-to-eighth cross-cycle instances of the
declaration↔instrument family; the cure keys every leg to the
obligation itself (an obligation table reconciled mechanically at the
exit gate), derives the shape enumeration from the generator rather
than the fixtures, pins the invocation forms of every composite
checker, and names the probe form of a declared clause over a metadata
field (objecttype/tagger enumeration).

materialized into: skills/specify-change/assets/specifier-charter.md,
Rules — the obligation-keyed instrumentation and generator-shape
legging clauses (the frame projection's dual direction) and the
invocation-contract clause.

## 52. Compensating arithmetic — totals that match while the labels are wrong

The case: a count reconciliation over two record families closed on
aggregate equality — the totals matched (47 = 47) while both member
labels were wrong (31+16 against the true 29+18), and the arithmetic
fence itself ("31/31") transcribed one of the wrong labels as its
expected state. The same class fired in a sibling program the same
week (a migration whose census closed on global sums while per-article
members disagreed), making the pair cross-program. The
self-referential half of the family (a record counting a set that
includes its own carrier) is carried by the self-referential
evidence-records clause and its own casebook entry — not restated
here. The cure closes per-label: each family's count is fenced by its
own run in both directions, and an aggregate-equality form is named a
compensating error that closes nothing.

materialized into: skills/specify-change/assets/specifier-charter.md,
Rules — the per-label count fences clause (beside the Birth-check
block).

## 53. The walk that miscounts its own live set — a trigger-matching cascade

The case: an audit line's trigger-matching walk reported a live
registry set of 8 items, then 17, then 9 across three rounds of one
cycle with no registry revision between them — dead, DROP-marked items
fired phantom matches in the middle round, and every count was born
from memory rather than from the walk's own run; the registry's mtime
predating all three verdicts proved the drift was walk-side each time.
The standing clauses constrained what the walk reads (status by the
section-header marker only) and that it enumerates all live items —
nothing pinned the correctness of the walk itself. The cure pins the
cardinality: the live-set count is stated in the round-ledger firing
line, born by the walk's own header-grep run with its output pasted,
and a count change between rounds without a registry revision is
itself disclosed as a matching defect and re-walked.

materialized into: skills/audit-change/assets/verifier-charter.md —
the walk count-pin bullet of the Trigger-matching point (Matching
completeness context).

## 54. The guard as the largest leak — ban instruments carrying banned dictionaries

The case: an identity-leak guard carried a banned-token dictionary of
the very literals it existed to catch — name, e-mail, employer domain,
handles — as plain literals inside a tracked, pushed tool script; by
byte volume the guard was the leak's largest single edition of the
banned content, whatever its scan coverage. The adjacent canon
(final-gate patterns derived by a run from the spec's own
id-inventory) actively misleads for this class: deriving a dictionary
from an inventory publishes it. The cure inverts the instrument: the
guard pins the expected composition positively (exact-composition
constants over the expected neutral state, any deviation red) and
carries no transcribed dictionary of the banned literals — a negative
dictionary inside a tracked artifact is itself an instance of the leak
class, independent of how well it scans.

materialized into: skills/realize-change/assets/realizer-charter.md,
Rules — the ban-instruments rider to the final-gate scan-pattern
clause.

## 55. Cross-tree invalidation — the sync list written from named zones while both trees carry the truth

A spec addendum prescribing edits to the target set listed its synchronization carriers by enumerating the zones the ruling named; the invalidated literals lived in more carriers (born data files, normative counts in the born document, the changelog) — the list was incomplete in three blocker-sized ways while every tool over the edited tree stayed green. The cure: the sync list is a copy-paste of an enumeration run over BOTH trees (spec + target) for every invalidated literal, multi-line probe forms included. Found in a conformance cycle r8 (three same-family findings); materialized into: specify-change/assets/specifier-charter.md, rule "Cross-tree reverse sweep before a sync list".

## 56. Anchors that age by epochs — arithmetic from the current edit lands them on strangers

Born artifacts carried positional anchors into a tree that then received two insertions; translating the anchors by the current edit's delta (+2) landed five pre-existing anchor families on unrelated lines — each anchor ages by every insertion made after ITS birth, so the delta is the sum of its epoch's insertions (+13), and the proof is a same-object check (byte-identity of the named object), never arithmetic from a stale value. A verify round then found fifty anchor lines of born data resolved against pre-birth positions — the gate leg asserting anchor resolvability against the live tree closes the class. Found in a conformance cycle (a post-realize sensor pass; verify D0 + read-reinspect); materialized into: specify-change/assets/specifier-charter.md, rule "Epoch-delta of anchor translation"; realize-change/assets/realizer-charter.md, rule "Anchor stability of born data".

## 57. The freeze that shipped without closing its own twins

Four consecutive checklist freezes (r8→r12) shipped without paste-executing the spec's current twins block; the closure was performed each time by the round's Verifier as a courtesy — the baseline the freeze existed to pin was verified by nobody at freeze time. The cure is a freeze-time duty: paste-execute every twins line (before against the sha-pinned pre-round copy, after against the live tree) and record the closure in the freeze body. Found in a conformance cycle (Outside the standard, r8/r10/r12); materialized into: audit-change/assets/verifier-charter.md, derivation canon P-0.

## 58. Manifest/leg-map omission — the audit×legs walk at FINAL

The case: an audit finding's live legs on the cycle surface escaped the spec's manifest (the finding→unit map, the header counters, the coverage claims) while the named unit accepted them — the manifest's completeness was verified ad hoc by negative probes introduced per fix, never as a standing finalize duty; the class fired in three consecutive cycles of one program (a finding's second locus dropped; another finding's glossary legs plus a leg-map row dropped; the legs of a dispositioned finding whose own unit header named them dropped).

The cure: at FINAL the mechanical walk „every audit finding × its cycle-surface legs × manifest membership“ runs born-by-run; uncovered edit-legs = 0, in both directions (a manifest row without a live audit leg and a live audit leg without a manifest row both go red; a cited locus outside the cycle surface carries a recorded ground).

Found in this corpus's leak-removal change program across consecutive cycles (M-bound — 3 cycles); materialized into: skills/specify-change/assets/specifier-charter.md, Rules — the Finalization-pass manifest block (the audit×legs walk clause).

## 59. Pins against an intermediate state — freshness at finalization

The case: a pin whose precision is state-relative survived to closure because the closure pass forces re-derivation of numeric records but not of these pin forms: a spec header citation naming batch/pass blocks superseded by the later definitive block (values current, citation stale); a zone count invalidated by the finalization batch's own artifact landing in the counted zone (closed in-cycle by a counted-set declaration naming the excluded unstable members); a realize evidence record's insertion-boundary description "between old 93 and 94" where the mechanical fact is after old 94 (the realize-side shape — closed under the existing probe-confirmation-of-ledger-claims canon).

The cure: at the finalization pass a pin born against an intermediate state is re-derived born-by-run against the final state — the count over a zone the batch itself changes carries a counted-set declaration naming the excluded unstable members, the citation is re-pointed to the definitive block, and the boundary or insertion-point description states the mechanical fact its probe produces; a pin the final batch's own artifacts invalidate is red at the exit gate.

Found in this corpus's leak-removal change program across consecutive rounds (M-bound — 3 instances across cycles); materialized into: skills/specify-change/assets/specifier-charter.md, Rules — the Finalization-pass manifest block (the pin-state freshness clause).

## 61. The record that outruns its run — a pin and its enforcers move together

The case: one genus of record defects recurred across consecutive cycles and rounds of this corpus's leak-removal change program, in four shapes with one root — the recorded layer diverging from the executed layer it reports. An acceptance probe was born as text and never executed at insertion: a pattern typo made it match nothing (green on any tree), while a sibling probe was stronger than its own shall-clause (red on the very state the clause itself produces). A twins batch closed before the last edit of the block it covers: the recorded verdict described an intermediate state. A status line pinned a batch count no born run carried, and the checker row enforcing that literal tested its presence, not its truth — the enforcement row kept the stale record in place against its own cure. Declarations carried counters transcribed from expectation; the batch then closed with the corrected numbers living only in the verdict line.

The cure: a record that pins an execution is re-derived born-by-run in the same edit that moves what it pins — a probe executes at insertion against the live state and a poisoned state, in both directions; a batch re-closes after the last edit of the block it covers; a prose pin and every checker row enforcing its literal move in one edit; a number enters a record only as the output of the run that produced it.

Found in this corpus's leak-removal change program across consecutive cycles and rounds (M-bound — the mandatory class-history RCA duty at the program's reconcile stage; the instance enumeration lives in the cycle's registry record and the immutable audit, not here); materialized into: the reconcile execution record of the carried-class-history registry entry (the cycle's spec registry), and bound to the existing canons it references — the born-run/poison discipline of fix passes, the Finalization-pass manifest block of the specifier-charter (pin-state freshness, the audit×legs walk), and the twins-closure duties of entries 57 and 59.

## 62. The verdict that narrates without counting — per-clause accounting

The case: verification verdicts of the chain narrated findings (a verdict
line + a findings list) while the checked contract's clauses carried no
per-clause coverage state — "zero findings" was indistinguishable from "the
clauses were never enumerated", an unchecked clause could sit silently under
a clean verdict, and a toleration had no frozen record semantics (expiry,
outcome, recurrence). The gap surfaced in a cold audit of verification
adequacy (2026-09-29): verdict narratives without per-clause accounting.

The cure: the accounting substrate frozen at the canon layer — the clause
ledger (one line per contract clause: disposition × evidence pointer, the
clause list derived mechanically), the closed disposition dictionary with
its blocking table (an unchecked or unresolved clause blocks a clean
verdict; a waiver is clean-compatible only while live), and the
pre-registration form of the waiver-mode constants. The layer sits over
adjudication (L0–L4 unchanged) — a violated line points at its
finding/adjudication, it does not re-adjudicate.

Found in this corpus's verification-adequacy change program, cycle C1 (the
substrate freeze before the consumer cycles branch); materialized into:
reference/glossary.md (the terms `disposition dictionary`, `clause ledger`,
`waiver`, `re-census`, `sufficiency record`, `anchor-status`,
`calibration set`); norms/dispatch-completion.md (section "Clause-ledger
verdict form"); norms/monitor.md (section "Waiver-mode constants
(pre-registration form)").

## 63. The completion moment that trusted the body — the counted header at the return point

The case: a verification launch's completion moment parsed a narrative
verdict header (a level and a findings count) while the accounting it stood
for lived in the artifact's body — the orchestrator's parse trusted what it
did not count; a contract change landing while a launch was in flight had
no pinned rule for which output contract judges the return; and the
verifier's own discrimination (a probe that catches a seeded defect, a
correct sample that stays green) was assumed by role rather than tested by
a run.

The cure: the counted header at the return point. The verdict header
carries the per-disposition ledger counters and the calibration pointer;
the completion parse is header-only — the blocking table applies by parse
(zero clauses, or a blocking disposition under a clean verdict, is a parse
failure, never a body trust); the two-way counted reconciliation of
contract markers against ledger lines stays the verifier's own exit-check
over the frozen marker protocol; a return is judged by the output contract
pinned at the launch's dispatch (the pin lives in the dispatch brief or
roster row — the canon carries no dated literals); and a two-legged
known-answer calibration set (a seeded defect that must be caught; a
correct sample that must stay green) is run by the verifier before
judging — divergence on any leg disqualifies the run and escalates; the
receipt pointer rides the header.

Found in this corpus's verification-adequacy change program, cycle C2 (the
consumer cycle of the C1 accounting substrate); materialized into:
skills/verify-change/SKILL.md and skills/verify-change/assets/
verifier-charter.md (the Output block in the counted-header form, the
resolution-transcript duty, the calibration input line);
norms/dispatch-completion.md (the Verifier's completion-moment substring —
the header counter-parse and the dispatch-pinned contract clause);
README.md (the resynced output line).

## Reconcile records

Per the header rule (entries are never edited in place without a reconcile
record): this section carries one record per editing cycle.

- **Reconcile — the sweep cycle of this corpus's leak-removal change
  program.** Edited in place, by entry number: 11, 13, 14, 15, 17, 18, 19,
  20, 21, 22, 23, 24, 25, 26, 27, 29, 30, 32, 33, 34, 35, 36, 37, 38, 39, 40,
  41, 42, 43, 44, 48, 55, 56, 57, 58, 59 — 36 entries. Edit class:
  identifier generalization of the case domains — program, project and
  registry-item names, instance file paths, instance dates and instance
  record identifiers replaced by domain-class forms; each entry's norm, case
  mechanism, recurrence counts, round markers, corpus-internal pointers and
  quoted evidence kept (behavior-preserving). Renumbering act: the duplicate
  header "## 17." (the awk-empty-stdin entry, physically between entries 31
  and 32) renumbered "## 60." — entry ids unique 1..60, physical position
  unchanged. Reference sweep: the case-domain cross-reference citing the
  renumbered entry's recording form re-pointed to the new number
  ("per entry 60's form"); the remaining entry-number
  cross-references verified untouched. This record's enumerated entry set
  equals the diff-derived edited-entry set.

- **Reconcile — the RCA record of this corpus's leak-removal change
  program.** Appended, by entry number: 61 — one new case-law entry (the
  record-versus-run genus: a pin and every checker row enforcing it move
  together with what they pin; the mandatory class-history RCA materialized
  as a norm). Edit class: case-law growth at the reconcile stage; no
  in-place edits, no renumbering (entry ids remain unique 1..61), no
  reference sweep required (no existing entry or cross-reference touched).
  This record's enumerated entry set equals the diff-derived edited-entry
  set.

- **Reconcile — realize of this corpus's verification-adequacy change
  program, cycle C1.** Appended, by entry number: 62 — one new case-law
  entry (the verdict that narrates without counting; the derivation history
  of the per-clause accounting substrate). Edit class: case-law growth at
  the realize stage; no in-place edits, no renumbering (entry ids remain
  unique 1..62), no reference sweep required (no existing entry or
  cross-reference touched). This record's enumerated entry set equals the
  diff-derived edited-entry set.
- **Reconcile — realize of this corpus's verification-adequacy change
  program, cycle C2.** Appended, by entry number: 63 — one new case-law
  entry (the completion moment that trusted the body; the derivation
  history of the counted-header return contract). Edit class: case-law
  growth at the reconcile stage; no in-place edits, no renumbering (entry
  ids remain unique 1..63), no reference sweep required (no existing
  entry or cross-reference touched). This record's enumerated entry set
  equals the diff-derived edited-entry set.
