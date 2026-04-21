#!/bin/sh
set -e

# Ghostty
rm -rf "$HOME/.config/ghostty"
mkdir -p "$HOME/.config/ghostty"
cp "$PWD/os/shared/config/ghostty/config" "$HOME/.config/ghostty/config"
