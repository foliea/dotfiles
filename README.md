# dotfiles

[![Run tests on macOS](https://github.com/foliea/dotfiles/actions/workflows/test-macOS.yml/badge.svg)](https://github.com/foliea/dotfiles/actions/workflows/test-macOS.yml)
[![Run tests on Ubuntu](https://github.com/foliea/dotfiles/actions/workflows/test-ubuntu.yml/badge.svg)](https://github.com/foliea/dotfiles/actions/workflows/test-ubuntu.yml)

My personal configuration files for setting up and managing development environments across macOS and Linux systems.

<img src="/misc/images/windows_2025.png" width="350"/>

## Table of Contents

- [Overview](#overview)
- [Dependencies](#dependencies)
- [Installation](#installation)
- [Post-installation](#post-installation)
- [Features](#features)
- [Contributing](#contributing)

## Overview

This repository contains configuration files and scripts to automate the setup of development environments across multiple platforms. It includes:

- **Cross-platform core**: Shared configurations for terminal (WezTerm), prompt (Starship), and development tools
- **Shell configurations**: Fish and Bash with custom functions and plugins
- **Editor setups**: Neovim with Lua configuration and VS Code settings
- **Window management**: Tiling window managers with consistent keybindings (Aerospace for macOS, GlazeWM for Windows)
- **Platform-specific optimizations**: Native configurations for macOS, Linux, and Windows (including WSL 2)
- **Development toolchain**: Language servers, formatters, and package managers via Mise

## Installation

### Prerequisites

Before installing any configurations, install the required dependencies:

```bash
# macOS
./os/macOS/dependencies.sh

# Linux
./os/linux/dependencies.sh
```

This installs essential tools (git, neovim, tmux, fish, etc.) needed by the dotfiles configurations.

You need to install [Homebrew](https://brew.sh/)/[Linuxbrew](https://docs.brew.sh/Homebrew-on-Linux) first.
For Ubuntu 24.04 users, you can use `./os/linux/ubuntu.sh`.

### Install Configurations

This repository is **modular**: you can install all configurations at once, or install only the components you need.

#### Install everything

```bash
make
```

#### Install a specific component

You can install only a specific configuration by running its target. For example:

```bash
make nvim     # Install only Neovim configuration
make fish     # Install only Fish shell configuration
make bash     # Install only Bash configuration
make git      # Install only Git configuration
make tmux     # Install only Tmux configuration
make vscode   # Install only VS Code configuration
make tuis     # Install only TUI configuration
```

## Post-installation

After installation, complete the following steps:

1. Change your login shell to Fish:
   ```bash
   chsh -s $(which fish) $USER
   ```
2. Spawn a new login shell.

## Platform Applications

The `os/` directory contains platform-specific application installations and configurations, separate from the terminal-based dotfiles above.

### Install Applications
Then configure platform-specific applications:

```bash
# macOS - Aerospace window manager, system preferences
./os/macOS/install.sh && ./os/macOS/configure.sh

# Linux - System configurations
./os/linux/install.sh && ./os/linux/configure.sh

# Windows - PowerToys, GlazeWM, Zebar (run from Windows host)
./os/windows/install.sh && ./os/windows/configure.sh
```

### Shared Tools
Cross-platform applications with consistent configuration:
- **WezTerm**: Terminal with unified theming and WSL integration
- **Starship**: Shell prompt with custom symbols and git integration
- **Mise**: Version manager for Ruby, Node.js, Terraform
- **Package managers**: Consistent tooling via default gems/npm packages

## Features

- **Multi-platform consistency**: Identical development experience across macOS, Linux, and Windows (WSL 2) using Homebrew and shared configurations
- **Unified window management**: Consistent tiling window manager keybindings across all platforms
- **Custom shell setup**: Fish and Bash configurations with cross-platform prompt (Starship)
- **Editor configurations**: Neovim with Lua and VS Code with synchronized settings
- **TUI applications**: Preconfigured btop, k9s, yazi, gh-dash, and more
- **Terminal experience**: WezTerm with platform-specific optimizations and consistent theming
- **Development toolchain**: Mise for version management, comprehensive LSP support, and automated package installation
- **Modular installation**: Install everything or specific components as needed

## Contributing

Contributions are welcome! Feel free to open issues or submit pull requests to improve this repository.
