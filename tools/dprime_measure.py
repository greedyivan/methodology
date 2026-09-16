#!/usr/bin/env python3
"""d′ measure of the verification loop by hits/false-alarms (signal detection theory).

Input: JSON — the list of trials of a seeded-defect run:
  [{"defect_id": "...", "verified": true|false, "is_signal": true|false}, ...]
  is_signal — the injection is real (signal trial); verified — the loop caught it (hit/FA).

Output: HR, FAR, d′ (normalized by the z-transform, log-linear 0/1 correction),
criterion c. Exit 0 always; malformed input — exit 1.
"""
import json
import math
import sys

EPS = 0.5  # log-linear correction (Hautus 1995)


def z(p):
    # inverse normal CDF via binary search (math.erfinv is absent from the stdlib)
    lo, hi = -8.0, 8.0
    for _ in range(200):
        mid = 0.5 * (lo + hi)
        if 0.5 * (1 + math.erf(mid / math.sqrt(2))) < p:
            lo = mid
        else:
            hi = mid
    return 0.5 * (lo + hi)


def main():
    try:
        trials = json.load(sys.stdin)
    except json.JSONDecodeError as e:
        print(f"bad json: {e}", file=sys.stderr)
        sys.exit(1)
    if not isinstance(trials, list) or not all(
        isinstance(t, dict) and isinstance(t.get("verified"), bool) and isinstance(t.get("is_signal"), bool)
        for t in trials
    ):
        print("expected: [{defect_id, verified:bool, is_signal:bool}, ...]", file=sys.stderr)
        sys.exit(1)

    n_s = sum(t["is_signal"] for t in trials)
    n_n = len(trials) - n_s
    hits = sum(t["verified"] for t in trials if t["is_signal"])
    fas = sum(t["verified"] for t in trials if not t["is_signal"])

    hr = (hits + EPS) / (n_s + 2 * EPS)
    far = (fas + EPS) / (n_n + 2 * EPS)
    dprime = z(hr) - z(far)
    criterion = -0.5 * (z(hr) + z(far))

    print(f"trials={len(trials)} signal={n_s} noise={n_n}")
    print(f"hits={hits}/{n_s} false_alarms={fas}/{n_n}")
    print(f"HR={hr:.4f} FAR={far:.4f} (log-linear {EPS})")
    print(f"d_prime={dprime:.4f} criterion_c={criterion:.4f}")


if __name__ == "__main__":
    main()
