#!/bin/sh
set -e

sh "$(dirname "$0")/../shared/configure.sh"

# Aerospace
mkdir -p "$HOME/.config/aerospace"
ln -sf "$PWD/os/macOs/aerospace.toml" "$HOME/.config/aerospace/aerospace.toml"
