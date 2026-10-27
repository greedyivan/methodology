#!/usr/bin/env bash
# baseline-tree.sh — resolves the change's baseline tree per the launch
# directive (or the chain default) and emits the resolution plus, for the
# worktree cases, the setup command. The script resolves and validates; it
# does not mutate the repository (the caller executes SETUP).
#
# Usage: baseline-tree.sh <product-root> [worktree|branch:<name>|commit:<sha>|as-is]
# Output: BASELINE=HEAD | BASELINE=DIRTY | BASELINE=BRANCH:<name> |
#         BASELINE=COMMIT:<sha> | BASELINE=ASIS:<root> | BASELINE=WORKTREE
#         SETUP=git worktree add <path> <start-point>
# Exit:   0 resolved; 2 unknown directive or unresolvable start point.
set -euo pipefail

root="${1:?usage: baseline-tree.sh <product-root> [directive]}"
directive="${2:-}"

if [ -n "$(git -C "$root" status --porcelain)" ]; then state=dirty; else state=clean; fi

case "$directive" in
  "")
    if [ "$state" = clean ]; then
      echo "BASELINE=HEAD"
    else
      echo "BASELINE=DIRTY"
      echo "SETUP=git worktree add <path> HEAD"
    fi
    ;;
  worktree)
    echo "BASELINE=WORKTREE"
    echo "SETUP=git worktree add <path> HEAD"
    ;;
  branch:*)
    b="${directive#branch:}"
    git -C "$root" rev-parse --verify --quiet "$b" >/dev/null \
      || { echo "branch not found: $b" >&2; exit 2; }
    echo "BASELINE=BRANCH:$b"
    ;;
  commit:*)
    c="${directive#commit:}"
    git -C "$root" rev-parse --verify --quiet "$c^{commit}" >/dev/null \
      || { echo "commit not found: $c" >&2; exit 2; }
    echo "BASELINE=COMMIT:$c"
    ;;
  as-is)
    echo "BASELINE=ASIS:$root"
    ;;
  *)
    echo "unknown directive: $directive" >&2
    exit 2
    ;;
esac
