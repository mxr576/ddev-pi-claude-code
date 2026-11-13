[![add-on registry](https://img.shields.io/badge/DDEV-Add--on_Registry-blue)](https://addons.ddev.com)
[![tests](https://github.com/mxr576/ddev-pi-claude-code/actions/workflows/tests.yml/badge.svg?branch=main)](https://github.com/mxr576/ddev-pi-claude-code/actions/workflows/tests.yml?query=branch%3Amain)
[![last commit](https://img.shields.io/github/last-commit/mxr576/ddev-pi-claude-code)](https://github.com/mxr576/ddev-pi-claude-code/commits)
[![release](https://img.shields.io/github/v/release/mxr576/ddev-pi-claude-code)](https://github.com/mxr576/ddev-pi-claude-code/releases/latest)

# DDEV Pi Claude Code

## Overview

This add-on integrates Pi Claude Code into your [DDEV](https://ddev.com/) project.

## Installation

```bash
ddev add-on get mxr576/ddev-pi-claude-code
ddev restart
```

After installation, make sure to commit the `.ddev` directory to version control.

## Usage

| Command | Description |
| ------- | ----------- |
| `ddev describe` | View service status and used ports for Pi Claude Code |
| `ddev logs -s pi-claude-code` | Check Pi Claude Code logs |

## Advanced Customization

To change the Docker image:

```bash
ddev dotenv set .ddev/.env.pi-claude-code --pi-claude-code-docker-image="ddev/ddev-utilities:latest"
ddev add-on get mxr576/ddev-pi-claude-code
ddev restart
```

Make sure to commit the `.ddev/.env.pi-claude-code` file to version control.

All customization options (use with caution):

| Variable | Flag | Default |
| -------- | ---- | ------- |
| `PI_CLAUDE_CODE_DOCKER_IMAGE` | `--pi-claude-code-docker-image` | `ddev/ddev-utilities:latest` |

## Credits

**Contributed and maintained by [@mxr576](https://github.com/mxr576)**
