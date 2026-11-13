#!/usr/bin/env bash
#ddev-generated
set -euo pipefail

TARGET_VERSION="${PI_CLAUDE_CODE_VERSION:-latest}"
CONFIG_DIR="/var/www/html/.ddev/pi/claude"

# Ensure persistent config directory exists in .ddev/pi/claude (host-persisted, gitignored)
mkdir -p "${CONFIG_DIR}"

# Ensure .ddev/pi/claude is excluded from git
if [ -f "/var/www/html/.ddev/pi/.gitignore" ] && ! grep -q "^claude" "/var/www/html/.ddev/pi/.gitignore"; then
  printf "\nclaude\n" >> "/var/www/html/.ddev/pi/.gitignore"
fi

# Create symlink for ~/.claude if missing or pointing elsewhere
CURRENT_CLAUDE_LINK="$(readlink "${HOME}/.claude" 2>/dev/null || true)"
if [ "${CURRENT_CLAUDE_LINK}" != "${CONFIG_DIR}" ]; then
  rm -rf "${HOME}/.claude"
  ln -sf "${CONFIG_DIR}" "${HOME}/.claude"
fi

# Create symlink for ~/.claude.json if missing or pointing elsewhere
CURRENT_JSON_LINK="$(readlink "${HOME}/.claude.json" 2>/dev/null || true)"
if [ "${CURRENT_JSON_LINK}" != "${CONFIG_DIR}/.claude.json" ]; then
  rm -f "${HOME}/.claude.json"
  ln -sf "${CONFIG_DIR}/.claude.json" "${HOME}/.claude.json"
fi

# Install/update @anthropic-ai/claude-code only if missing or if a specific version is requested
SHOULD_INSTALL=0
if ! command -v claude >/dev/null 2>&1; then
  SHOULD_INSTALL=1
elif [ "${TARGET_VERSION}" != "latest" ]; then
  INSTALLED_VERSION="$(claude --version 2>/dev/null | awk '{print $NF}' || true)"
  if [ "${INSTALLED_VERSION}" != "${TARGET_VERSION}" ]; then
    SHOULD_INSTALL=1
  fi
fi

if [ "${SHOULD_INSTALL}" -eq 1 ]; then
  echo "[entrypoint.d] Installing @anthropic-ai/claude-code@${TARGET_VERSION}..."
  /usr/bin/npm install -g "@anthropic-ai/claude-code@${TARGET_VERSION}"
fi

# Ensure pi-claude-code extension is installed globally in Pi
if ! pi list 2>/dev/null | grep -q "pi-claude-code"; then
  echo "[entrypoint.d] Installing pi-claude-code extension into Pi global scope..."
  pi install https://github.com/earendil-works/pi-claude-code
fi
