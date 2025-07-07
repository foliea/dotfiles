# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## Commands

### Installation and Setup
- `make` - Install all configurations (fish, bash, git, nvim, tmux, vscode, tuis)
- `make <module>` - Install specific module (e.g., `make nvim`, `make fish`)
- `make test` - Run tests using expect script
- `make help` - Show available targets

### Dependencies
- `./os/macOS/dependencies.sh` - Install macOS dependencies via Homebrew
- `./os/linux/dependencies.sh` - Install Linux dependencies via Homebrew
- `./os/shared/dependencies.sh` - Install shared dependencies (automatically called by OS-specific scripts)

### Module-specific Installation
Each module has its own `install.sh` script:
- `./fish/install.sh` - Install Fish shell configuration
- `./bash/install.sh` - Install Bash configuration  
- `./git/install.sh` - Install Git configuration
- `./nvim/install.sh` - Install Neovim configuration
- `./tmux/install.sh` - Install Tmux configuration
- `./vscode/install.sh` - Install VS Code configuration
- `./tuis/install.sh` - Install TUI configurations (btop, k9s, yazi)

### Testing
- `make test` - Run the test suite using `scripts/run-tests.exp`

## Architecture

### Repository Structure
This is a **modular dotfiles repository** with the following key components:

#### Core Modules (`/`)
- **fish/**: Fish shell configuration, plugins, and functions
- **bash/**: Bash configuration and profile setup
- **git/**: Git configuration and ignore files
- **nvim/**: Neovim configuration with extensive plugin setup via vim-plug
- **tmux/**: Tmux configuration with plugins (tmux-fingers, tmux-resurrect, tmux-yank, tpm)
- **vscode/**: VS Code extensions and settings
- **tuis/**: Terminal UI applications (btop, k9s, yazi) with custom themes

#### OS-Specific Configurations (`/os/`)
- **shared/**: Common dependencies and configurations (starship, wezterm, mise tool versions)
- **macOS/**: macOS-specific dependencies and configurations (aerospace window manager)
- **linux/**: Linux-specific dependencies and configurations
- **windows/**: Windows-specific configurations (GlazeWM, PowerToys, Windows Terminal)

#### Legacy (`/misc/`)
- **arch/**: Deprecated Arch Linux configurations (window manager, applications)

### Key Technologies
- **Shell**: Fish as primary shell, Bash as fallback
- **Editor**: Neovim with extensive LSP support and 50+ plugins
- **Terminal Multiplexer**: Tmux with custom plugins
- **Package Management**: Homebrew for dependencies, mise for runtime version management
- **Version Control**: Git with hub integration
- **Container Tools**: Docker, Kubernetes (k9s, kubectx, kubeseal, helm)
- **Cloud Tools**: AWS CLI
- **Language Servers**: Comprehensive LSP setup for Ruby, Python, JavaScript/TypeScript, Bash, Fish, Dockerfile, JSON

### Plugin Management
- **Neovim**: Uses vim-plug for plugin management with 50+ plugins including LSP, treesitter, telescope, and copilot
- **Tmux**: Uses TPM (Tmux Plugin Manager) for plugin management
- **Fish**: Uses Fisher for plugin management

### Development Workflow
1. Dependencies are installed via Homebrew (cross-platform)
2. Runtime versions (Ruby, Node.js, Terraform) managed via mise
3. Configurations are symlinked to appropriate locations
4. Each module can be installed independently or all at once
5. Post-installation requires changing login shell to Fish

### Cross-Platform Support
- Primary support for macOS and Linux (including WSL 2)
- Requires Homebrew for Linux installations
- Windows support via specific configurations but not primary focus
- Modular design allows partial installation on any platform