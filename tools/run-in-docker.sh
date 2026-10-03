#!/usr/bin/env bash
# Project container runner: any project tool runs in Docker only
# (the execution boundary: project code never runs on the host).
#
# usage: run-in-docker.sh [--image <img>] [--playwright] <repo-dir> <command...>
#   --image      image (default: $RUN_IN_DOCKER_IMAGE; exit 2 when unset)
#   --playwright the playwright image profile (opt-in)
#   repo-dir     the clone directory in projects/; a relative name resolves against
#                <script-dir>/../../projects/; an absolute path overrides
#
# Examples:
#   tools/run-in-docker.sh projects/<clone> <command...>
#   tools/run-in-docker.sh --image <img> projects/<clone> <command...>
#   tools/run-in-docker.sh --playwright projects/<clone> <command...>
set -euo pipefail

image=
extra_env=()
while [ $# -gt 0 ]; do
  case "$1" in
    --image) image=$2; shift 2 ;;
    --playwright) image=mcr.microsoft.com/playwright:v1.62.1; shift ;;
    *) break ;;
  esac
done
[ $# -ge 2 ] || { grep -E '^# (usage|\s+--)' "$0" >&2; exit 2; }
image=${image:-"${RUN_IN_DOCKER_IMAGE:-}"}
[ -n "$image" ] || { grep -E '^# (usage|\s+--)' "$0" >&2; exit 2; }
repo=$1; shift

# A relative repo name resolves against the script's ../../projects/ base;
# an absolute path overrides (the case branch below).
case "$repo" in
  /*) repo_abs=$repo ;;
  *) repo_abs=$(cd "$(dirname "$0")/../../projects/$repo" && pwd) ;;
esac
name=$(basename "$repo_abs")
store="pnpm-store-$name"

docker image inspect "$image" >/dev/null 2>&1 || docker pull "$image" >/dev/null

# dns-result-order applies to the plain-node image family only; php:*/composer:* images: composer home and cache on the volume store.
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
