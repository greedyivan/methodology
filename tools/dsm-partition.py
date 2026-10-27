#!/usr/bin/env python3
"""dsm-partition — the partitioning step of the scope-change multi-surface DSM:
reorder the dependency matrix into block-triangular form (Steward 1981,
partitioning). The dependencies fall below the diagonal (sequential
determination), within square blocks on the diagonal (the coupled blocks —
the smallest sets of parts determined jointly, solved by iteration), or the
parts stand off the blocks (determined one at a time). Each coupled block's
internal circuit edges are emitted as the tear candidates — where the
estimates begin; the choice of tears is the Profiler's.

Usage:
  dsm-partition.py --parts <parts-file> --edges <edges-file>

  parts-file: one part per line (the profiled files/artifacts grouped by work).
  edges-file: one dependency per line: "A<TAB>B[<TAB>surface]" — A depends on B
              (B precedes A; A cannot be determined before B is known).

Output: per-block sections in determination order —
  BLOCK <n>: <parts>
    region: ONE-AT-A-TIME | COUPLED (determined jointly; iterate)
    internal edges (tear candidates): <a> -> <b> [surface]     (coupled only)
Exit: 0 partitioned; 2 usage/refusal; 3 no parts.
"""
import sys

def die(msg, code):
    print(f"dsm-partition: {msg}", file=sys.stderr)
    sys.exit(code)

def main():
    args = sys.argv[1:]
    parts_f = edges_f = None
    i = 0
    while i < len(args):
        if args[i] == "--parts" and i + 1 < len(args):
            parts_f = args[i + 1]; i += 2
        elif args[i] == "--edges" and i + 1 < len(args):
            edges_f = args[i + 1]; i += 2
        else:
            die(f"unknown argument: {args[i]} (usage: dsm-partition.py --parts <file> --edges <file>)", 2)
    if not parts_f or not edges_f:
        die("refusal: --parts and --edges are mandatory", 2)

    parts = [l.rstrip("\n") for l in open(parts_f, encoding="utf-8") if l.strip()]
    if not parts:
        die("refusal: the parts file is empty (no parts to partition)", 3)
    pset = set(parts)
    if len(pset) != len(parts):
        die("refusal: duplicate parts in the parts file", 2)

    edges = []  # (a, b, surface) — a depends on b
    for ln, line in enumerate(open(edges_f, encoding="utf-8"), 1):
        line = line.rstrip("\n")
        if not line.strip():
            continue
        cols = line.split("\t")
        if len(cols) < 2:
            die(f"edges file line {ln}: expected 'A<TAB>B[<TAB>surface]'", 2)
        a, b = cols[0], cols[1]
        surf = cols[2] if len(cols) > 2 else ""
        for x in (a, b):
            if x not in pset:
                die(f"edges file line {ln}: unknown part: {x} (declare all parts in the parts file)", 2)
        edges.append((a, b, surf))

    # adjacency: a -> b (a depends on b; b precedes a)
    adj = {p: [] for p in parts}
    for a, b, _ in edges:
        adj[a].append(b)

    # Tarjan's strongly connected components (iterative).
    index = {}; low = {}; onstk = set(); stk = []; comps = []; counter = [0]
    def strongconnect(v):
        work = [(v, 0)]
        while work:
            node, pi = work[-1]
            if pi == 0:
                index[node] = low[node] = counter[0]; counter[0] += 1
                stk.append(node); onstk.add(node)
            recurse = False
            children = adj[node]
            for j in range(pi, len(children)):
                w = children[j]
                if w not in index:
                    work[-1] = (node, j + 1)
                    work.append((w, 0)); recurse = True; break
                elif w in onstk:
                    low[node] = min(low[node], index[w])
            if recurse:
                continue
            if low[node] == index[node]:
                comp = []
                while True:
                    w = stk.pop(); onstk.discard(w); comp.append(w)
                    if w == node:
                        break
                comps.append(comp)
            work.pop()
            if work:
                parent = work[-1][0]
                low[parent] = min(low[parent], low[node])
    for p in parts:
        if p not in index:
            strongconnect(p)

    # self-loop detection: a part depending on itself is coupled even alone
    selfloop = {(a, b) for a, b, _ in edges if a == b}
    selfloop_parts = {a for a, b in selfloop}

    # blocks: components of size > 1, or singletons with a self-loop
    comp_of = {}
    for ci, comp in enumerate(comps):
        for p in comp:
            comp_of[p] = ci
    coupled = [c for c in comps if len(c) > 1 or (len(c) == 1 and c[0] in selfloop_parts)]

    # condensation: block -> block (a depends on b); dependencies-first order =
    # topological order over the condensation with edges reversed (b before a).
    comp_edges = set()
    for a, b, _ in edges:
        ca, cb = comp_of[a], comp_of[b]
        if ca != cb:
            comp_edges.add((cb, ca))  # cb (the dependency) precedes ca
    # Kahn over the condensation (reversed edges): indegree by precedence
    indeg = {ci: 0 for ci in range(len(comps))}
    succ = {ci: [] for ci in range(len(comps))}
    for pre, dep in comp_edges:
        succ[pre].append(dep)
        indeg[dep] += 1
    ready = sorted([ci for ci in range(len(comps)) if indeg[ci] == 0])
    order = []
    indeg_m = dict(indeg)
    while ready:
        ci = ready.pop(0)
        order.append(ci)
        for dj in succ[ci]:
            indeg_m[dj] -= 1
            if indeg_m[dj] == 0:
                ready.append(dj)
    if len(order) != len(comps):
        die("internal error: the condensation is not acyclic (partitioning failure)", 5)

    # emit per-block sections in determination order; parts within blocks sorted
    def emit_block(n, comp):
        sp = sorted(comp)
        is_c = len(comp) > 1 or (len(comp) == 1 and comp[0] in selfloop_parts)
        region = "COUPLED (determined jointly; iterate)" if is_c else "ONE-AT-A-TIME"
        print(f"BLOCK {n}: {', '.join(sp)}")
        print(f"  region: {region}")
        if is_c:
            cset = set(comp)
            internal = sorted([(a, b, s) for a, b, s in edges if a in cset and b in cset])
            print("  internal edges (tear candidates):")
            if internal:
                for a, b, s in internal:
                    tag = f" [{s}]" if s else ""
                    print(f"    {a} -> {b}{tag}")
            else:
                print(f"    (self-dependency: {comp[0]})")
    n = 0
    for ci in order:
        n += 1
        emit_block(n, comps[ci])
    n_coupled = sum(1 for c in coupled)
    print(f"--- partitioned: {n} block(s) in determination order; {n_coupled} coupled (iterated jointly); "
          f"{len(parts) - sum(len(c) for c in coupled)} part(s) one-at-a-time")
    sys.exit(0)

main()
