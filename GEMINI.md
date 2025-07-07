# Gemini Codebase Analysis for AI Contributors

This document provides a technical overview of the `dotfiles` repository, optimized for AI-driven development and contribution.

## 1. Project Goal

To provide a modular, cross-platform (macOS and Linux) set of configuration files for a consistent and efficient development environment, managed via a central `Makefile`.

## 2. Core Technologies

- **Shell:** Fish (primary), Bash (fallback)
- **Prompt:** Starship
- **Editor:** Neovim (configured with Lua)
- **Terminal Multiplexer:** Tmux
- **Language Version Manager:** mise
- **Package Manager:** Homebrew (for both macOS and Linux)
- **Containerization:** Docker
- **Automation:** Make, Shell scripts

## 3. Project Structure Overview

The repository is structured into modules, each corresponding to a specific tool or group of tools (e.g., `nvim`, `tmux`, `tuis`). A central `Makefile` orchestrates the installation of these modules. The `os/` directory is a special, cross-cutting module that handles system-level dependencies and shared configurations.

## 4. OS-Specific and Shared Configurations (`os/`)

This directory is critical for managing the cross-platform nature of the dotfiles. It is structured as follows:

-   **`os/shared/`**: Contains configurations and dependencies that are common to all supported operating systems.
-   **`os/macOS/`** and **`os/linux/`**: Contain dependencies specific to each operating system. Their respective `dependencies.sh` scripts first execute the `os/shared/dependencies.sh` script and then install any OS-specific packages.
-   **`os/windows/`**: Contains setup scripts and configurations specifically for a WSL (Windows Subsystem for Linux) environment.

### Dependency Installation Strategy

When adding new dependencies, adhere to the following priority order:

1.  **Core Utilities (`curl`, `wget`)**: These should ideally be installed manually or via a script to `$HOME/.local/bin` to ensure they are available before other package managers run. This is the preferred convention.
2.  **Homebrew (Primary)**: For all other packages, **Homebrew is the preferred package manager** for both macOS and Linux. Add new packages to the `brew install` list in the appropriate `dependencies.sh` script.
3.  **APT (Fallback for Docker)**: The `Dockerfile` uses `apt-get` for bootstrapping the container environment. Only add packages here if they are essential for the Docker image build process and are not available via Homebrew on Linux.

## 5. Key Module Files and Entry Points

This table maps each primary module to its main configuration and installation files.

| Module | Primary Config File(s) | Installation Script |
| :--- | :--- | :--- |
| **Bash** | `bash/bashrc`, `bash/bash_profile` | `bash/install.sh` |
| **Fish** | `fish/config.fish`, `fish/fish_plugins` | `fish/install.sh` |
| **Git** | `git/gitignore` | `git/install.sh` |
| **Neovim** | `nvim/init.lua`, `nvim/lua/` | `nvim/install.sh` |
| **Tmux** | `tmux/tmux.conf` | `tmux/install.sh` |
| **VS Code**| `vscode/settings.json`, `vscode/keybindings.json` | `vscode/install.sh` |
| **TUIs** | `tuis/` (directory) | `tuis/install.sh` |
| **Docker** | `Dockerfile` | N/A |

## 6. Development and Testing

To ensure changes are valid and non-breaking, follow this workflow:

1.  **Install Dependencies:** Run the appropriate script from the `os/` directory.
2.  **Install Configurations:** Use `make` or `make <module>`.
3.  **Run Tests:** The primary test suite is executed via `make test` or `./run-tests.exp`.

## 7. Guidance for AI Contributors

### How to Add a New Tool Configuration

1.  **Categorize the Tool**: First, determine where the new tool's configuration should live.
    -   Is it a major, standalone application (like an editor or shell)? Place it in a new directory at the **root level** (e.g., `newtool/`).
    -   Is it a Terminal User Interface (TUI) application? Place it in a new subdirectory within the **`tuis/`** directory (e.g., `tuis/newtui/`).

2.  **Create Configuration Files**: Add the tool's configuration files to its new directory.

3.  **Update Installation Logic**:
    -   **For a top-level tool**: Create an `install.sh` in the new directory and add the tool's name to the `MODULES` variable in the root `Makefile`.
    -   **For a TUI tool**: Modify the existing `tuis/install.sh` to add the setup logic for the new TUI.

4.  **Add Dependencies**: Add the necessary packages by following the **Dependency Installation Strategy** outlined in Section 4.

5.  **Verify**: Run `make <module>` and `make test` to ensure the changes are correctly implemented and do not break existing setups.

### How to Modify an Existing Configuration

1.  **Identify the relevant files** using the tables and descriptions above.
2.  **Read the files** to understand context and conventions.
3.  **Apply changes** and re-run the installation for that module (e.g., `make nvim`).
4.  **Verify** with `make test`.

## 8. Language Server Protocol (LSP) and Formatting

This section details the LSP servers and formatters configured in the repository.

### Language Servers

| Language | LSP Server | Installation Method | Configuration File(s) | Notes |
| :--- | :--- | :--- | :--- | :--- |
| **Ruby** | `solargraph` | `default-gems` (via `mise`) | `nvim/lua/lsp.lua` | Uses project-local version if available, otherwise global. |
| **TypeScript/JavaScript** | `typescript-language-server` | `default-npm-packages` (via `mise`) | `nvim/lua/lsp.lua` | Uses project-local version if available, otherwise global. |
| **Bash** | `bash-language-server` | Homebrew | `nvim/lua/lsp.lua` | |
| **Docker** | `dockerls` | Homebrew | `nvim/lua/lsp.lua` | |
| **Prisma** | `@prisma/language-server` | `default-npm-packages` (via `mise`) | `nvim/lua/lsp.lua` | Official distribution via npm. |
| **JSON** | `vscode-json-languageserver` | Homebrew | `nvim/lua/lsp.lua` | |
| **Lua** | `lua-language-server` | Homebrew | `nvim/lua/lsp.lua` | |
| **Fish** | `fish-lsp` | Homebrew | `nvim/lua/lsp.lua` | |

### Formatters

| Language | Formatter | Installation Method | Configuration File(s) | Notes |
| :--- | :--- | :--- | :--- | :--- |
| **Lua** | `stylua` | Homebrew | `nvim/init.lua` | |
| **JavaScript** | `prettierd`, `prettier` | Homebrew | `nvim/init.lua` | Uses project-local version if available, otherwise global. |
| **TypeScript** | `prettierd`, `prettier` | Homebrew | `nvim/init.lua` | Uses project-local version if available, otherwise global. |
| **Shell** | `shfmt` | Homebrew | `nvim/init.lua` | Covers Bash scripts. |
| **Makefile** | `beautysh` | Homebrew | `nvim/init.lua` | |
| **Dockerfile** | `beautysh` | Homebrew | `nvim/init.lua` | |
| **Fish** | `fish_indent` | Homebrew (part of `fish` package) | `nvim/init.lua` | |
| **Ruby** | `rubocop` | `default-gems` (via `mise`) | `nvim/init.lua` | Uses project-local version if available, otherwise global. |
| **Python** | `ruff` | Homebrew | `nvim/init.lua` | |
