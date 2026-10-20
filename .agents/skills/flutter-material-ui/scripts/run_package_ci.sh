#!/bin/bash
# Runs a package's tests exactly like CI (scripts/tests/tests.sh), one package at a time,
# with a watchdog that reports and kills a hanging run.
#
# ORIGIN: dtc-flutter monorepo (fvm + very_good + scripts/tests). Not wired for this single-
# package repo as-is — adapt paths/tooling before use. Kept as the CI-equivalent pattern.
#
# Usage (from the repo root):
#   LIMIT=600 bash .claude/skills/flutter-material-ui/scripts/run_package_ci.sh packages/foo packages/bar
#
# On HANG: rerun that package with `flutter test --concurrency 1 --reporter expanded`;
# the last printed test is the one that hangs. After killing a run, `pkill -f flutter_tester`
# clears orphans that would otherwise hold the Flutter lock and make later runs look hung.
set -uo pipefail

ROOT="$(git rev-parse --show-toplevel)"
export PATH="$ROOT/.fvm/flutter_sdk/bin:$ROOT/.fvm/flutter_sdk/bin/cache/dart-sdk/bin:$HOME/.pub-cache/bin:$PATH"
export CI=true GITHUB_ACTIONS=true
LIMIT="${LIMIT:-480}"
LOG_DIR="$(mktemp -d)"

for pkg in "$@"; do
  log="$LOG_DIR/$(echo "$pkg" | tr '/' '_').log"
  "$ROOT/scripts/tests/generate_coverage_helper.sh" "$ROOT/$pkg" \
    "$(grep '^name:' "$ROOT/$pkg/pubspec.yaml" | cut -d' ' -f2)" >/dev/null 2>&1
  start=$(date +%s)
  ( cd "$ROOT/$pkg" && exec very_good test --coverage --min-coverage 0 --no-optimization --concurrency 2 \
      --exclude-coverage "**/*.g.dart" --exclude-coverage "**/*.freezed.dart" \
      --exclude-coverage "**/*.mocks.dart" --dart-define=CI=true ) >"$log" 2>&1 &
  pid=$!
  while kill -0 "$pid" 2>/dev/null; do
    if [ $(( $(date +%s) - start )) -ge "$LIMIT" ]; then
      echo "HANG $pkg (>${LIMIT}s), last test: $(tr '\r' '\n' <"$log" | grep -aE '^[0-9]+:[0-9]+ \+' | tail -1)"
      pkill -P "$pid"; kill "$pid"; pkill -f flutter_tester; break
    fi
    sleep 5
  done
  wait "$pid" 2>/dev/null; rc=$?
  echo "DONE $pkg rc=$rc $(( $(date +%s) - start ))s $(tr '\r' '\n' <"$log" | grep -aE 'All tests passed|Some tests failed' | tail -1)  log: $log"
done
