#!/usr/bin/env bats

setup() {
  # Get the absolute path to the bin directory
  BIN_DIR="$(cd "$(dirname "$BATS_TEST_FILENAME")/../bin" && pwd)"
}

@test "list-all returns a list of versions" {
  run "$BIN_DIR/list-all"
  [ "$status" -eq 0 ]
  # Check if it looks like a space-separated list of versions
  [[ "$output" =~ [0-9]+\.[0-9]+\.[0-9]+ ]]
}

@test "latest-stable returns a stable version" {
  run "$BIN_DIR/latest-stable"
  [ "$status" -eq 0 ]
  # Stable versions shouldn't have hyphens (no -rc, -m, etc.)
  [[ ! "$output" =~ "-" ]]
  [[ "$output" =~ [0-9]+\.[0-9]+\.[0-9]+ ]]
}
