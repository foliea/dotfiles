#!/bin/sh
set -e

# Ghostty
rm -rf "$HOME/.config/ghostty"
mkdir -p "$HOME/.config/ghostty"
cp "$PWD/os/shared/config/ghostty/config" "$HOME/.config/ghostty/config"

if command -v omarchy-version >/dev/null 2>&1; then
  echo "config-file = ?\"$HOME/.config/omarchy/current/theme/ghostty.conf\"" >"$HOME/.config/ghostty/theme.conf"
else
  curl -fsSL "https://raw.githubusercontent.com/foliea/omarchy-madness-theme/master/ghostty.conf" \
    -o "$HOME/.config/ghostty/theme.conf"
fi
