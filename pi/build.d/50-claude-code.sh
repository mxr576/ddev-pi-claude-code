#!/usr/bin/env bash
#ddev-generated
set -euo pipefail

# Bypass ddev-web-proxy shim to pre-install @anthropic-ai/claude-code during image build
echo "[build.d] Pre-installing @anthropic-ai/claude-code into image..."
/usr/bin/npm install -g @anthropic-ai/claude-code@latest
