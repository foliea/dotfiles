# dotfiles

[![Run tests on macOS](https://github.com/foliea/dotfiles/actions/workflows/test-macOS.yml/badge.svg)](https://github.com/foliea/dotfiles/actions/workflows/test-macOS.yml)
[![Run tests on linux](https://github.com/foliea/dotfiles/actions/workflows/test-linux.yml/badge.svg)](https://github.com/foliea/dotfiles/actions/workflows/test-linux.yml)

My personal configuration files for macOS and linux.

## Dependencies

Requires [Homebrew](https://brew.sh/) (except Omarchy).

Install required dependencies before configuring:

```bash
# macOS
./os/macOS/dependencies.sh

# Any linux distribution but Omarchy
./os/shared/dependencies.sh

# Omarchy
./os/omarchy/dependencies.sh
```

## Install

```bash
make
```
