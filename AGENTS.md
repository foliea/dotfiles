# AGENTS.md

This file provides guidance to agentic coding agents when working with this dotfiles repository.

## Commands

### Build/Test/Lint
- `make` - Install all configurations (fish, bash, git, nvim, tmux, vscode, tuis)
- `make test` - Run integration tests using expect script (tests full installation flow)
- `make <module>` - Install specific module (e.g., `make nvim`, `make fish`)
- No single test command - this is a configuration repository, not a code project

### Module Installation
- Each module has `./module/install.sh` script for individual installation
- Installation creates symlinks from module directories to appropriate config locations

## Code Style Guidelines

### Shell Scripts (Bash/Fish)
- Use `#!/bin/sh` for POSIX compatibility in install scripts
- Always include `set -e` for error handling
- Use double quotes for variables: `"$HOME/.config"`
- Prefer absolute paths and explicit directory creation with `mkdir -p`

### Lua (Neovim)
- Follow existing modular structure: separate files for plugins, options, lsp, keymaps
- Use `pcall()` for optional plugin configurations to prevent errors
- Stylua formatting enforced (excludes nvim/plugins/** per .styluaignore)
- Prefer explicit requires over autoloading

### Configuration Files
- Use consistent indentation (tabs for tmux, spaces for most others)
- Comment configuration sections clearly
- Follow existing naming patterns for files and directories
- Maintain cross-platform compatibility where possible