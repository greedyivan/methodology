#!/usr/bin/env python3
"""Validator of SENSOR lines in cycle artifacts (glossary: sensor line).

Format: `SENSOR | kind= | actor= | stage= | outcome= | point= | <ostensive> :: <performative>`
Input resolution: explicit path arguments; otherwise the CYCLE_WORKSPACE environment
variable names the cycle-workspace root, and every */*.md one level below it is scanned
for sensor lines. With no arguments and no non-empty CYCLE_WORKSPACE the validator exits
2 without scanning. Closed enumerations; the marker is line-anchored.
Exit 0 — all lines valid; 1 — otherwise.
"""
import os
import re
import sys
from pathlib import Path

KIND = {"deviation", "near-miss"}
STAGE = {"scope", "specify", "audit", "realize", "verify", "reconcile"}
OUTCOME = {"bypass-succeeded", "bypass-failed", "averted"}
POINT = {"in-moment", "post-factum"}

FIELD_RE = re.compile(r"^(kind|actor|stage|outcome|point)=(\S+)$")
MARKER = "SENSOR |"


def validate_line(line):
    parts = [p.strip() for p in line.split("|")]
    fields, tail = {}, []
    for p in parts[1:]:
        m = FIELD_RE.match(p)
        if m:
            fields[m.group(1)] = m.group(2)
        elif p:
            tail.append(p)
    errs = []
    enums = {"kind": KIND, "stage": STAGE, "outcome": OUTCOME, "point": POINT}
    for f, allowed in enums.items():
        v = fields.get(f, "")
        if not v:
            errs.append(f"missing {f}=")
        elif v not in allowed:
            errs.append(f"{f}={v!r} outside the enumeration")
    if not fields.get("actor"):
        errs.append("missing actor=")
    if not tail:
        errs.append("missing ostensive/performative tail")
    elif "::" not in " | ".join(tail):
        errs.append("missing '::' separator between ostensive and performative")
    return errs


def main():
    paths = [Path(a) for a in sys.argv[1:]]
    if not paths:
        root = os.environ.get("CYCLE_WORKSPACE") or ""
        if not root:
            print(
                "usage: validate_sensor.py [<file.md> ...] | CYCLE_WORKSPACE=<cycle-workspace root>"
                " (every */*.md one level below the root)",
                file=sys.stderr,
            )
            sys.exit(2)
        paths = sorted(p for p in Path(root).glob("*/*.md") if p.is_file())
    errors, total = [], 0
    for path in paths:
        for i, line in enumerate(path.read_text(encoding="utf-8").splitlines(), 1):
            if not line.startswith(MARKER):
                continue
            total += 1
            errs = validate_line(line)
            if errs:
                errors.append(f"{path}#L{i}: {'; '.join(errs)}")
    for e in errors:
        print(e)
    print(f"sensor_lines={total} invalid={len(errors)}")
    sys.exit(1 if errors else 0)


if __name__ == "__main__":
    main()
