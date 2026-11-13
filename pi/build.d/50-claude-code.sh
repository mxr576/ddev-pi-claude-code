#!/usr/bin/env bash
#ddev-generated
set -euo pipefail

# Bypass ddev-web-proxy shim to install directly into the pi container
echo "[build.d] Pre-installing @anthropic-ai/claude-code..."
/usr/bin/npm install -g @anthropic-ai/claude-code@latest
