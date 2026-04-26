#!/usr/bin/env bash

fail() {
  echo -e "\e[31mFail:\e[m $* 😭"
  exit 1
}

get_platform() {
  case "$OSTYPE" in
    darwin*) echo "darwin" ;;
    linux*) echo "linux" ;;
    *) fail "Unsupported platform: $OSTYPE" ;;
  esac
}

get_arch_suffix() {
  case "$(uname -m)" in
    x86_64) echo "" ;;
    arm64 | aarch64) echo "_aarch64" ;;
    *) fail "Unsupported architecture: $(uname -m)" ;;
  esac
}

check_dependencies() {
  command -v git >/dev/null 2>&1 || fail "git is required"
  command -v curl >/dev/null 2>&1 || fail "curl is required"
  command -v tar >/dev/null 2>&1 || fail "tar is required"
  command -v zstd >/dev/null 2>&1 || fail "zstd is required"

  # Check if tar supports zstd (modern GNU tar or BSD tar)
  # Some older versions might need --zstd explicitly or might not support it at all
  if ! tar --help | grep -q zstd; then
    fail "installed tar does not seem to support zstd archives"
  fi
}
