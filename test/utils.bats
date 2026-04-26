#!/usr/bin/env bats

setup() {
  REPO_DIR="$(cd "$(dirname "$BATS_TEST_FILENAME")/.." && pwd)"
  LIB_DIR="$REPO_DIR/lib"
  
  # Mock fail function to just exit so bats can capture it
  fail() {
    exit 1
  }
}

@test "get_platform identifies linux" {
  OSTYPE="linux-gnu"
  source "$LIB_DIR/utils.sh"
  result=$(get_platform)
  [ "$result" == "linux" ]
}

@test "get_platform identifies darwin" {
  OSTYPE="darwin21"
  source "$LIB_DIR/utils.sh"
  result=$(get_platform)
  [ "$result" == "darwin" ]
}

@test "get_arch_suffix identifies x86_64" {
  uname() { echo "x86_64"; }
  export -f uname
  source "$LIB_DIR/utils.sh"
  result=$(get_arch_suffix)
  [ "$result" == "" ]
  unset -f uname
}

@test "get_arch_suffix identifies aarch64" {
  uname() { echo "aarch64"; }
  export -f uname
  source "$LIB_DIR/utils.sh"
  result=$(get_arch_suffix)
  [ "$result" == "_aarch64" ]
  unset -f uname
}
