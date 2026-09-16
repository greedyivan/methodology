#!/usr/bin/env python3
import argparse
import hashlib
import json
import re
import sys
import xml.etree.ElementTree as ET
from datetime import datetime, timezone
from pathlib import Path

XES_NS = "http://www.xes-standard.org/"
EXTENSIONS = [
    ("Concept", "concept", "http://www.xes-standard.org/concept.xeswdl"),
    ("Time", "time", "http://www.xes-standard.org/time.xeswdl"),
    ("Organizational", "org", "http://www.xes-standard.org/org.xeswdl"),
    ("Lifecycle", "lifecycle", "http://www.xes-standard.org/lifecycle.xeswdl"),
]
CATALOG = {
    "stage", "checkpoint-emitted", "checkpoint-resolved", "audit-round",
    "audit-verdict", "verify-adjudication", "mn-trigger", "sensor",
    "pr-submitted", "outcome", "land",
    "formation-brief", "spike-started", "spike-completed", "claim-added",
    "knowledge-gap-registered", "monitor-signal",
    "route-decision", "approach-fork",
}
ROUTE_RUNGS = {"tool-executed", "tool-assisted", "tool-verified", "llm-planning"}
FORK_DECISIONS = {"build", "ratify", "one-off", "tool-path"}
FORK_SCOPES = {"class", "case"}

EVENT_VALIDATORS = {
    "route-decision": lambda a: (
        a.get("rung") in ROUTE_RUNGS,
        "rung",
    ),
    "approach-fork": lambda a: (
        a.get("decision") in FORK_DECISIONS and a.get("scope") in FORK_SCOPES,
        "decision/scope",
    ),
}
SENSOR_ENUMS = {
    "kind": {"deviation", "near-miss"},
    "outcome": {"bypass-succeeded", "bypass-failed", "averted"},
    "point": {"in-moment", "post-factum"},
    "stage": {"scope", "specify", "audit", "realize", "verify", "reconcile"},
}
SENSOR_KEY = re.compile(r"^(kind|actor|stage|outcome|point)=(\S+)$")


def q(tag):
    return f"{{{XES_NS}}}{tag}"


def norm_time(value):
    if not value:
        return None
    v = value.strip().replace("+00:00", "Z")
    try:
        datetime.fromisoformat(v.replace("Z", "+00:00"))
        return v
    except ValueError:
        return None


def mtime_iso(path):
    return datetime.fromtimestamp(path.stat().st_mtime, timezone.utc).isoformat().replace("+00:00", "Z")


def typed(key, value):
    if isinstance(value, bool):
        return "boolean", key, str(value).lower()
    if isinstance(value, (int, float)):
        return type(value).__name__, key, str(value)
    s = str(value)
    if re.fullmatch(r"-?\d+", s):
        return "int", key, s
    if re.fullmatch(r"-?\d+\.\d+", s):
        return "float", key, s
    return "string", key, s


def add_attr(el, key, value):
    t, k, s = typed(key, value)
    ET.SubElement(el, t, {"key": k, "value": s})


def event_hash(attrs):
    drop_time = attrs.get("timeSource") != "exact"
    payload = {}
    for k, v in attrs.items():
        if drop_time and k in ("time:timestamp", "timeSource"):
            continue
        payload[k] = typed(k, v)[2]
    return hashlib.sha256(
        json.dumps(payload, sort_keys=True, ensure_ascii=False).encode()
    ).hexdigest()


def known_hashes(trace):
    out = set()
    for ev in trace.findall(q("event")):
        attrs = {ch.get("key"): ch.get("value") for ch in ev}
        out.add(event_hash(attrs))
    return out


def parse_sensor_line(line):
    parts = [p.strip() for p in line.split("|")]
    fields, tail = {}, []
    for p in parts[1:]:
        m = SENSOR_KEY.match(p)
        if m:
            fields[m.group(1)] = m.group(2)
        elif p:
            tail.append(p)
    attrs = {"concept:name": "sensor", "sensor:detail": " | ".join(tail)}
    format_error = False
    for f, allowed in SENSOR_ENUMS.items():
        v = fields.get(f, "")
        attrs[f"sensor:{f}"] = v
        if v not in allowed:
            format_error = True
    if fields.get("actor"):
        attrs["org:resource"] = fields["actor"]
    if format_error:
        attrs["sensor:formatError"] = True
    return attrs


def collect_sensor(tmp_root, slug):
    events = []
    for d in sorted(tmp_root.glob(f"*-{slug}")):
        if not d.is_dir():
            continue
        for md in sorted(d.rglob("*.md")):
            try:
                lines = md.read_text(encoding="utf-8").splitlines()
            except OSError as e:
                print(f"warn: unreadable {md}: {e}", file=sys.stderr)
                continue
            for i, line in enumerate(lines):
                if not line.startswith("SENSOR |"):
                    continue
                attrs = parse_sensor_line(line)
                attrs["time:timestamp"] = mtime_iso(md)
                attrs["timeSource"] = "file-mtime"
                attrs["sensor:carrier"] = f"{md.relative_to(tmp_root)}#L{i + 1}"
                events.append(attrs)
    return events


def collect_jsonl(tmp_root, slug):
    events = []
    for d in sorted(tmp_root.glob(f"*-{slug}")):
        if not d.is_dir():
            continue
        jf = d / "events.jsonl"
        if not jf.is_file():
            continue
        for i, line in enumerate(jf.read_text(encoding="utf-8").splitlines(), 1):
            line = line.strip()
            if not line:
                continue
            try:
                rec = json.loads(line)
            except json.JSONDecodeError:
                print(f"warn: {jf}#L{i}: bad json skipped", file=sys.stderr)
                continue
            if not isinstance(rec, dict) or "event" not in rec:
                print(f"warn: {jf}#L{i}: no event field skipped", file=sys.stderr)
                continue
            name = str(rec["event"])
            attrs = {"concept:name": name}
            if name not in CATALOG:
                print(f"warn: {jf}#L{i}: off-catalog event '{name}'", file=sys.stderr)
                attrs["catalog"] = "off"
            for k, v in rec.items():
                if k in ("event", "time"):
                    continue
                attrs[k] = v
            validator = EVENT_VALIDATORS.get(name)
            if validator:
                ok, field = validator(attrs)
                if not ok:
                    print(f"warn: {jf}#L{i}: event '{name}' invalid {field}", file=sys.stderr)
                    attrs["catalog"] = "off"
            t = norm_time(rec.get("time")) or mtime_iso(jf)
            attrs["time:timestamp"] = t
            attrs["timeSource"] = "exact" if norm_time(rec.get("time")) else "file-mtime"
            events.append(attrs)
    return events


def ensure_log(out_dir):
    ET.register_namespace("", XES_NS)
    for _, prefix, _ in EXTENSIONS:
        ET.register_namespace(prefix, f"http://www.xes-standard.org/{prefix}.xeswdl")
    log = ET.Element(q("log"))
    for name, prefix, uri in EXTENSIONS:
        ET.SubElement(log, q("extension"), {"name": name, "prefix": prefix, "uri": uri})
    return log


def load_or_create(out_file):
    if out_file.is_file():
        tree = ET.parse(out_file)
        return tree.getroot()
    return ensure_log(out_file.parent)


def find_trace(log, slug, trace_attrs):
    for tr in log.findall(q("trace")):
        cn = tr.find(f"{q('string')}[@key='concept:name']")
        if cn is not None and cn.get("value") == slug:
            return tr
    tr = ET.SubElement(log, q("trace"))
    for k, v in trace_attrs.items():
        add_attr(tr, k, v)
    return tr


def main():
    ap = argparse.ArgumentParser()
    ap.add_argument("--project", required=True)
    ap.add_argument("--slug", required=True)
    ap.add_argument("--tmp-root", type=Path, required=True)
    ap.add_argument("--out", type=Path, default=Path("operational-repo/telemetry/xes"))
    ap.add_argument("--trace-attr", action="append", default=[])
    args = ap.parse_args()

    trace_attrs = {"project": args.project, "concept:name": args.slug}
    for item in args.trace_attr:
        if "=" not in item:
            ap.error(f"--trace-attr expects k=v, got: {item}")
        k, v = item.split("=", 1)
        trace_attrs[k] = v

    events = collect_jsonl(args.tmp_root, args.slug) + collect_sensor(args.tmp_root, args.slug)
    events.sort(key=lambda a: (a.get("time:timestamp") or "", a.get("concept:name") or ""))

    args.out.mkdir(parents=True, exist_ok=True)
    out_file = args.out / f"{args.project}--{args.slug}.xes"
    log = load_or_create(out_file)
    trace = find_trace(log, args.slug, trace_attrs)
    seen = known_hashes(trace)
    added = 0
    for attrs in events:
        if event_hash(attrs) in seen:
            continue
        ev = ET.SubElement(trace, q("event"))
        for k in sorted(attrs):
            add_attr(ev, k, attrs[k])
        added += 1

    ET.ElementTree(log).write(out_file, encoding="utf-8", xml_declaration=True)
    print(f"{out_file}: trace={args.slug} sources={len(events)} added={added} total={len(trace.findall(q('event')))}")


if __name__ == "__main__":
    main()
