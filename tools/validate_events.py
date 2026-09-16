#!/usr/bin/env python3
"""Validator of events.jsonl against the closed event catalog (inline below).

Exit 0 — all events valid; 1 — invalid ones present. Report — stdout.
"""
import json
import re
import sys
from pathlib import Path

CATALOG = {
    "stage": {"stage": {"init", "scope", "specify", "audit", "realize", "verify", "reconcile"},
              "lifecycle:transition": {"start", "complete"}},
    "checkpoint-emitted": {},
    "checkpoint-resolved": {},
    "audit-round": {"round:int": None, "blocker:int": None, "major:int": None, "minor:int": None},
    "audit-verdict": {"verdict": {"clean", "blocked"}},
    "verify-adjudication": {"level": {"L0", "L1", "L2", "L3", "L4"},
                            "trigger": {"neutral-info", "impl-pressure"}},
    "mn-trigger": {"boundary": {"M", "N"}},
    "pr-submitted": {"pr:url": None, "date": None},
    "outcome": {"outcome": {"merged", "changes-requested-merged", "rejected",
                            "changes-requested-exhausted", "censored-no-response"}},
    "land": {"tokens:int": None, "wall_clock_min:int": None, "rounds_review:int": None,
             "sensor_count:int": None, "mn_count:int": None},
    "formation-brief": {"claims:int": None, "blocks:int": None},
    "spike-started": {"question": None, "timebox_min:int": None},
    "spike-completed": {"question": None, "outcome": {"answered", "inconclusive"}},
    "claim-added": {"claim:id": None, "confidence": None},
    "knowledge-gap-registered": {"gap:id": None, "prio": None, "blocker_potential:boolean": None},
    "monitor-signal": {"metric": {"M1", "M2", "M3", "M4", "M5", "M6", "M7", "M8"}},
    "route-decision": {"edit_class": None,  # wave 2
                       "rung": {"tool-executed", "tool-assisted", "tool-verified", "llm-planning"},
                       "floor": {"true", "false"},
                       "cache_hit": {"true", "false"}},
    "approach-fork": {"topic": None,  # wave 2
                      "decision": {"build", "ratify", "one-off", "tool-path"},
                      "scope": {"class", "case"}},
}

INT_RE = re.compile(r"-?\d+")
ISO_RE = re.compile(r"^\d{4}-\d{2}-\d{2}T\d{2}:\d{2}:\d{2}(Z|[+-]\d{2}:\d{2})$")


def check_field(spec, value):
    if spec is None:
        return True
    if isinstance(spec, set):
        return str(value) in spec
    return False


OPTIONAL = {
    ("stage", "lifecycle:transition"),  # historically start was omitted in the complete-only emit
}


def wire_key(field):
    # ':int'/':boolean' — a catalog type annotation; the wire key is without it.
    # ':transition'/':url'/':id' — named attributes, the key is full.
    return re.sub(r":(int|boolean)$", "", field)


def validate_line(path, i, rec):
    errs = []
    if not isinstance(rec, dict) or "event" not in rec:
        return [f"{path}#L{i}: missing field 'event'"]
    name = rec.get("event")
    if name not in CATALOG:
        return [f"{path}#L{i}: event outside the catalog: {name!r}"]
    spec = CATALOG[name]
    for field, fspec in spec.items():
        key = wire_key(field)
        if key in rec:
            value = rec[key]
            if isinstance(fspec, set):
                # boolean fields arrive as the JSON type (true/false); the enum
                # comparison is case-insensitive against the str() representation
                if str(value).lower() not in {v.lower() for v in fspec}:
                    errs.append(f"{path}#L{i}: {name}: {key}={value!r} outside the closed set")
            elif fspec is None and field.endswith(":int"):
                if not (isinstance(value, int) or (isinstance(value, str) and INT_RE.fullmatch(value))):
                    errs.append(f"{path}#L{i}: {name}: {key} not int")
            elif fspec is None and field.endswith(":boolean"):
                if str(value).lower() not in ("true", "false"):
                    errs.append(f"{path}#L{i}: {name}: {key} not boolean")
        else:
            if (name, field) not in OPTIONAL:
                errs.append(f"{path}#L{i}: {name}: missing mandatory field {key}")
    if "time" in rec and not ISO_RE.match(str(rec["time"])):
        errs.append(f"{path}#L{i}: time is not ISO-8601")
    return errs


def main():
    paths = [Path(a) for a in sys.argv[1:]] or sorted(Path(".claude/tmp").glob("*/events.jsonl"))
    errors, total = [], 0
    for path in paths:
        for i, line in enumerate(path.read_text(encoding="utf-8").splitlines(), 1):
            line = line.strip()
            if not line:
                continue
            total += 1
            try:
                rec = json.loads(line)
            except json.JSONDecodeError as e:
                errors.append(f"{path}#L{i}: bad json: {e}")
                continue
            errors.extend(validate_line(str(path), i, rec))
    for e in errors:
        print(e)
    print(f"events={total} invalid={len(errors)}")
    sys.exit(1 if errors else 0)


if __name__ == "__main__":
    main()
