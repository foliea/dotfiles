#!/bin/sh
set -e

sh "$(dirname "$0")/../shared/configure.sh"

# Create fake OrbStack init file to prevent fish-lsp warnings
mkdir -p "$HOME/.orbstack/shell"
touch "$HOME/.orbstack/shell/init2.fish"
