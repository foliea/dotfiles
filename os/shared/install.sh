#!/bin/sh
set -e

# Ghostty (skip on Omarchy, which manages its own ghostty config)
if ! command -v omarchy-version > /dev/null 2>&1; then
  rm -rf "$HOME/.config/ghostty"
  mkdir -p "$HOME/.config/ghostty"
  cp "$PWD/os/shared/config/ghostty/config" "$HOME/.config/ghostty/config"
fi
