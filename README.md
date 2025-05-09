# dotfiles

[![Run tests on macOS](https://github.com/foliea/dotfiles/actions/workflows/test-macOS.yml/badge.svg)](https://github.com/foliea/dotfiles/actions/workflows/test-macOS.yml)
[![Run tests on Ubuntu](https://github.com/foliea/dotfiles/actions/workflows/test-ubuntu.yml/badge.svg)](https://github.com/foliea/dotfiles/actions/workflows/test-ubuntu.yml)

My personal configuration files for setting up and managing development environments across macOS and Linux systems.

<img src="/images/env.png" width="350"/>

## Table of Contents

- [Overview](#overview)
- [Dependencies](#dependencies)
- [Installation](#installation)
- [Post-installation](#post-installation)
- [Reinstallation](#reinstallation)
- [Uninstallation](#uninstallation)
- [Features](#features)
- [Contributing](#contributing)

## Overview

This repository contains configuration files and scripts to automate the setup of development environments. It includes:

- Shell configurations (Fish shell)
- Vim and Tmux setups
- System-specific dependencies for macOS and Ubuntu
- Git configurations
- VS Code extensions and settings

## Dependencies

To install every dependency required:

- **macOS**: See the [macOS script](os/macOS/dependencies.sh).
- **Ubuntu 22.04**: See the [Ubuntu script](os/ubuntu/dependencies.sh).

```bash
./os/macOS/dependencies.sh
```

> **Note**: The `os/arch` scripts were designed to install everything on a minimal Arch Linux CLI installation, including the window manager and applications. However, it is now deprecated and may not work as expected.

## Installation

Run the following command to install the dotfiles:

```bash
make
```

> If you encounter an error indicating that a configuration file already exists, please follow the [Reinstallation](#reinstallation) instructions.

## Post-installation

After installation, complete the following steps:

1. Change your login shell to Fish:
   ```bash
   chsh -s $(which fish) $USER
   ```
2. Spawn a new login shell.
3. Install Vim plugins using [vim-plug](https://github.com/junegunn/vim-plug).
4. Install Tmux plugins using [TPM](https://github.com/tmux-plugins/tpm).

## Reinstallation

To reinstall the dotfiles, run:

```bash
make re
```

## Uninstallation

To remove the dotfiles, run:

```bash
make clean
```

## Features

- **Cross-platform support**: Works on macOS and Ubuntu.
- **Custom shell setup**: Includes Fish shell configurations and plugins.
- **Editor configurations**: Preconfigured Vim and VS Code settings.
- **Tmux enhancements**: Includes plugins for better terminal multiplexing.
- **Automated setup**: Scripts to install dependencies and configure the environment.

## Contributing

Contributions are welcome! Feel free to open issues or submit pull requests to improve this repository.
