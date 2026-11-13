[![add-on registry](https://img.shields.io/badge/DDEV-Add--on_Registry-blue)](https://addons.ddev.com)
[![tests](https://github.com/mxr576/ddev-pi-claude-code/actions/workflows/tests.yml/badge.svg?branch=main)](https://github.com/mxr576/ddev-pi-claude-code/actions/workflows/tests.yml?query=branch%3Amain)
[![last commit](https://img.shields.io/github/last-commit/mxr576/ddev-pi-claude-code)](https://github.com/mxr576/ddev-pi-claude-code/commits)
[![release](https://img.shields.io/github/v/release/mxr576/ddev-pi-claude-code)](https://github.com/mxr576/ddev-pi-claude-code/releases/latest)

# DDEV Pi Claude Code

## Overview

This DDEV add-on integrates [pi-claude-code](https://github.com/earendil-works/pi-claude-code) into your DDEV project's [ddev-pi](https://github.com/mxr576/ddev-pi) environment, allowing you to use your Claude subscription directly within the Pi Coding Agent.

## Dependencies

This add-on extends [mxr576/ddev-pi](https://github.com/mxr576/ddev-pi). `ddev-pi` will be installed automatically if not already present.

## Installation

```bash
ddev add-on get mxr576/ddev-pi-claude-code
ddev restart && ddev start --profiles=pi
```

After installation, make sure to commit the `.ddev` directory to version control.

## Authentication

Authenticate the Claude Code CLI inside the `pi` service:

```bash
ddev pi-claude-login
```

Follow the browser prompt to log in with your Anthropic/Claude account. Credentials are persisted across container restarts in the project's `pi` container volume.

## Usage

| Command | Description |
| ------- | ----------- |
| `ddev pi-claude-login` | Authenticate Claude Code CLI in the `pi` container |
| `ddev pi` | Launch interactive Pi Coding Agent session with `pi-claude-code` enabled |

## Configuration & Version Pinning

You can specify or pin the `@anthropic-ai/claude-code` version using the `PI_CLAUDE_CODE_VERSION` environment variable in `.ddev/.env.pi-claude-code`:

```bash
ddev dotenv set .ddev/.env.pi-claude-code --pi-claude-code-version="0.2.29"
ddev restart && ddev start --profiles=pi
```

All customization options:

| Variable | Flag | Default | Description |
| -------- | ---- | ------- | ----------- |
| `PI_CLAUDE_CODE_VERSION` | `--pi-claude-code-version` | `latest` | Version of `@anthropic-ai/claude-code` npm package to install |

## Credits

**Contributed and maintained by [@mxr576](https://github.com/mxr576)**
