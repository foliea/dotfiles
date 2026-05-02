# dotfiles

[![Run tests on macOS](https://github.com/foliea/dotfiles/actions/workflows/test-macOS.yml/badge.svg)](https://github.com/foliea/dotfiles/actions/workflows/test-macOS.yml)
[![Run tests on Bazzite](https://github.com/foliea/dotfiles/actions/workflows/test-bazzite.yml/badge.svg)](https://github.com/foliea/dotfiles/actions/workflows/test-bazzite.yml)

My personal configuration files for macOS and Linux.

## Dependencies

Install required dependencies before configuring:

```bash
# macOS (requires brew)
./os/macOS/dependencies.sh

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