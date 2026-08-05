#!/usr/bin/env bash
set -euo pipefail

HUGO_VERSION="${HUGO_VERSION:-0.161.0}"
HUGO_FLAVOR="${HUGO_FLAVOR:-extended}"
HUGO_BIN_DIR="${HUGO_BIN_DIR:-/tmp/hugo-bin}"

if ! command -v hugo >/dev/null 2>&1; then
  mkdir -p "${HUGO_BIN_DIR}"
  ARCHIVE="hugo_${HUGO_FLAVOR}_${HUGO_VERSION}_linux-amd64.tar.gz"
  URL="https://github.com/gohugoio/hugo/releases/download/v${HUGO_VERSION}/${ARCHIVE}"

  echo "Installing Hugo ${HUGO_VERSION} (${HUGO_FLAVOR})"
  curl -fsSL "${URL}" -o "/tmp/${ARCHIVE}"
  tar -xzf "/tmp/${ARCHIVE}" -C "${HUGO_BIN_DIR}"
  export PATH="${HUGO_BIN_DIR}:$PATH"
fi

echo "Using $(hugo version)"
hugo --gc --minify
