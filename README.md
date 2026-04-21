# dotfiles

[![Run tests on macOS](https://github.com/foliea/dotfiles/actions/workflows/test-macOS.yml/badge.svg)](https://github.com/foliea/dotfiles/actions/workflows/test-macOS.yml)
[![Run tests on Ubuntu](https://github.com/foliea/dotfiles/actions/workflows/test-ubuntu.yml/badge.svg)](https://github.com/foliea/dotfiles/actions/workflows/test-ubuntu.yml)

My personal configuration files for macOS and Linux.

## Dependencies

Install required dependencies before configuring:

```bash
# macOS (requires brew)
./os/macOS/dependencies.sh

# Ubuntu (includes brew installation)
./os/ubuntu/dependencies.sh

# Bazzite
./os/bazzite/dependencies.sh

# Omarchy
./os/omarchy/dependencies.sh
```

Requires [Homebrew](https://brew.sh/) or [Linuxbrew](https://docs.brew.sh/Homebrew-on-Linux).

## Install

```bash
make
```