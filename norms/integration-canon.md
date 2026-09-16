# Integration canon of the shared corpus (methodology)

The corpus is a common pool: several projects of the operator share the same
norm files (charters, registry, README). The founding incident — a merge of a
real integration conflict (two process lines, append-hotspot conflicts; provenance —
a pre-publication analysis artifact of the instance's cycle zone).
The canon is the Ostrom minimum: boundaries, discipline, a resolution mechanism, monitoring.

## Sync discipline

- **Pull before a session** (a corpus git-pull): the first operation
  of a session working with the corpus is `git pull --rebase` (divergence window — hours, not days).
- **Push right after land**: every completed land (a commit editing the corpus)
  is pushed immediately; unpushed lands do not accumulate.

## Merge model

- Under divergence — **merge, not rebase** (rebase multiplies conflicts by the number
  of local commits; precedent — a real conflict series of the pre-publication history).
- Content conflicts — **keep-both**: the lines are additive by nature
  (materialized lessons); state lines ("Alive after revision…") — from
  the corrected (later by provenance) line.
- A merge is accompanied by **integrity checks** (below) with the result
  recorded in the session artifact (the repair-time registry — a health
  metric of the corpus).

## Merge-integrity checks (run by the integrator on the merged tree; u2c runs from the corpus repo root; the u2a/u2b registry path is instance-state — resolved from the instance root, not the corpus repo root; glossary `instance`, `instance-state`)

```bash
# u2a — registry item id uniqueness (empty output = clean)
grep -rh '^- \*\*id:\*\*' operational-repo/registry/deferred-options.md \
  | sed 's/^- \*\*id:\*\* //' | sort | uniq -d

# u2b — shared item anchors (output = the integrator's review list;
# full automation impossible: an anchor match ≠ a trigger collision;
# EN field form with the legacy RU form tolerated — W3 transition)
grep -rhE '^- \*\*(anchor set|якорный набор):\*\*' operational-repo/registry/deferred-options.md \
  | grep -oE '[A-Za-z0-9_.-]+\.(md|go|ts|tsx|php)|[A-Z][A-Za-z-]+ (19|20)[0-9]{2}' \
  | sort | uniq -c | awk '$1>1'

# u2c — files where reconcile materialized >1 rule (per-file stamp density;
# output = review: complementarity vs homonymy, BLN taxonomy;
# EN stamp form with the legacy RU form tolerated — W3 transition)
grep -rnE 'materialized by reconcile|материализовано reconcile' --include='*.md' . \
  | grep -v deferred-options | cut -d: -f1 | sort | uniq -c | awk '$1>1'
```

Dispositions for the u2b/u2c lists are recorded by the integrator (the decision — what is
complementary, what is a homonym; a homonym → rename/merging of norms). u2c aggregation
semantics (post-W3): per-file stamp density — the review trigger is "multiple rules
materialized in one file"; per-source identity is not retained in the aggregation.
Honest declaration: u2b/u2c — a review channel, not an auto-gate.

## Escalation ladder (registry)

Discipline → merge windows / per-project branches (a 2nd divergence under a live
sync discipline) → the per-item registry (a 3rd instance of conflict intensity). Triggers —
in the items `kernel-merge-window`, `kernel-registry-per-item`,
`kernel-registry-project-field` (deferred-options.md).
