#!/usr/bin/env bash
set -euo pipefail

TARGET_VERSION="${PI_CLAUDE_CODE_VERSION:-latest}"

# Ensure requested version of @anthropic-ai/claude-code is installed
echo "[entrypoint.d] Ensuring @anthropic-ai/claude-code@${TARGET_VERSION} is installed..."
/usr/bin/npm install -g "@anthropic-ai/claude-code@${TARGET_VERSION}"

# Ensure pi-claude-code extension is installed globally in Pi
if ! pi list 2>/dev/null | grep -q "pi-claude-code"; then
  echo "[entrypoint.d] Installing pi-claude-code extension into Pi global scope..."
  pi install https://github.com/earendil-works/pi-claude-code
fi
