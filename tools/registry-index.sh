#!/usr/bin/env bash
# registry-index.sh — the deferred-options registry interface: minter, freshness
# gate, expiry guard, matching-scope emitter, adjudication writer
# (live surface: <target>/<id>.md item files + index.md; the archive/ subtree is
# historical and outside the freshness gate's domain).
#
# Canon: spec.md of the registry-peritem-economy cycle (INV-12, INV-18, INV-19,
# R-14, R-15); the interface canon — the scope-change skill (the registry is
# reached only through these operations; the per-item-file carrier form is the
# reference implementation behind them).
#   mint       — derive index.md from the live item files (5 canonical blocks;
#                row = id | title | expiry | trigger-predicate, fields verbatim).
#   check      — freshness gate: independent re-derivation of rows from the item
#                files must equal the committed index rows (wrap-normalized,
#                row-domain), plus the thinness legs:
#                  - index.md carries no field bodies ('^- \*\*' → 0)
#                  - live item files carry no adjudication history ('Adjudication 20' → 0)
#                  - the live root carries no non-.md carriers (→ 0)
#   expiry     — the launch guard: classify each committed row's expiry cell
#                (first date outside bracketed groups vs today; no date —
#                conditional; relative date forms — unresolved, fail-open).
#                Sections EXPIRED/CONDITIONAL/UNRESOLVED; exit 0 = nothing
#                expired, 1 = expired present (informational only — the
#                drop/re-derive is the revision point's act, reconcile-change).
#   scope      — emit the matching scope of a chain launch: the armed items of
#                the given event class plus the out-of-class block, minus
#                expired, minus closed/in-work, each with the fields the
#                recommendation needs (суть, build-path). The class —
#                --class profiling|checkpoint|audit|verify (default profiling).
#                Exit 0 (an empty scope is a valid outcome).
#   adjudicate — write the authoring decision on a fired item:
#                --decision taken    — the header carries the
#                                      [В РАБОТЕ <date> <cycle>] marker, the
#                                      adjudication record is appended, re-mint;
#                --decision declined — the adjudication record only (appendix +
#                                      state line; the header is unchanged — the
#                                      trigger re-evaluation is the revision
#                                      point's act).
#   item-new   — write a new DEFER item authored by the Profiler and re-mint:
#                --id <id> --body <file> (the body carries the item's seven
#                fields). Refuses on an existing id (the live surface is
#                append-only at the id level).
# All modes refuse without --target (target guard; named refusal).
# Locale pin: LC_ALL=C.UTF-8 (registry gates; multibyte ids/titles).
set -uo pipefail
export LC_ALL=C.UTF-8

usage() {
  echo "usage: registry-index.sh mint|check|expiry|scope --target <registry-dir> [--class profiling|checkpoint|audit|verify]" >&2
  echo "       registry-index.sh adjudicate --target <dir> --id <id> --decision taken --cycle <slug>" >&2
  echo "       registry-index.sh adjudicate --target <dir> --id <id> --decision declined [--cycle <slug>] --note <text>" >&2
  echo "       registry-index.sh item-new --target <dir> --id <id> --body <file>" >&2
}
die() { echo "registry-index: $1" >&2; exit "${2:-1}"; }

MODE="${1:-}"
[ -n "$MODE" ] || { usage; exit 2; }
case "$MODE" in mint|check|expiry|scope|adjudicate|item-new) ;; *) usage; exit 2 ;; esac
shift

TARGET=""; ID=""; DECISION=""; CYCLE=""; NOTE=""; CLASS="profiling"; BODY=""
while [ $# -gt 0 ]; do
  case "$1" in
    --target)   TARGET="${2:-}"; shift 2 ;;
    --id)       ID="${2:-}"; shift 2 ;;
    --decision) DECISION="${2:-}"; shift 2 ;;
    --cycle)    CYCLE="${2:-}"; shift 2 ;;
    --note)     NOTE="${2:-}"; shift 2 ;;
    --class)    CLASS="${2:-}"; shift 2 ;;
    --body)     BODY="${2:-}"; shift 2 ;;
    *) die "unknown argument: $1 (target guard: --target is mandatory)" 2 ;;
  esac
done
[ -n "$TARGET" ] || die "refusal: --target <registry-dir> is mandatory (target guard; mass/generated writes are refused without an explicit target)" 2
[ -d "$TARGET" ] || die "refusal: target directory does not exist: $TARGET" 2
if [ "$MODE" = "adjudicate" ]; then
  [ -n "$ID" ] || die "adjudicate: --id is mandatory" 2
  case "$DECISION" in taken|declined) ;; *) die "adjudicate: --decision taken|declined" 2 ;; esac
  if [ "$DECISION" = "taken" ] && [ -z "$CYCLE" ]; then
    die "adjudicate taken: --cycle <slug> is mandatory (the В РАБОТЕ marker carries the cycle)" 2
  fi
fi

T="$(mktemp -d)"; trap 'rm -rf "$T"' EXIT
TODAY=$(date +%F)

# ---- shared row extraction (mint path: per-file, with title) ----
MINT_AWK="$T/mint.awk"
cat > "$MINT_AWK" <<'AWK'
# Row + class-bucket derivation from one item file (mint path).
# id: id-field without trailing dot; fallback header-form (marker stripped,
# text before " — " else rest). title: header after " — " else whole.
# expiry/trigger: field verbatim, wrapped continuations single-space joined.
FNR==1 {
  h=$0; sub(/^#+ /,"",h)
  while (match(h, /\[(DROP|ИСПОЛНЕН|В РАБОТЕ)[^]]*\]/)) h = substr(h,1,RSTART-1) substr(h,RSTART+RLENGTH)
  gsub(/^ +| +$/, "", h)
  if (match(h, / — /)) { hid=substr(h,1,RSTART-1); title=substr(h,RSTART+3) }
  else { hid=h; title=h }
  k=""
}
/^- \*\*id:/    { k="id";  v=$0; sub(/^- \*\*id:\*\* */,"",v);  id=v;  sub(/\.$/,"",id);  next }
/^- \*\*expiry:/{ k="exp"; v=$0; sub(/^- \*\*expiry:\*\* */,"",v); exp_=v; next }
/^- \*\*триггер-предикат:/ { k="tr"; v=$0; sub(/^- \*\*триггер-предикат:\*\* */,"",v); tr=v; next }
k!="" && /^ /  { v=$0; sub(/^ +/, "", v); if (k=="id") {id=id" "v; sub(/\.$/,"",id)} else if (k=="exp") exp_=exp_" "v; else tr=tr" "v; next }
k!=""          { k="" }
ENDFILE {
  if (id == "") id=hid
  if (id != "" && FILENAME !~ /index\.md$/ && FILENAME !~ /SCHEMA\.md$/) {
    c=0
    row = id " | " title " | " exp_ " | " tr
    if (tr ~ /profiling-факт/)      { printf "1\tprofiling\t%s\n", row; c++ }
    if (tr ~ /checkpoint-вопрос/)   { printf "2\tcheckpoint\t%s\n", row; c++ }
    if (tr ~ /audit-находка/)       { printf "3\taudit\t%s\n", row; c++ }
    if (tr ~ /verify-adjudication/) { printf "4\tverify\t%s\n", row; c++ }
    if (c == 0) printf "5\tout\t%s\n", row
  }
  id=exp_=tr=hid=title=""; k=""
}
AWK

# ---- independent re-extraction (check path: whole-set read, different code) ----
CHECK_AWK="$T/check.awk"
cat > "$CHECK_AWK" <<'AWK'
# Freshness check path — re-extracts rows from item files independently of the
# mint extraction (fresh state machine; canon identical, code independent).
function hdr() {
  h=$0; sub(/^#+ /,"",h)
  gsub(/\[(DROP|ИСПОЛНЕН|В РАБОТЕ)[^]]*\]/, "", h)
  gsub(/^ +| +$/, "", h)
  p = index(h, " — ")
  if (p > 0) { hid = substr(h,1,p-1); ttl = substr(h,p+3) }
  else { hid = h; ttl = h }
}
FNR == 1 { hdr(); have_id = have_exp = have_tr = 0; ident = expv = trv = "" }
/^- \*\*id:/    { have_id=1;  ident=$0; sub(/^- \*\*id:\*\* */, "", ident);  sub(/\.$/, "", ident); f="id";  next }
/^- \*\*expiry:/{ have_exp=1; expv=$0;  sub(/^- \*\*expiry:\*\* */, "", expv); f="exp"; next }
/^- \*\*триггер-предикат:/ { have_tr=1; trv=$0; sub(/^- \*\*триггер-предикат:\*\* */, "", trv); f="tr"; next }
f != "" && substr($0,1,1) == " " {
  c = $0; sub(/^ +/, "", c)
  if (f=="id") { ident = ident " " c; sub(/\.$/, "", ident) }
  else if (f=="exp") expv = expv " " c
  else trv = trv " " c
  next
}
f != "" { f = "" }
ENDFILE {
  if (!have_id) ident = hid
  if (ident != "" && FILENAME !~ /index\.md$/ && FILENAME !~ /SCHEMA\.md$/) {
    row = ident " | " ttl " | " expv " | " trv
    hit = 0
    if (trv ~ /profiling-факт/)      { print "1\tprofiling\t" row; hit++ }
    if (trv ~ /checkpoint-вопрос/)   { print "2\tcheckpoint\t" row; hit++ }
    if (trv ~ /audit-находка/)       { print "3\taudit\t" row; hit++ }
    if (trv ~ /verify-adjudication/) { print "4\tverify\t" row; hit++ }
    if (!hit) print "5\tout\t" row
  }
  have_id = have_exp = have_tr = 0; ident = expv = trv = hid = ttl = ""; f = ""
}
AWK

# committed-index normalizer: wrap-join continuations, then row-domain filter
# (rows = first char not '#' and not space/tab, line contains '|').
NORM_AWK="$T/norm.awk"
cat > "$NORM_AWK" <<'AWK'
NF==0 { next }
/^[ \t]/ { if (row != "") { v=$0; sub(/^[ \t]+/, "", v); row = row " " v } next }
{ if (row != "") out(row); row = $0 }
function out(s) { if (s !~ /^[#[ \t]/ && s ~ /\|/) print s }
END { if (row != "") out(row) }
AWK

# ---- recommendation fields (scope path: суть + build-path, joined) ----
FIELDS_AWK="$T/fields.awk"
cat > "$FIELDS_AWK" <<'AWK'
FNR==1 { if (f != "") flush(); printf "FILE\t%s\n", FILENAME; f=FILENAME; k=""; s=""; b="" }
/^- \*\*суть:/       { k="s"; s=$0; sub(/^- \*\*суть:\*\* */, "", s); next }
/^- \*\*build-path:/ { k="b"; b=$0; sub(/^- \*\*build-path:\*\* */, "", b); next }
k!="" && /^ / { v=$0; sub(/^ +/, "", v); if (k=="s") s = s " " v; else b = b " " v; next }
k!="" { k="" }
function flush() { printf "FIELD\tсуть\t%s\nFIELD\tbuild-path\t%s\n", s, b }
ENDFILE { flush(); f="" }
END { if (f != "") flush() }
AWK

# Item files as a bash array — filenames may contain spaces (ids carry the
# id-field verbatim, e.g. "к15 spike-skill-promotion.md"); unquoted expansion
# silently splits them (born defect of the first mint run — 0 rows, fixed).
# opensource-projects.md is an independent registry carrier (MUST-preserve,
# another function) — never an item file.
build_items() {
  ITEMS=()
  while IFS= read -r f; do ITEMS+=("$f"); done < <(find "$TARGET" -maxdepth 1 -name '*.md' ! -name 'index.md' ! -name 'SCHEMA.md' ! -name 'opensource-projects.md' | LC_ALL=C.UTF-8 sort)
}

# expiry-cell classification (the guard's semantics): first date outside
# bracketed groups vs today; no date — conditional; relative date forms
# ("N мес от D", "через N") — unresolved (fail-open, stays in scope).
classify_expiry() {
  local cell="$1" stripped d
  if printf '%s' "$cell" | grep -qE '(мес|недел|дн).*от +[0-9]{4}-|через +[0-9]+ +(мес|недел|дн)'; then
    echo "UNRESOLVED"; return
  fi
  stripped=$(printf '%s' "$cell" | sed 's/\[[^]]*\]//g')
  d=$(printf '%s' "$stripped" | grep -oE '[0-9]{4}-[0-9]{2}-[0-9]{2}' | head -n 1)
  if [ -z "$d" ]; then echo "CONDITIONAL"; return; fi
  if [[ "$d" < "$TODAY" || "$d" = "$TODAY" ]]; then echo "EXPIRED $d"; else echo "OK $d"; fi
}

do_mint() {
  build_items
  [ "${#ITEMS[@]}" -gt 0 ] || die "no item files found under $TARGET (live surface is the flat .md item files; index.md/SCHEMA.md/opensource-projects.md excluded)" 1
  awk -f "$MINT_AWK" "${ITEMS[@]}" | LC_ALL=C.UTF-8 sort -t$'\t' -k1,1n -k3,3 > "$T/rows.tsv"
  local rows uniq_ids
  rows=$(wc -l < "$T/rows.tsv")
  [ "$rows" -gt 0 ] || die "mint produced 0 rows from ${#ITEMS[@]} item files (extraction failure)" 5
  uniq_ids=$(cut -f3 "$T/rows.tsv" | cut -d'|' -f1 | sed 's/ *$//' | sort -u | wc -l)
  [ "$uniq_ids" -gt 0 ] || die "mint derived 0 unique ids (extraction failure)" 5
  print_block() {
    echo "## $2"
    awk -F'\t' -v lbl="$1" '$2 == lbl { print $3 }' "$T/rows.tsv"
  }
  {
    echo "# Индекс живых item'ов (тонкий; живое-только; строка = id | заголовок | expiry | триггер-предикат)"
    echo
    print_block "profiling"   "[profiling-факт]"
    print_block "checkpoint"  "[checkpoint-вопрос]"
    print_block "audit"       "[audit-находка]"
    print_block "verify"      "[verify-adjudication]"
    print_block "out"         "вне-классовые живые"
  } > "$TARGET/index.md"
  echo "registry-index: minted $TARGET/index.md ($(grep -cE '^[^#[[:space:]].*\|' "$TARGET/index.md") rows, $uniq_ids unique ids)"
}

header_marker() {  # file → yes|no (closed or in-work header marker)
  awk 'FNR==1 { if ($0 ~ /\[(DROP|ИСПОЛНЕН|В РАБОТЕ)[^]]*\]/) print "yes"; else print "no"; exit }' "$1"
}

case "$MODE" in
  mint)
    do_mint
    ;;
  check)
    build_items
    [ "${#ITEMS[@]}" -gt 0 ] || die "no item files found under $TARGET (live surface is the flat .md item files; index.md/SCHEMA.md/opensource-projects.md excluded)" 1
    rc=0
    # (a) freshness: derived rows == rows(normalize(committed))
    awk -f "$CHECK_AWK" "${ITEMS[@]}" | LC_ALL=C.UTF-8 sort -t$'\t' -k1,1n -k3,3 | cut -f3- > "$T/derived.txt"
    awk -f "$NORM_AWK" "$TARGET/index.md" > "$T/committed.txt"
    if diff -u "$T/committed.txt" "$T/derived.txt"; then
      echo "freshness GREEN: derived == committed ($(wc -l < "$T/derived.txt") rows)"
    else
      echo "freshness RED: committed index diverges from item files" >&2; rc=1
    fi
    # (b) thinness: index carries no field bodies
    bodies=$(grep -c '^- \*\*' "$TARGET/index.md" || true)
    if [ "$bodies" = "0" ]; then echo "thinness GREEN: index carries no field bodies"; else echo "thinness RED: index bodies=$bodies" >&2; rc=1; fi
    # (c) bounded live files: no adjudication history in item files
    adj=0
    if [ "$(grep -l 'Adjudication 20' "${ITEMS[@]}" 2>/dev/null | wc -l)" -gt 0 ]; then
      adj=$(grep -l 'Adjudication 20' "${ITEMS[@]}" | wc -l)
    fi
    if [ "$adj" = "0" ]; then echo "bounded GREEN: no adjudication history in live item files"; else echo "bounded RED: live files with history=$adj" >&2; grep -l 'Adjudication 20' "${ITEMS[@]}" >&2 || true; rc=1; fi
    # (d) carrier-suffix leg: no non-.md foreign carriers in the live root.
    # Domain bound (recorded): provision-registry.tsv is a declared independent
    # carrier (charter: "другая функция, не трогаются") — outside the leg; the
    # leg targets editor/minter temp forms (index.md~, .swp) in both directions.
    suffix=$(find "$TARGET" -maxdepth 1 -type f ! -name '*.md' ! -name 'provision-registry.tsv' | wc -l || true)
    if [ "$suffix" = "0" ]; then echo "carrier GREEN: live root carries only .md files + declared carriers"; else echo "carrier RED: non-.md foreign carriers=$suffix" >&2; find "$TARGET" -maxdepth 1 -type f ! -name '*.md' ! -name 'provision-registry.tsv' >&2; rc=1; fi
    exit $rc
    ;;
  expiry)
    rows=$(awk -f "$NORM_AWK" "$TARGET/index.md")
    [ -n "$rows" ] || die "expiry: committed index has no rows (run mint first)" 5
    : > "$T/expired"; : > "$T/cond"; : > "$T/unres"
    while IFS= read -r row; do
      [ -n "$row" ] || continue
      id="${row%% | *}"; rest="${row#* | }"; rest2="${rest#* | }"; cell="${rest2%% | *}"
      cls=$(classify_expiry "$cell")
      case "$cls" in
        EXPIRED*)     echo "$id (${cls#EXPIRED })" >> "$T/expired" ;;
        CONDITIONAL)  echo "$id" >> "$T/cond" ;;
        UNRESOLVED)   echo "$id" >> "$T/unres" ;;
      esac
    done <<< "$rows"
    echo "EXPIRED:";   [ -s "$T/expired" ] && sort -u "$T/expired"   | sed 's/^/  /' || echo "  (none)"
    echo "CONDITIONAL:"; [ -s "$T/cond" ] && sort -u "$T/cond" | sed 's/^/  /' || echo "  (none)"
    echo "UNRESOLVED:"; [ -s "$T/unres" ] && sort -u "$T/unres" | sed 's/^/  /' || echo "  (none)"
    [ -s "$T/expired" ] && exit 1 || exit 0
    ;;
  scope)
    case "$CLASS" in
      profiling)  cnum=1 ;;
      checkpoint) cnum=2 ;;
      audit)      cnum=3 ;;
      verify)     cnum=4 ;;
      *) die "scope: --class profiling|checkpoint|audit|verify" 2 ;;
    esac
    build_items
    [ "${#ITEMS[@]}" -gt 0 ] || die "no item files found under $TARGET" 1
    awk -f "$MINT_AWK" "${ITEMS[@]}" | LC_ALL=C.UTF-8 sort -t$'\t' -k1,1n -k3,3 > "$T/rows.tsv"
    awk -F'\t' -v c="$cnum" '$1 == c || $1 == 5 { print $3 }' "$T/rows.tsv" > "$T/cand.txt"
    awk -f "$FIELDS_AWK" "${ITEMS[@]}" > "$T/fields.txt"
    emitted=0; excluded=0
    while IFS= read -r row; do
      [ -n "$row" ] || continue
      id="${row%% | *}"; rest="${row#* | }"; title="${rest%% | *}"; rest2="${rest#* | }"; cell="${rest2%% | *}"; trig="${rest2#* | *}"
      file="$TARGET/$id.md"
      if [ ! -f "$file" ]; then echo "scope: no item file for id: $id" >&2; continue; fi
      if [ "$(header_marker "$file")" = "yes" ]; then excluded=$((excluded+1)); continue; fi
      case "$(classify_expiry "$cell")" in EXPIRED*) excluded=$((excluded+1)); continue ;; esac
      emitted=$((emitted+1))
      echo "=== item: $id"
      echo "title: $title"
      echo "expiry: $cell"
      echo "триггер-предикат: $trig"
      awk -v f="$file" -F'\t' '
        $1 == "FILE" { inf = ($2 == f); next }
        inf && $1 == "FIELD" { print $2 ": " $3 }
      ' "$T/fields.txt"
    done < "$T/cand.txt"
    echo "--- scope: $emitted item(s) in the matching scope; $excluded excluded (closed/in-work/expired); live: $(cut -f3 "$T/rows.tsv" | cut -d'|' -f1 | sed 's/ *$//' | sort -u | wc -l) unique ids"
    exit 0
    ;;
  adjudicate)
    file="$TARGET/$ID.md"
    [ -f "$file" ] || die "adjudicate: no item file for id: $ID" 2
    [ "$(header_marker "$file")" = "no" ] || die "adjudicate: item is closed or already in work: $ID" 3
    appdir="$TARGET/archive/appendices"; mkdir -p "$appdir"
    app="$appdir/$ID.md"
    [ -f "$app" ] || printf '# appendices — %s (исторический носитель; рост с использованием допустим)\n\n' "$ID" > "$app"
    if [ "$DECISION" = "taken" ]; then
      awk -v m=" [В РАБОТЕ $TODAY $CYCLE]" 'FNR == 1 { print $0 m; next } { print }' "$file" > "$T/out" && mv "$T/out" "$file"
      printf '**Adjudication %ssc** (scope-change launch, цикл %s): авторское решение — исполнять (взято в работу; исполнение через collapse-checklist цикла); item в работе.\n' "$TODAY" "$CYCLE" >> "$app"
    else
      ctx="scope-change launch"
      [ -n "$CYCLE" ] && ctx="$ctx, цикл $CYCLE"
      printf '**Adjudication %ssc** (%s): авторское решение — не исполнять (%s); item жив, триггер без изменений (переоценка — на revision-точке).\n' "$TODAY" "$ctx" "$NOTE" >> "$app"
    fi
    n=$(grep -oE 'адъюдикаций [0-9]+' "$file" | grep -oE '[0-9]+' | head -n 1); n=${n:-0}
    awk -v rep="- **состояние:** адъюдикаций $((n + 1)); последняя — ${TODAY}sc." \
        '{ if ($0 ~ /^- \*\*состояние:\*\* /) print rep; else print }' "$file" > "$T/out" && mv "$T/out" "$file"
    [ "$DECISION" = "taken" ] && do_mint
    echo "adjudicate: $DECISION recorded for $ID ($TODAY)"
    ;;
  item-new)
    [ -n "$ID" ] || die "item-new: --id is mandatory" 2
    [ -n "$BODY" ] && [ -f "$BODY" ] || die "item-new: --body <file> is mandatory (the authored seven-field item body)" 2
    [ -f "$TARGET/$ID.md" ] && die "refusal: item already exists on the live surface: $ID (the live surface is append-only at the id level; revision-only changes)" 3
    grep -q "^- \*\*id:\*\* *$ID" "$BODY" || die "item-new: the body's id-field must match --id: $ID" 2
    mv "$BODY" "$TARGET/$ID.md"
    do_mint
    echo "item-new: $ID written and index re-minted"
    ;;
esac
