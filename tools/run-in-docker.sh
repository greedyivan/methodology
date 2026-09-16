#!/usr/bin/env bash
# Project container runner: any project tool runs in Docker only
# (the execution boundary: project code never runs on the host).
#
# usage: run-in-docker.sh [--image <img>] [--playwright] <repo-dir> <command...>
#   --image      image (default: node:24-bookworm-slim)
#   --playwright mcr.microsoft.com/playwright:<ver> — chromium+firefox+webkit
#                + system deps (the upstream CI profile); the version is pinned below
#   repo-dir     the clone directory in projects/; a relative name resolves against
#                <script-dir>/../../projects/ (the workspace instance layout);
#                an absolute path overrides
#
# Environment lessons (a real container-gate series, 2026-08):
#   - ipv4first (NODE_OPTIONS=--dns-result-order) was a fix for node:24-slim
#     (localhost → ::1 listen vs 127.0.0.1 fetch), but in the playwright image it breaks
#     browser-multiple (the server reports 127.0.0.1 instead of localhost) — do not set;
#   - corepack shim in /tmp/bin (pnpm is not pre-linked; enable in /usr/local is unavailable
#     under an unprivileged uid);
#   - pnpm-store volume via npm_config_store_dir — not via XDG_DATA_HOME
#     (relocating XDG pulls the tool's api-token onto the volume mount, breaking /@fs/ 500 vs 403);
#   - uid/gid mapping against root-owned files in the repo; HOME in /tmp; COREPACK_HOME
#     on a volume (gate network crashes with an ephemeral cache — a reconciled lesson).
#
# Examples:
#   workspace-repo/tools/run-in-docker.sh projects/<clone> pnpm install --frozen-lockfile
#   workspace-repo/tools/run-in-docker.sh projects/<clone> pnpm build
#   workspace-repo/tools/run-in-docker.sh --playwright projects/<clone> pnpm test:browser:playwright
set -euo pipefail

image=node:24-bookworm-slim
extra_env=()
while [ $# -gt 0 ]; do
  case "$1" in
    --image) image=$2; shift 2 ;;
    --playwright) image=mcr.microsoft.com/playwright:v1.62.1; shift ;;
    *) break ;;
  esac
done
[ $# -ge 2 ] || { grep -E '^# (usage|\s+--)' "$0" >&2; exit 2; }
repo=$1; shift

# A relative repo name resolves against the script's ../../projects/ — the
# workspace instance layout; an absolute path overrides (the case branch below).
case "$repo" in
  /*) repo_abs=$repo ;;
  *) repo_abs=$(cd "$(dirname "$0")/../../projects/$repo" && pwd) ;;
esac
name=$(basename "$repo_abs")
store="pnpm-store-$name"

docker image inspect "$image" >/dev/null 2>&1 || docker pull "$image" >/dev/null

# ipv4first for plain-node images only: in node-slim the localhost resolve yields ::1
# listen against a 127.0.0.1 fetch (edge.test.ts ECONNREFUSED); in the playwright image
# ipv4first breaks browser-multiple (the server reports 127.0.0.1 instead of localhost).
# php images (doctrine/orm): corepack is absent — the chain must not drop exec;
# composer cache on a volume store. composer:* — composer/unzip/git out of the box
# (php:*-cli without zip-ext, and unzip does not unpack the dist).
case "$image" in
  node:*) extra_env=(-e NODE_OPTIONS=--dns-result-order=ipv4first) ;;
  php:*|composer:*) extra_env=(-e COMPOSER_HOME=/tmp/composer -e COMPOSER_CACHE_DIR=/pnpm-data/composer-cache) ;;
  *) extra_env=() ;;
esac

exec docker run --rm --init \
  -v "$repo_abs":/repo \
  -v "$store":/pnpm-data \
  -w /repo -u "$(id -u):$(id -g)" \
  -e CI=true \
  "${extra_env[@]}" \
  -e HOME=/tmp/home -e COREPACK_HOME=/pnpm-data/corepack -e npm_config_store_dir=/pnpm-data/store \
  "$image" \
  bash -lc 'mkdir -p /tmp/bin && (corepack enable --install-directory /tmp/bin >/dev/null 2>&1 || true) && export PATH=/tmp/bin:$PATH && exec "$@"' _ "$@"
