#!/usr/bin/env bash
#ddev-generated
set -euo pipefail

TARGET_VERSION="${PI_CLAUDE_CODE_VERSION:-latest}"

# Ensure persistent config directory exists in .ddev/pi/claude (host-persisted, gitignored)
mkdir -p "/var/www/html/.ddev/pi/claude"

# Ensure .ddev/pi/claude is excluded from git
if [ -f "/var/www/html/.ddev/pi/.gitignore" ] && ! grep -q "^claude" "/var/www/html/.ddev/pi/.gitignore"; then
  echo "claude" >> "/var/www/html/.ddev/pi/.gitignore"
fi

# Symlink ~/.claude and ~/.claude.json to .ddev/pi/claude location for tools with hardcoded paths
if [ ! -L "${HOME}/.claude" ]; then
  rm -rf "${HOME}/.claude"
  ln -sf "/var/www/html/.ddev/pi/claude" "${HOME}/.claude"
fi

if [ ! -L "${HOME}/.claude.json" ]; then
  rm -f "${HOME}/.claude.json"
  ln -sf "/var/www/html/.ddev/pi/claude/claude.json" "${HOME}/.claude.json"
fi

# Ensure requested version of @anthropic-ai/claude-code is installed
echo "[entrypoint.d] Ensuring @anthropic-ai/claude-code@${TARGET_VERSION} is installed..."
/usr/bin/npm install -g "@anthropic-ai/claude-code@${TARGET_VERSION}"

# Ensure pi-claude-code extension is installed globally in Pi
if ! pi list 2>/dev/null | grep -q "pi-claude-code"; then
  echo "[entrypoint.d] Installing pi-claude-code extension into Pi global scope..."
  pi install https://github.com/earendil-works/pi-claude-code
fi
