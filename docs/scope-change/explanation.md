# About scope-change

## The frame

### Why a whole stage before anything exists

The charter costs little; the shape it decides prices everything downstream.
Specification, audit and realization all scale with the structure chosen here:
a spec of *k* parts carries a surface of pairwise consistency questions that
grows quadratically with the number of parts, and an error reworked early in
the process costs an order of magnitude less than the same error reworked
late. The stage is therefore deliberately
cheap and deliberately early — it buys information at the point of the cycle
where information is cheapest, before any expensive commitment exists to
protect.

There is an obvious alternative: let each cycle find its own structure as it
goes, and fix shape mistakes where they surface. The stage refuses that
alternative. Deciding scope is not the same decision as sizing a batch of
work, and deferring the shape decision does not make it cheaper — it makes it
more expensive, because by then the shape is already embedded in
specification, tests and prose.

Sources:

- **Fagan 1976**, abstract: "Substantial net improvements in programming
  quality and productivity have been obtained through the use of formal
  inspections of design and of code"; body: "finding errors by inspection and
  reworking them earlier in the process reduces the overall rework time and
  increases productivity…"; figure caption: "ERROR REWORK AT THIS LEVEL IS
  1/10 AS EXPENSIVE."
- **Boehm 1988**, abstract: "An outline is given of the process steps involved
  in the spiral model, an evolving risk-driven approach that provides a
  framework for guiding the software process"; body: "The major distinguishing
  feature of the spiral model is that it creates a risk-driven approach to the
  software process rather than a primarily document-driven or code-driven
  process."
- **Reinertsen 2009**, chapter 1: "batch sizes have their own economic
  tradeoffs, which lead to U-curve optimization problems. Batch size reduction
  is a powerful technique…"; "…enable small batch processes by systematically
  lowering transaction costs"; "Today's orthodoxy constrains the scope of work
  and drives variability into timing. The new paradigm constrains timing and
  drives variability into the scope of work."

### Why the verdict is computed, and what halts it

A recurring decision — one whose kind arrives again and again — is
programmed: to the extent that a definite procedure has been laid out for
handling it, it is not treated de novo each time it occurs (Simon). The
calibration is the laid-out procedure: the collection of rules of procedure
that defines how the organization's parts relate, elicited from the owner
whose context no run-time reader shares. So the verdict on a change of a
familiar kind is computed — the profile's facts passed through the laid-out
rules — and the author, who already made these decisions when the procedure
was laid out, is not asked to make them a second time each launch. The halt
is for the other kind: a decision is non-programmed to the extent that it is
novel and unstructured and no cut-and-dried method exists for it — it hasn't
arisen before, or its precise nature and structure is elusive or complicated
(Simon). At that boundary the control of performance moves to a higher
conceptual level: rule-based control requires rules available from previous
encounters, and where none are available — the calibration silent,
ambiguous, or contradicted by the profiled facts — the performance becomes
goal-controlled and knowledge-based (Rasmussen). That is the escalation: the
change hands the undetermined case to the controller who reasons from
knowledge and context — and the answer routes back, so the procedure is laid
out for the next occurrence. The halt has a second form on the programmed
path itself: when the laid-out procedure, applied honestly, voids the change
— the filter excluding every allocated cycle — the verdict against the
change is the author's, not the machinery's. The verdict is computed where
the decision is programmed; the halt fires where it is not — and where the
programmed procedure's honest answer is that the change itself is void — and
the rule base grows by every answer.

Sources:

- **Simon 1960**: "Decisions are programmed to the extent that they are
  repetitive and routine, to the extent that a definite procedure has been
  laid out for handling them, so that they don't have to be treated de novo
  each time they occur"; "A decision is non-programmed to the extent that it
  is novel and unstructured and there is no cut and dried method of handling
  the problem because it hasn't arisen before, or because its precise nature
  and structure is elusive or complicated"; "To a large extent, these are
  highly programmable decisions. The collection of rules of procedure, the
  by-laws and constitutions that define the relations among the various parts
  of the organization".
- **Rasmussen 1983**: "At the next level of rule-based behavior, the
  composition of such a sequence of subroutines in a familiar work situation
  is typically controlled by a stored rule or procedure which may have been
  derived empirically during previous occasions, communicated from other
  persons' know-how as instruction or a cookbook recipe, or it may be
  prepared on occasion by conscious problem solving and planning"; "During
  unfamiliar situations, faced with an environment for which no know-how or
  rules for control are available from previous encounters, the control of
  performance must move to a higher conceptual level, in which performance
  is goal-controlled and knowledge-based."

### Why the stage keeps stopping

Three times, the machinery stops and asks a human — at the launch boundary
when the baseline is not green; a deferred option's trigger fired; or the
verdict path cannot land: the calibration cannot determine the change's
shape, applied honestly voids it, or a collapse that cannot pass its
checklist. All three are the same conviction
wearing different clothes: direction is the author's authority, mechanics
are the tools'. The corpus calls this the authoring gate and refuses to let
scope decisions pass as "process-determined" — and it binds each question to
the moment of decision rather than to a policy document, on Pfeffer–Sutton's
ground (2000): a rule not tied to a gate is not applied.

Sources:

- **Pfeffer–Sutton 2000**, body: "what gets measured gets done, and what is
  not measured tends to be ignored"; "measures have powerful effects on
  behavior even when they are not coupled with rewards"; "The problem of using
  talk as a substitute for action occurs in many organizations."

## The entry

### Why the calibration's completion is recorded, not re-derived

Whether the project is "calibrated" is not a question the launch answers by
looking around: an adjective has no communicable meaning until it is
expressed in operational terms of sampling, test, and criterion (Deming) —
the only communicable meaning of a word, a specification, an instruction is
the record of what happens on application of a specified operation or test.
So the meaning is carried by a record: the completion of the elicitation
leaves a flag, and the flag is what "calibrated" means here — a specified
test, a criterion for judgment, a decision yes or no, the object did or did
not meet the criterion. The stage's entry is a precondition in the strict
sense: the validity of what the stage produces depends on the values taken
by the variables before that program is initiated, and such initial
preconditions can be specified by the same type of general assertion as the
results (Hoare). The launch reads the assertion and initiates the stage only
where it holds — if the assertion P is true before initiation of a program
Q, then the assertion R will be true on its completion — and no record means
the precondition does not hold: `init-change`, the stage that establishes
the record, runs first.

Sources:

- **Deming 2000**, ch. 9: "The only communicable meaning of any word,
  prescription, instruction, specification, measure, attribute, regulation,
  law, system, edict is the record of what happens on application of a
  specified operation or test"; "An operational definition puts communicable
  meaning into a concept. Adjectives like good, reliable, uniform, round,
  tired, safe, unsafe, unemployed have no communicable meaning until they are
  expressed in operational terms of sampling, test, and criterion"; the
  decision rule: "Decision: yes or no, the object or the material did or did
  not meet the criterion (or criteria)".
- **Hoare 1969**, §3: "In many cases, the validity of the results of a program
  (or part of a program) will depend on the values taken by the variables
  before that program is initiated. These initial preconditions of successful
  use can be specified by the same type of general assertion as is used to
  describe the results obtained on termination"; "If the assertion P is true
  before initiation of a program Q, then the assertion R will be true on its
  completion."

### Why the baseline tree is selected and isolated

The change's baseline tree — the state the change builds on and the gates
measure — is selected at launch. The chain default is isolation: a change
starts from a clean committed state, and a dirty tree (someone else's
parallel work, uncommitted local edits) is not its base — it is isolated
into a worktree for the change's duration. The isolation is configuration
management's workspace doctrine (Estublier): "The workspace acts as a sphere
where the programmer can work, isolated from the outside world, for the task
duration. The SCM system is responsible for providing the right files (often
a configuration), in the right file system." — changes cross the workspace's
boundary only through change control. The cost of NOT isolating is the
deferred-integration risk (Fowler's feature branches: two streams not
integrating their work until they merge, the merge risk deferred and the
early detection prevented). The policy is the chain's default, not a cage:
the operator's launch directive overrides it — a worktree unconditionally, a
branch, a commit, or the current state accepted as-is into the change's base.
The chain itself holds one more override: a re-decomposition continues the
stopped cycle's own tree, its in-flight work included — the profiled facts
stand on the tree they were read from.

Sources:

- **Estublier 2000**: "The workspace acts as a sphere where the programmer
  can work, isolated from the outside world, for the task duration. The SCM
  system is responsible for providing the right files (often a
  configuration), in the right file system"; the practitioners' "number 1"
  most useful SCM feature: "change control, activity control, and workspace
  support."
- **Fowler 2020**, FeatureBranch: "two people, working on different feature
  branches, do not integrate their work until the second one merges their
  work into the common codebase"; "allows all the risk involved in a merge
  to be deferred until that point. However this isolation does prevent early
  detection of problems."
- **Fowler 2000**, Continuous Integration: "Continuous Integration is a
  software development practice where each member of a team merges their
  changes into a codebase together with their colleagues changes at least
  daily. Each of these integrations is verified by an automated build
  (including test) to detect integration errors as quickly as possible";
  the practices: "Everyone Pushes Commits To the Mainline Every Day".

### Why a red baseline is dispositioned, not auto-blocked

At the boundary stop the baseline may be red, and the stage is not auto-blocked
— the red is a measurement of the state, not a verdict on the change:
what the gates answered is whether the baseline conforms, and the question
the stage actually faces is whether the state is fit for this change's use.
Fitness is graded, not binary — a deficiency impairs it, it does not negate
it (Juran) — so a state with known failures may still be fit for this
change's purpose, and proceeding on it is a named rational mode: accepting
what meets the specified level, not the unattainable optimum (Simon's
satisficing). What is carried is then named and managed, not hidden:
proceeding on a not-fully-right state is going into debt — every minute spent
on not-quite-right code counts as interest, and the danger is the unrepaid
debt (Cunningham). The dispositions are the author's menu: fix the product
first — the assignable cause found and eliminated (Shewhart–Deming), revise
the gate script through `reconcile-change` when the script itself is the
defect, or accept the state as conditionally green; the chronic common-cause
red does not block the stage per-change. The skill encodes the menu; which
disposition fits is the author's reading of the cause.

Sources:

- **Juran & Godfrey 1999**, §4.21: "The great majority of products do conform
  to specifications. For the nonconforming products there arises a new
  question: Is the nonconforming product nevertheless fit for use?"; the
  deficiency definition: "Deficiency: Any fault (defect or error) that impairs
  a product's fitness for use."
- **Cunningham 1992**: "Shipping first time code is like going into debt";
  "every minute spent on not-quite-right code counts as interest on that
  debt"; "immature code may work fine and be completely acceptable to the
  customer"; "The danger occurs when the debt is not repaid."
- **Simon 1956**: "a 'satisficing' path, a path that will permit satisfaction
  at some specified level of all of its needs."
- **Shewhart 1931**: "Assignable causes of variation may be found and
  eliminated"; "to secure control, the manufacturer must seek to find and
  eliminate assignable causes."

## The profile

### Why a broad request buys a formation study first

A request can outrun the reading it needs: understanding it would mean
covering several thematic blocks of a territory no one has framed yet. The
stage then buys the frame before the profile: a timeboxed formation study
whose product — the claims and the topic table — seeds the profiling, so
that the profile reads a framed request instead of discovering the territory
mid-read. The grounding is the spiral's: a risk-driven approach to the
software process — information gathering before commitment (Boehm) — and the
profile is a commitment of reading effort; a broad request makes reading
without a frame the riskiest order. The study is a pathway option, not a
stage of the chain: information purchased at the cheapest point, before the
expensive pass begins.

Sources:

- **Boehm 1988**: "An outline is given of the process steps involved in the
  spiral model, an evolving risk-driven approach that provides a framework
  for guiding the software process"; "The major distinguishing feature of
  the spiral model is that it creates a risk-driven approach to the software
  process rather than a primarily document-driven or code-driven process."

### Why a stranger profiles

The Profiler arrives without the request author's context, and the mandate
makes the point load-bearing: the profile's ground is the surfaces' evidence,
not the request's framing. The choice extends to generation the independence
discipline the chain already applies to verification — the same reason audits
are run by an agent that did not write the spec. Whoever frames the request is
inside the problem; the profiler is placed outside it on purpose.

Sources:

- **Fagan 1976**, body: "To preserve objectivity and to increase the integrity
  of the inspection, it is usually advantageous to use a moderator from an
  unrelated project"; "a coder from some related or similar program will
  perform the role of the coder"; "another coder — preferably with testing
  experience — should fill the role of tester."

### Why the profile reads by strategy

Reading an unfamiliar codebase is not scanning; it is comprehension — the
building of mental representations of the software. The comprehension
research is specific about their order: the program model — a control-flow
abstraction built from the bottom up via beacons, the cues the code itself
carries — typically comes first, and the situation model follows it
(von Mayrhauser–Vans). So the profile reads in that order: the mechanical
structure first — what is touched, its size, its couplings — and then the
same places re-read against what the request wants of them. All models build
new knowledge from existing knowledge, and programmers employ strategies,
with cues in code or documentation as guidance (von Mayrhauser–Vans) — which
is why the strategy is written into the mandate instead of left to taste: the
profile is done when both representations exist, and a profile of only the
first is a structure listing, not ground.

Sources:

- **von Mayrhauser–Vans 1995**: "Comprehension develops two different mental
  representations: a program model and a situation model. The program model is
  usually developed before the situation model"; "when code is completely new
  to programmers, the first mental representation they build is a control-flow
  program abstraction called the program model. This representation, built
  from the bottom up via beacons, identifies elementary blocks of code control
  primes in the program"; "All models use existing knowledge to build new
  knowledge about the mental model of the software that is under
  consideration"; "Programmers employ various strategies and use cues in code
  or documentation as guidance."

### Why the structure is hypothesized, then checked

A structural claim about a codebase can be made two ways: by reasoning with a
high-level model, or by extracting from the source. The first fails in a
known way — engineers reason about existing systems through high-level
models, box-and-arrow sketches, and those models are almost always inaccurate
with respect to the system's source code (Murphy–Notkin–Sullivan); extraction
alone has no way to tell which of its million edges matter for this change.
The reflexion method binds the two: the engineer defines a high-level model
of interest, extracts a source model from the code, defines a mapping between
the two — and the computed reflexion model shows where the high-level model
does and does not agree with the source. The profile's structural work is
that loop: the import graph is not a given but a check — the hypothesis the
request and the docs suggest is mapped onto what the code actually connects,
and the disagreements (couplings the hypothesis missed, dependencies the docs
claimed) are profile findings, carried into the charter like any
other fact.

Sources:

- **Murphy–Notkin–Sullivan 1995**: "Software engineers often use high-level
  models (for instance, box and arrow sketches) to reason and communicate
  about an existing software system. One problem with high-level models is
  that they are almost always inaccurate with respect to the system's source
  code"; "The engineer defines a high-level model of interest, extracts a
  source model (such as a call graph or an inheritance hierarchy) from the
  source code, and defines a declarative mapping between the two models. A
  software reflexion model is then computed to determine where the engineer's
  high-level model does and does not agree with the source model."

### Why the profile recovers the design

Before a change touches anything, the profile does examination: analyzing the
subject system to identify its components and interrelationships and create
representations of it at a higher level of abstraction — and by definition it
changes nothing; it is a process of examination, not a process of change or
replication (Chikofsky–Cross). Examination has two depths. One is
redocumentation — the creation of a semantically equivalent representation
within the same relative abstraction level: the code, restated. The other is
design recovery, whose standard is far heavier: it must reproduce all of the
information required for a person to fully understand what a program does,
how it does it, why it does it (Chikofsky–Cross). The charter's profile is
held to the second depth, because its consumers plan a change on top of the
why-level — the design the code carries — and a profile that only restates
the structure at the code's own level has not been a profile; it has been
redocumentation.

Sources:

- **Chikofsky–Cross 1990**: "Reverse engineering is the process of analyzing a
  subject system to identify the system's components and their
  interrelationships and create representations of the system in another form
  or at a higher level of abstraction"; "Reverse engineering in and of itself
  does not involve changing the subject system. It is a process of
  examination, not a process of change or replication"; design recovery
  "must reproduce all of the information required for a person to fully
  understand what a program does, how it does it, why it does it, and so
  forth"; redocumentation: "the creation or revision of a semantically
  equivalent representation within the same relative abstraction level".

### Why the dimensions carry their measures

A dimension that carries no measure degrades into an adjective — "high
coupling" that no two readers would grade alike. So the profile's dimensions
are recorded with their measures: size by run-pinned counts, risk by the
instance's ledger-borne recurrent prior, blast-radius by its traced
discipline. Coupling is the older of the remaining pair: it is a
measure of the strength of interconnection — "highly coupled" modules joined
by strong interconnections, "loosely coupled" by weak, "uncoupled" by none —
and it earns its place in the profile because total systems cost will be
strongly influenced by the degree of coupling between modules
(Yourdon–Constantine). DDD-tier is the newer: it grades how the code carries
its domain model, and the doctrine gives the rubric — a model applies inside
an explicitly defined bounded context, and its value is a versatile, shared
language (Evans). The tier grades the code against that rubric: how far the
model applies inside its explicit boundaries, and how shared its language
actually is. The measures are what make the profile comparable across cycles:
the same words grade the same things.

Sources:

- **Yourdon–Constantine 1978**: "The measure that we are seeking is known as
  coupling; it is a measure of the strength of interconnection. Thus, "highly
  coupled" modules are joined by strong interconnections; "loosely coupled"
  modules are joined by weak interconnections; "uncoupled" or "decoupled"
  modules have no interconnections"; "Clearly, total systems cost will be
  strongly influenced by the degree of coupling between modules."
- **Evans 2003**: "By explicitly defining a BOUNDED CONTEXT within which a
  model applies and then, when necessary, defining its relationship with other
  contexts, the modeler can avoid bastardizing the model"; "To create a
  supple, knowledge-rich design calls for a versatile, shared team language".

### Why blast radius is traced, not guessed

The blast-radius dimension answers the question every change plans against:
what will this modification touch beyond the places named in the request.
The discipline for that question is impact analysis — identifying the
consequences or ripple-effects of proposed software changes, or estimating
what needs to be modified to accomplish the change (Bohner; Lehnert, quoting
Bohner–Arnold) — and it is integral to release planning and maintenance,
which is exactly where the profile stands. Its hardest lesson is the Year
2000: extending the date fields looked like a small change, and it turned out
there were many variables associated with "date" that may not be readily
apparent — age, appointment, date-timetag (Bohner). The carriers of a changed
thing hide under other names. That is why the profile's blast radius is
traced — consequences followed from the changed places, including the
fixtures, literals, and oddly-named fields that consume them — and not
guessed from the request's framing: the framing names the intent; the trace
names the blast.

Sources:

- **Bohner 1996**: "Impact analysis identifies the consequences or
  ripple-effects of proposed software changes"; "Impact analysis is integral
  to software release planning and the software maintenance process"; the
  Y2K lesson: "there are many variables associated with "date" that may not be
  readily apparent (e.g., age, appointment, date-timetag)".
- **Lehnert 2011**: the working definition, quoting Bohner–Arnold: "Identifying
  the potential consequences of a change, or estimating what needs to be
  modified to accomplish a change".

### Why the charter's claims are pinned by runs

A number in the charter is a measurement: numbers assigned to attributes of
entities according to clearly defined rules (Fenton–Bieman) — and the rule
is the run. There is no true value to copy: there is no true value for the
number of defective items in a given lot, and the result obtained depends on
the method used by the experimenter (Deming) — so a count transcribed from
an input artifact or recalled from memory pins nothing; the count exists
where the operation exists, as a run (grep, wc, git diff) executed over the
codebase before the charter is fixed. Nor is an inventory an enumeration:
completeness is recall — the fraction of relevant documents that are
retrieved (Manning–Raghavan–Schütze) — and the carriers of a pin may differ
from the spelling at hand by nothing but case, which is exactly what
case-folding exists to let match (Manning–Raghavan–Schütze); so the
byte-pin inventory is a case-complete run over the tracked files, not a list
of known places. The instrument is the developer's own: programmers search for code
very frequently, and the mechanisms have grown from "grep"-like tools
(Sadowski). A number without its run is an assignment without rules — not a
measurement, and not a charter claim.

Sources:

- **Fenton–Bieman 2015**: "Measurement is the process by which numbers or
  symbols are assigned to attributes of entities in the real world in such a
  way so as to describe them according to clearly defined rules. Thus,
  measurement captures information about attributes of entities."
- **Deming 2000**, ch. 9: "There is thus no true value for the number of
  defective items in a given lot, and no true value for the process average";
  "It comes as astonishment to most people that there is no true value for the
  speed of light. The result obtained for the speed of light depends on the
  method used by the experimenter (microwave, interferometer, geodimeter,
  molecular spectra)."
- **Manning–Raghavan–Schütze 2008**: "Recall (R) is the fraction of relevant
  documents that are retrieved"; the case leg: "A common strategy is to do
  case-folding by reducing all letters to lower case. Often this is a good
  idea: it will allow instances of Automobile at the beginning of a sentence
  to match with a query of automobile."
- **Sadowski et al. 2015**: "Our results indicate that programmers search for
  code very frequently, conducting an average of five search sessions with 12
  total queries each workday"; "The search mechanisms have evolved since that
  report, from "grep"-like tools to specialized and more efficient code
  search engines".

### Why the profile names the authority of checking

Nothing checks itself. Distinguishing the desired, correct behaviour of a
changed system from incorrect behavior is a named problem — the test oracle
problem — and its instrument is the oracle: a predicate that determines
whether a given behavior is acceptable (Barr). A change without a named
oracle has no such predicate; its errors surface where they choose, not
where the process looks. And the grounds of checking differ in kind:
verification asks "Am I building the product right?", validation asks "Am I
building the right product?" (Boehm) — a tool answers the first; only the
second's authority can say whether the change serves its mission. The
grounds also grade — an oracle may be derived from a previous version of the
system, or implicit in the detection of obvious faults like a crash (Barr) —
so authority is not a binary tool/human but a named choice among kinds.
Naming it is itself the validation act Boehm places at the beginning of the
software definition process: determining the fitness or worth of a software
product for its operational mission. The profile names the authority because
the determination is due exactly there — and leaving it unnamed leaves the
change's correctness to whoever happens to look.

Sources:

- **Barr et al. 2015**: "the challenge of distinguishing the corresponding
  desired, correct behaviour from potentially incorrect behavior is called the
  "test oracle problem""; "A test oracle is a predicate that determines
  whether a given test activity sequence is an acceptable behaviour of the SUT
  or not"; the taxonomy's depth: "Derived test oracles (see Section 5) involve
  artefacts from which a test oracle may be derived — for instance, a previous
  version of the system"; "An implicit oracle (see Section 6) refers to the
  detection of "obvious" faults such as a program crash."
- **Boehm 1984**: "Verification. "Am I building the product right?"
  Validation. "Am I building the right product?""; the validation extension:
  "we extend the definition of "validation" to include a missing activity at
  the beginning of the software definition process: determining the fitness
  or worth of a software product for its operational mission".

### Why the authority calibrates the chain's depth

The named authority decides who catches the executor's errors, and the two
regimes catch differently. Where the checking is built into the machine, the
machine does the catching: without a built-in automatic checking system,
mass production of defective products cannot be prevented — and with it, the
machine stops itself; Toyota calls this autonomation, machines that prevent
problems autonomously, over simple automation (Ohno). The tool-authoritative
change leans there: its integrations are verified by an automated build that
detects integration errors as quickly as possible (Fowler) — so the work
accumulates and the machine, not a committee, is the gate; the chain's depth
stays light, because more depth would be redundant with the machine. Where
no built-in check exists, the pile-up is the alternative — and the depth
must rise to meet it: the spec becomes a contract, the audit adversarial.
But the boundary between the regimes is probed, not assumed: even where the
correctness of an individual output cannot be determined, relations among
the expected outputs of multiple related inputs may still verify —
metamorphic testing alleviates the oracle problem (Chen); the human
authority is declared only after the derived grounds are searched. And the
depth is set at the profile because that is where the leverage lives:
finding and fixing problems early saves up to 100:1 in large projects,
4-6:1 in small ones — early investment in V&V activities (Boehm).

Sources:

- **Ohno 1988**: "With an automated machine of this type, mass production of
  defective products cannot be prevented. There is no built-in automatic
  checking system against such mishaps"; "This is why Toyota emphasizes
  autonomation - machines that can prevent such problems "autonomously" - over
  simple automation."
- **Fowler 2000**, Continuous Integration: "Continuous Integration is a
  software development practice where each member of a team merges their
  changes into a codebase together with their colleagues changes at least
  daily. Each of these integrations is verified by an automated build
  (including test) to detect integration errors as quickly as possible".
- **Chen et al. 2018**: "Even if we cannot determine the correctness of the
  actual output for an individual input, it may still be possible to use
  relations among the expected outputs of multiple related inputs (and the
  inputs themselves) to help"; "MT therefore alleviates the oracle problem in
  testing."
- **Boehm 1984**: "savings of up to 100:1 are possible by finding and
  fixing problems early in the life cycle. For smaller projects, the savings
  are more on the order of 4-6:1, but this still provides a great deal of
  leverage for early investment in V&V activities."

## The structure and the verdict

### Why surfaces beyond code

A change is never code alone. Docs, tests and configurations couple silently:
two sets of files can be import-disjoint and still inseparable — because one
doc describes both, or one fixture feeds both; the models overlap and their
assertions fall out of joint (Spanoudakis–Zisman). The stage's dependency
matrix runs across all touched surfaces — the system's several views, each
addressing one specific set of concerns (Kruchten) — precisely so that such
couplings surface as
structure: parts coupled on any surface become a coupled block; the conflict
case — code-disjoint parts coupled on a doc, test or config surface —
demands an answer: separate cycles landing together, or one cycle; and the
same resolution, the corpus's terms extended, covers a code-coupled block
standing alone. The theory
behind the answer is Simon's near-decomposability: a hierarchic system's
subsystems interact weakly — weak, but not negligible — and each component
depends on the behavior of the others only in an aggregate way. Malone–Crowston
make that dependence workable: coordination is managing dependencies between
activities, and characterizing the kind of dependency identifies the
coordination process that manages it.

Sources:

- **Simon 1962**: "In hierarchic systems, we can distinguish between the
  interactions among subsystems, on the one hand, and the interactions within
  subsystems — i.e., among the parts of those subsystems — on the other"; "in
  a nearly decomposable system, the short-run behavior of each of the
  component subsystems is approximately independent of the short-run behavior
  of the other components… in the long run, the behavior of any one of the
  components depends in only an aggregate way on the behavior of the other
  components"; "…the interactions among the subsystems are weak, but not
  negligible."
- **Malone–Crowston 1994**, abstract: "coordination can be seen as the process
  of managing dependencies among activities. Further progress, therefore,
  should be possible by characterizing different kinds of dependencies and
  identifying the coordination processes that can be used to manage them";
  body: "Coordination is managing dependencies between activities";
  "Interdependencies between activities can be of (at least) three kinds:
  (a) pooled… (b) sequential…"; "standardization… direct supervision…
  mutual adjustment…"
- **Kruchten 1995**, abstract: "This use of multiple views allows to address
  separately the concerns of the various stakeholders"; body: "To describe a
  software architecture, we use a model composed of multiple views or
  perspectives"; "several concurrent views, each one addressing one specific
  set of concerns".
- **Spanoudakis–Zisman 2001**, abstract: "Inconsistencies arise because the
  models overlap — that is they incorporate elements which refer to common
  aspects of the system under development — and make assertions about these
  aspects which are not jointly satisfiable as they stand, or under certain
  conditions"; body: "the detection of overlaps between software models, the
  detection of inconsistencies between software models, the diagnosis of
  inconsistencies, the handling of inconsistencies…"

### Why the structure is a partitioned matrix

Systems design is the determination of interdependent variables — and the
change's parts are such variables: each depends on others, and the precedence
ordering of determining them involves circuits. The dependency matrix exists
because circuits break the ordinary plan: conventional planning techniques,
such as critical path, do not deal with these problems — and circuits are
exactly the places where the tasks cannot be put into an order (Steward).
So the structure is not listed; it is partitioned: the matrix is reordered
so its marks fall below the diagonal or within square blocks on it. The
reading is then direct — off the diagonal blocks, parts determined one at a
time, in sequence; on the diagonal, the smallest sets of parts that
must be determined jointly, each depending on all the others in the block —
the coupled blocks of the charter. Where the joint determination cannot
wait, the marks above the diagonal show where estimates are required to
start the iteration — the places the change must guess first. And the
matrix carries the change's consequences: the same information flow
determines what a change in any part does to the rest — which engineers
must be informed and which documents must be changed (Steward) — the
doctrine the profile's blast-radius dimension executes by impact analysis.

Sources:

- **Steward 1981**: "Systems design involves the determination of
  interdependent variables. Thus the precedence ordering for the tasks of
  determining these variables involves circuits. Circuits require planning
  decisions about how to iterate and where to use estimates. Conventional
  planning techniques, such as critical path, do not deal with these
  problems"; "If the variables could be reordered so that the matrix is lower
  triangular, i.e., all marks are either on or below the diagonal, then
  proceeding in this order, the variables could be determined one at a time.
  As each variable is determined, all its required predecessors would be to
  the left of the diagonal and thus already known"; "by a process known as
  partitioning, the variables can be reordered so as to confine the marks in
  the matrix to appear either below the diagonal or within square blocks on
  the diagonal"; "The blocks on the diagonal represent the smallest sets of
  variables that must be determined jointly, i.e., the variables within the
  block each depend upon all the other variables in the same block and,
  therefore, cannot be determined one at a time without making estimates";
  "the marks above the diagonal show where estimates are required to start
  an iteration"; "This information flow can be used to determine the
  consequences of a change in any variable on the rest of the variables in
  the system, and thus which engineers must be informed and which documents
  must be changed."

### Why a program decomposes by seams

A program's units are not the call graph's. The boundaries that matter are
the seams along which design decisions hide: begin with the decisions that
are difficult or likely to change, and design each module to hide such a
decision from the others (Parnas) — a change localizes exactly there, so the
units of work are the modules that guard the decision the change alters.
The partitioned matrix then says in what order the seam-guarding modules can
be determined; the seams say where the cut falls.

Sources:

- **Parnas 1972**, conclusion, p. 1058: "We propose instead that one begins
  with a list of difficult design decisions or design decisions which are
  likely to change. Each module is then designed to hide such a decision
  from the others."

### Why three axes, and why they are independent

The verdict separates work-unit, verify-unit and land-unit — three decisions,
not one. The design refuses the tempting collapse of deriving work granularity
from land semantics ("it all lands together, so it is all one task"): that
degeneration turns a design question into merge logistics, and it is the first
thing the stage's Collapse-checklist polices.

Sources:

- **Dijkstra 1974**, body (EWD447): "But nothing is gained — on the contrary!
  — by tackling these various aspects simultaneously. It is what I sometimes
  have called "the separation of concerns", which, even if not perfectly
  possible, is yet the only available technique for effective ordering of
  one's thoughts, that I know of."
- **Hodgson 2017**: "separating [feature] release from [code] deployment";
  "Release Toggles allow incomplete and un-tested codepaths to be shipped to
  production as latent code"; "They allow in-progress features to be checked
  into a shared integration branch (e.g. master or trunk)".
- **Reinertsen 2009**, chapter 1: "Today's orthodoxy constrains the scope of
  work and drives variability into timing. The new paradigm constrains timing
  and drives variability into the scope of work."

### Why the checklist names its sources

Every item of the Collapse-checklist carries a named methodological source —
Reinertsen for batch-size and cost, Keeney for the values-frame, Fagan for the
cost of late errors, Porter–Votta–Basili for perspective reading, Simon and
Malone–Crowston for coordination, Baldwin–Clark for design rules,
Shewhart–Deming for control bounds — the AMPL item's prior-cycle amplitude
entering the cost estimate as bounds enter a prediction — Pfeffer–Sutton for
the gate. This is the
corpus's single-source censoring: a checklist item may not claim more than its
source grounds. The alternative — free-floating heuristics — would make the
checklist unimprovable, because nothing could be checked against anything.

Sources:

- **Reinertsen 2009**, chapter 1: "batch sizes have their own economic
  tradeoffs, which lead to U-curve optimization problems. Batch size reduction
  is a powerful technique…"; "Today's orthodoxy constrains the scope of work
  and drives variability into timing. The new paradigm constrains timing and
  drives variability into the scope of work."
- **Keeney 1992**, p. 3: "values should be the driving force for our
  decisionmaking."
- **Fagan 1976**, body: "finding errors by inspection and reworking them
  earlier in the process reduces the overall rework time and increases
  productivity…"
- **Porter–Votta–Basili 1995**, abstract: "the Scenario method had a higher
  fault detection rate than either Ad Hoc or Checklist methods…"
- **Simon 1962**: "in a nearly decomposable system, the short-run behavior of
  each of the component subsystems is approximately independent of the
  short-run behavior of the other components… in the long run, the behavior of
  any one of the components depends in only an aggregate way on the behavior
  of the other components."
- **Malone–Crowston 1994**, body: "Coordination is managing dependencies
  between activities."
- **Baldwin–Clark 2000**: "These units "look to" visible information conveyed
  in the form of design rules. But they also incorporate hidden-design
  parameters, which may be chosen independently of other modules as long as
  the design rules are obeyed."
- **Shewhart 1931**: "a phenomenon will be said to be controlled when, through
  the use of past experience, we can predict, at least within limits, how the
  phenomenon may be expected to vary in the future"; "Assignable causes of
  variation may be found and eliminated."
- **Pfeffer–Sutton 2000**, body: "what gets measured gets done, and what is
  not measured tends to be ignored."

## The charter

### Why the necessity outcomes derive from values

The necessity filter is value-focused, not alternative-focused: value-focused
thinking consists of first deciding what you want and then figuring out how
to get it, while the more usual approach figures out what alternatives are
available and chooses the best of the lot (Keeney). A menu of cycles for the
author to pick from is the second way — there, the alternatives choose the
work. The filter is the first way: the project's values are fixed once in
the calibration, and each allocated cycle is evaluated against them — kept
when it is fit for the change's purpose (Juran's fitness question, asked per
cycle), held as an option when its value lives in the future
(Dixit–Pindyck: the option-like characteristics of investment
opportunities), dropped when the values do not want it. The outcomes are
derived; the menu is alternative-focused thinking wearing the filter's
clothes — and the charter refuses it in so many words: methodology-derived,
not a user menu.

Sources:

- **Keeney 1992**: "Value-focused thinking essentially consists of two
  activities: first deciding what you want and then figuring out how to get
  it. In the more usual approach, which I refer to as alternative-focused
  thinking, you first figure out what alternatives are available and then
  choose the best of the lot."
- **Juran 1999**: the DO question: "Is the nonconforming product
  nevertheless fit for use?"
- **Dixit–Pindyck 1994**: the DEFER outcome: "emphasizing the
  option-like characteristics of investment opportunities".

### Why knowledge comes before the charter is fixed

The knowledge-gap registry is the stage's admission that profiling itself can
be wrong-footed by what nobody has read yet. A gap with blocking potential, or
one whose recurrence the instance has already measured, buys a spike — a
timeboxed study — before the charter is fixed. The grounding is Lempert's
robust decision making: reduce the decision's vulnerability to deep
uncertainty. The spike is deliberately a pathway option and not a stage
of the chain: it is information purchased at the cheapest point, not a
pipeline step that could accumulate.

Sources:

- **Lempert–Popper–Bankes 2003**, body: "decisionmaking under conditions of
  deep uncertainty — that is, where analysts do not know, or the parties to a
  decision cannot agree on, (1) the appropriate conceptual models… (2) the
  probability distributions used to represent uncertainty… and/or (3) how to
  value the desirability of alternative outcomes"; "An argument that is
  insensitive to significant variation in its underlying assumptions is said
  to be robust. In this sense, a strategy should be considered robust if it
  performs reasonably well compared to the alternatives across a wide range of
  plausible futures."

### Why the anchors are checked by another's eyes

Every anchor in the charter is a traceability link: the ability to describe
and follow the life of a claim — forwards, from the charter into the code,
and backwards, from the code to the claim that cites it
(Gotel–Finkelstein). The doctrine of such links is sobering: their support
is measured by the extent to which they are maintained under ongoing change
— and a link that no longer holds misleads everyone who follows it. Who
checks the links? Not the hand that wrote them. A programmer who sees the
program as an extension of his own ego is not going to be trying to find
the errors in it — he is proving it correct, overlooking errors monstrous
to another eye; the eye has an almost infinite capacity for not seeing what
it does not want to see (Weinberg). The charter's anchors are transcribed
by the very hand whose judgment they confirm — so they are checked by
another's eyes, eyes specialized in other people's work. And the checking
is a defined procedure, not a virtue: objectivity and integrity come from
the unrelated reader, as inspection practice prescribes (Fagan). The check
is a loop with a bound: a drifted or unsupported anchor is re-anchored once
and re-judged by a fresh reader; a claim whose second judgment fails dies
with its reason in the charter's registry — support is what is maintained
under ongoing change, and a link that cannot hold is a claim the charter
does not make (Gotel–Finkelstein). Finally,
the check is bound to the pass point — the charter parses only when its
verification is recorded — because what gets measured gets done, and what
is not measured tends to be ignored (Pfeffer–Sutton).

Sources:

- **Gotel–Finkelstein 1994**: "Requirements traceability refers to the ability
  to describe and follow the life of a requirement, in both a forwards and
  backwards direction"; the support doctrine: "the extent to which they can
  maintain RT when faced with ongoing changes to requirements".
- **Weinberg 1971**: "A programmer who truly sees his program as an extension
  of his own ego is not going to be trying to find all the errors in that
  program. On the contrary, he is going to be trying to prove that the
  program is correct—even if this means the oversight of errors which are
  monstrous to another eye"; "the human eye has an almost infinite capacity
  for not seeing what it does not want to see. People who have specialized
  in debugging other people's programs can verify".
- **Fagan 1976**: "To preserve objectivity and to increase the integrity of
  the inspection, it is usually advantageous to use a moderator from an
  unrelated project".
- **Pfeffer–Sutton 2000**: "what gets measured gets done, and what is not
  measured tends to be ignored".

### Why the charter is done when it parses

The launch is a contract between the orchestrator and the Profiler: each
party expects some benefits from the contract and is prepared to incur some
obligations to obtain them, and the benefits and obligations are documented
in a contract document (Meyer) — here, the mandate's Output contract. The
dispatch inputs are the precondition — requirements that any call must
satisfy if it is to be correct; the charter is the postcondition —
properties ensured in return by the execution of the call (Meyer). The
properties are documented before the call, not decided at its end: the parse
rule is the mandate's, and the charter is done when the file at the passed
path parses into the `decomposition:` block. The symmetry is Hoare's: the
same assertion doctrine that reads P before initiation reads R on
completion — completion is judged by a stated assertion of the same kind as
the results. A charter missing a required field, or with a pin diverging
from the re-run, is a runtime violation of an assertion — not a special case
but the manifestation of a software bug (Meyer): a postcondition violation
is a bug in the supplier, the routine failed to deliver on its promises —
and the launch stays incomplete until the same agent delivers.

Sources:

- **Meyer 1992**: "Each party expects some benefits from the contract and is
  prepared to incur some obligations to obtain them. These benefits and
  obligations are documented in a contract document"; "The precondition
  expresses requirements that any call must satisfy if it is to be correct;
  the postcondition expresses properties that are ensured in return by the
  execution of the call"; "any runtime violation of an assertion is not a
  special case but always the manifestation of a software bug"; "A
  postcondition violation is a bug in the supplier (routine). The routine
  failed to deliver on its promises."
- **Hoare 1969**, §3: "If the assertion P is true before initiation of a
  program Q, then the assertion R will be true on its completion."

## The registry of deferred options

### Why deferred options are armed with triggers and expire

A deferred cycle is not a note to self; it is an investment opportunity with
option-like characteristics (Dixit–Pindyck): the work is irreversible, the
alternative to doing it now is doing it later, and under uncertainty the
waiting itself has value. But an option pays only across a threshold —
exercise becomes optimal only when the value rises sufficiently above the
exercise price, past a critical threshold value — and below that threshold
exercising is not yet optimal, whatever the immediate return. So the option
waits, and what keeps the wait alive is the threshold stated in advance: the
trigger predicate, matched against the launch's input facts. The wiring
is the point: what gets measured gets done, and what is not measured tends to
be ignored (Pfeffer–Sutton) — an option that no point of the process
re-examines is an ignored option, not a patient one. And the wait is bounded:
there are situations in which a firm cannot wait, or cannot wait very long —
the window closes, and the less time there is to delay, the less the option
matters. Expiry is the same economics in the registry: an option whose trigger
never fires within its window has outlived what an option is, and the revision
point retires it — that is the window closing, not a verdict on the work. The
window is indifferent to the cause of the silence: a need that never came and
a firing the matching missed end at the same revision-point re-decision.

Sources:

- **Dixit–Pindyck 1994**, preface: "In this book we develop the basic theory of
  irreversible investment under uncertainty, emphasizing the option-like
  characteristics of investment opportunities. We show how optimal investment
  rules can be obtained from methods that have been developed for pricing
  options in financial markets"; the exercise threshold: "Only when the value
  of the asset rises sufficiently above the exercise price—the option is
  sufficiently 'deep in the money'—does its exercise become optimal"; "It must
  equal or exceed a critical or threshold value q*, which itself exceeds unity,
  before investment becomes optimal"; the finite window: "There are, of course,
  situations in which a firm cannot wait, or cannot wait very long, to invest.
  (One example is the anticipated entry of a competitor into a market that is
  only large enough for one firm. Another example is a patent or mineral
  resource lease that is about to expire.) The less time there is to delay, and
  the greater the cost of delaying, the less will irreversibility affect the
  investment decision"; "Two things are needed to introduce an opportunity cost
  into the NPV calculation—irreversibility, and the ability to invest in the
  future as an alternative to investing today."
- **Pfeffer–Sutton 2000**: "what gets measured gets done, and what is not
  measured tends to be ignored"; "measures have powerful effects on behavior
  even when they are not coupled with rewards".

### Why the registry is reached only through its operations

The Profiler's registry is an abstract data type in the strict sense: a
class of objects completely characterized by the operations available on
them, and the type is defined by defining the characterizing operations
(Liskov–Zilles) — this stage defines it by six: check the freshness, repair a
stale index by re-minting it, guard the expiry, emit the matching scope,
record the adjudication, write the
deferred item. Implementation information, such as how the object is
represented in storage, is only needed when defining how the characterizing
operations are to be implemented, and the user of the object is not
required to know or supply it (Liskov–Zilles): the mandate reaches the
registry only by its verbs; the carrier's path may travel in the dispatch,
but the carrier is never read at this stage — no reading of it can attach
the Profiler to a
representation. The hiding is the module's design decision, and its
interface was chosen to reveal as little as possible about its inner
workings (Parnas). The one derived surface, the live index, is reached as
what it is: condition evaluation stands on materialization of derived data
(McCarthy–Dayal), and the materialization is re-minted and verified —
derived must equal committed — before any scope is emitted. The operations
are the whole of the registry's reality for this stage.

Sources:

- **Liskov–Zilles 1974**: "An abstract data type defines a class of abstract
  objects which is completely characterized by the operations available on
  those objects. This means that an abstract data type can be defined by
  defining the characterizing operations for that type"; "Implementation
  information, such as how the object is represented in storage, is only
  needed when defining how the characterizing operations are to be
  implemented. The user of the object is not required to know or supply this
  information."
- **Parnas 1972**, p. 1056: "Every module in the second decomposition is
  characterized by its knowledge of a design decision which it hides from all
  others. Its interface or definition was chosen to reveal as little as
  possible about its inner workings."
- **McCarthy–Dayal 1989**: condition evaluation "using techniques such as
  multiple query optimization, incremental evaluation, and materialization of
  derived data".

### Why a firing is an alert, not an execution

The registry's rules are Event-Condition-Action rules, and the chain keeps the
canon's semantics verbatim: when the event occurs (is signalled), evaluate the
condition; and, if the condition is satisfied, execute the action
(McCarthy–Dayal). The action is executed automatically — a firing leaves the
Profiler no discretion. But the canon itself bounds what that action can be:
alerters are named among the rule forms the model expresses, and the action's
reach is database operations or external requests to application programs.
Every rule of the registry carries the same one: an external request to the
authoring point — the halt and the question "execute the option?" — the
coupling the canon calls immediate: when the event occurs, the condition is
evaluated immediately, preempting the processing of the remaining steps
(McCarthy–Dayal). What no rule
carries is the option's execution itself: exercise is not a rule's output but
a decision, one that becomes optimal only when the value has risen
sufficiently above the exercise price (Dixit–Pindyck) — and a rule that
executed the option on firing would collapse that decision into machinery
whose conditions are prose predicates judged by a reader. So the alert is the
whole of a rule's power, and the
execution stays where the option's economics puts it: with the holder. The
restriction goes beyond the canon's letter — the canon allows more; the
authoring gate takes less.

Sources:

- **McCarthy–Dayal 1989**: "The semantics of ECA rules are straightforward when
  the event occurs (is signalled), evaluate the condition; and, if the
  condition is satisfied, execute the action"; the rule forms: "Integrity
  constraints, access constraints, derived data, alerters, and other active
  DBMS features can all be expressed as ECA rules"; the action's reach: "The
  action is a sequence of operations. These can be database operations or
  external requests to application programs"; the coupling: "immediate: when
  the triggering event occurs, evaluate the condition immediately (i.e.,
  preempt the processing of the remaining steps of the transaction) in the same
  transaction."
- **Dixit–Pindyck 1994**: the exercise is a decision: "Only when the
  value of the asset rises sufficiently above the exercise price—the option is
  sufficiently 'deep in the money'—does its exercise become optimal."

## The return

### Why the stage can be re-entered

A structure proven wrong mid-cycle is not a failure of the stage but its
second entrance: the re-decomposition return takes the closed cycle's carriers
as inputs and revises the shape over the profiled facts. The grounds are
Baldwin–Clark's — a change of design rules re-opens the division of
labor — and Shewhart–Deming's control-bounds doctrine: a signal outside the bounds is
an intervention in the process, and the audit loop's N bound is exactly such
a signal, routing structure errors back here instead of letting them be
papered over downstream.

Sources:

- **Baldwin–Clark 2000**: "The design rules support an efficient and flexible
  task structure, in which "parts" of the design are worked on independently
  and in parallel with one another. Independent, parallel efforts are possible
  because the design rules address all the implicit interdependencies of the
  artifact"; "These units "look to" visible information conveyed in the form
  of design rules. But they also incorporate hidden-design parameters, which
  may be chosen independently of other modules as long as the design rules are
  obeyed."
- **Shewhart 1931**: "a phenomenon will be said to be controlled when, through
  the use of past experience, we can predict, at least within limits, how the
  phenomenon may be expected to vary in the future"; "Assignable causes of
  variation may be found and eliminated"; "to secure control, the manufacturer
  must seek to find and eliminate assignable causes."

## What the stage is, in one sentence

Scope-change is where the chain converts an intent into a shape while every
expensive commitment is still in the future — cheaply, by a stranger, across
all surfaces, the shape computed from the project's calibration and the
author stopped at the three named questions of direction, and re-openable
when reality disagrees with the charter.

## Reference

- Baldwin, C. Y., Clark, K. B. (2000). *Design Rules, Volume 1: The Power of
  Modularity*. MIT Press.
- Barr, E. T., Harman, M., McMinn, P., Shahbaz, M., Yoo, S. (2015). The oracle
  problem in software testing: A survey. *IEEE Transactions on Software
  Engineering*, 41(5), 507–525.
- Boehm, B. W. (1984). Verifying and validating software requirements and
  design specifications. *IEEE Software*, 1(1), 75–88.
- Boehm, B. W. (1988). A spiral model of software development and enhancement.
  *IEEE Computer*, 21(5), 61–72.
- Bohner, S. A. (1996). Impact analysis in the software change process: A year
  2000 perspective. *Proceedings of the International Conference on Software
  Maintenance (ICSM '96)*, 42–51. IEEE Computer Society.
- Chen, T. Y. (2018). Metamorphic testing: A review of challenges and
  opportunities. *ACM Computing Surveys*, 51(1), 4:1–4:27.
- Chikofsky, E. J., Cross, J. H. (1990). Reverse engineering and design
  recovery: A taxonomy. *IEEE Software*, 7(1), 13–17.
- Cunningham, W. (1992). The WyCash portfolio management system. *OOPSLA '92
  Addendum*; text — c2.com/doc/oopsla92.html.
- Deming, W. E. (2000). *Out of the Crisis*. MIT Press.
- Dixit, A. K., Pindyck, R. S. (1994). *Investment under Uncertainty*. Princeton
  University Press.
- Dijkstra, E. W. (1974). On the role of scientific thought (EWD447). In
  *Selected Writings on Computing: A Personal Perspective* (pp. 60–66).
  Springer-Verlag; text — E. W. Dijkstra Archive, University of Texas at Austin.
- Estublier, J. (2000). Software configuration management: a roadmap. *The
  Future of Software Engineering* (ICSE 2000), 279–289. ACM Press; text — the
  UCL mirror (cs.ucl.ac.uk).
- Evans, E. (2003). *Domain-Driven Design: Tackling Complexity in the Heart of
  Software*. Addison-Wesley.
- Fagan, M. E. (1976). Design and code inspections to reduce errors in program
  development. *IBM Systems Journal*, 15(3), 182–211.
- Fenton, N. E., Bieman, J. (2015). *Software Metrics: A Rigorous and Practical
  Approach*, 3rd ed. CRC Press.
- Fowler, M. (2000). Continuous Integration. martinfowler.com.
  https://martinfowler.com/articles/continuousIntegration.html
- Fowler, M. (2020). FeatureBranch. martinfowler.com.
  https://martinfowler.com/bliki/FeatureBranch.html
- Gotel, O. C. Z., Finkelstein, A. C. W. (1994). An analysis of the
  requirements traceability problem. *Proceedings of the First International
  Conference on Requirements Engineering (ICRE '94)*, 94–101. IEEE Computer
  Society.
- Hoare, C. A. R. (1969). An axiomatic basis for computer programming.
  *Communications of the ACM*, 12(10), 576–580.
- Hodgson, P. (2017). Feature Toggles (aka Feature Flags). martinfowler.com.
  https://martinfowler.com/articles/feature-toggles.html
- Juran, J. M., Godfrey, A. B. (1999). *Juran's Quality Handbook*, 5th ed.
  McGraw-Hill.
- Keeney, R. L. (1992). *Value-Focused Thinking: A Path to Creative
  Decisionmaking*. Harvard University Press.
- Kruchten, P. B. (1995). Architectural blueprints—The "4+1" view model of
  software architecture. *IEEE Software*, 12(6), 42–50.
- Lehnert, S. (2011). A review of software change impact analysis. Technische
  Universität Ilmenau.
- Lempert, R. J., Popper, S. W., Bankes, S. C. (2003). *Shaping the Next One
  Hundred Years: New Methods for Quantitative, Long-Term Policy Analysis*.
  RAND Corporation, MR-1626.
- Liskov, B. H., Zilles, S. N. (1974). Programming with abstract data types.
  *SIGPLAN Notices*, 9(4), 50–59.
- Malone, T. W., Crowston, K. (1994). The interdisciplinary study of
  coordination. *ACM Computing Surveys*, 26(1), 87–119.
- Manning, C. D., Raghavan, P., Schütze, H. (2008). *Introduction to
  Information Retrieval*. Cambridge University Press; text — the online
  edition (2009), nlp.stanford.edu/IR-book.
- McCarthy, D., Dayal, U. (1989). The architecture of an active database
  management system. *Proceedings of the 1989 ACM SIGMOD International
  Conference on Management of Data*, 215–224. ACM Press.
- von Mayrhauser, A., Vans, A. M. (1995). Program comprehension during software
  maintenance and evolution. *Computer*, 28(8), 44–55.
- Meyer, B. (1992). Applying "Design by Contract". *IEEE Computer*, 25(10),
  40–51.
- Murphy, G. C., Notkin, D., Sullivan, K. (1995). Software reflexion models:
  Bridging the gap between source and high-level models. *Proceedings of the
  3rd ACM SIGSOFT Symposium on the Foundations of Software Engineering*, 18–26.
  ACM.
- Ohno, T. (1988). *Toyota Production System: Beyond Large-Scale Production*.
  Productivity Press.
- Parnas, D. L. (1972). On the criteria to be used in decomposing systems into
  modules. *Communications of the ACM*, 15(12), 1053–1058.
- Pfeffer, J., Sutton, R. I. (2000). *The Knowing-Doing Gap: How Smart
  Companies Turn Knowledge into Action*. Harvard Business School Press.
- Porter, A. A., Votta, L. G., Basili, V. R. (1995). Comparing detection methods
  for software requirements inspections: A replicated experiment. *IEEE
  Transactions on Software Engineering*, 21(6), 563–575.
- Rasmussen, J. (1983). Skills, rules, and knowledge; signals, signs, and
  symbols, and other distinctions in human performance models. *IEEE
  Transactions on Systems, Man, and Cybernetics*, SMC-13(3), 257–266.
- Reinertsen, D. G. (2009). *The Principles of Product Development Flow:
  Second Generation Lean Product Development*. Celeritas Publishing.
- Sadowski, C., Stolee, K. T., Elbaum, S. (2015). How developers search for
  code: a case study. *Proceedings of the 2015 10th Joint Meeting on
  Foundations of Software Engineering (ESEC/FSE '15)*, 191–201. ACM.
- Shewhart, W. A. (1931). *Economic Control of Quality of Manufactured
  Product*. D. Van Nostrand.
- Simon, H. A. (1956). Rational choice and the structure of the environment.
  *Psychological Review*, 63(2), 129–138.
- Simon, H. A. (1960). *The new science of management decision*. Harper & Row.
- Simon, H. A. (1962). The architecture of complexity. *Proceedings of the
  American Philosophical Society*, 106(6), 467–482.
- Spanoudakis, G., Zisman, A. (2001). Inconsistency management in software
  engineering: Survey and open research issues. In *Handbook of Software
  Engineering and Knowledge Engineering* (pp. 329–380). World Scientific.
- Steward, D. V. (1981). The design structure system: A method for managing
  the design of complex systems. *IEEE Transactions on Engineering
  Management*, EM-28(3), 71–74.
- Weinberg, G. M. (1971). *The Psychology of Computer Programming*. Van
  Nostrand Reinhold.
- Yourdon, E., Constantine, L. L. (1978). *Structured Design: Fundamentals of a
  Discipline of Computer Program and Systems Design*, 2nd ed. Yourdon Press.
