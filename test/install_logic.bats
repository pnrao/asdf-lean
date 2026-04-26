#!/usr/bin/env bats

setup() {
  REPO_DIR="$(cd "$(dirname "$BATS_TEST_FILENAME")/.." && pwd)"
  BIN_DIR="$REPO_DIR/bin"

  TEST_TEMP_DIR="$(mktemp -d)"
  DOWNLOAD_PATH="$TEST_TEMP_DIR/download"
  INSTALL_PATH="$TEST_TEMP_DIR/install"

  mkdir -p "$DOWNLOAD_PATH"
  mkdir -p "$INSTALL_PATH"

  # Create a dummy file in download path
  echo "dummy lean binary" >"$DOWNLOAD_PATH/lean"
}

teardown() {
  rm -rf "$TEST_TEMP_DIR"
}

@test "install copies files from download to install path" {
  export ASDF_INSTALL_TYPE="version"
  export ASDF_INSTALL_VERSION="4.0.0"
  export ASDF_INSTALL_PATH="$INSTALL_PATH"
  export ASDF_DOWNLOAD_PATH="$DOWNLOAD_PATH"

  run "$BIN_DIR/install"
  [ "$status" -eq 0 ]
  [ -f "$INSTALL_PATH/lean" ]
  [ "$(cat "$INSTALL_PATH/lean")" == "dummy lean binary" ]
}

@test "install fails if install type is not version" {
  export ASDF_INSTALL_TYPE="ref"
  export ASDF_INSTALL_VERSION="master"
  export ASDF_INSTALL_PATH="$INSTALL_PATH"
  export ASDF_DOWNLOAD_PATH="$DOWNLOAD_PATH"

  run "$BIN_DIR/install"
  [ "$status" -eq 1 ]
  [[ "$output" =~ "supports release installs only" ]]
}
