#!/bin/sh
set -e

# Themes
if command -v omarchy-version >/dev/null 2>&1; then
  omarchy-theme-install "https://github.com/foliea/omarchy-madness-theme"
  omarchy-theme-set "Madness"

  echo "config-file = ?\"$HOME/.config/omarchy/current/theme/ghostty.conf\"" > "$HOME/.config/ghostty/theme.conf"
  sed -i 's/font-size = 13/font-size = 9.1/' "$HOME/.config/ghostty/config"
else
  THEME_BASE_URL="https://raw.githubusercontent.com/foliea/omarchy-madness-theme/master"

  mkdir -p "$HOME/.config/btop/themes"
  curl -fsSL "$THEME_BASE_URL/btop.theme" -o "$HOME/.config/btop/themes/current.theme"
  mkdir -p "$HOME/.config/nvim/lua/plugins"
  curl -fsSL "$THEME_BASE_URL/neovim.lua" -o "$HOME/.config/nvim/lua/plugins/theme.lua"
  mkdir -p "$HOME/.config/ghostty"
  curl -fsSL "$THEME_BASE_URL/ghostty.conf" -o "$HOME/.config/ghostty/theme.conf"
fi

if [ -d "$HOME/Library/Application Support/k9s" ]; then
  K9S_CONFIG_SUPPORT="$HOME/Library/Application Support/k9s"
else
  K9S_CONFIG_SUPPORT="$HOME/.config/k9s"
fi

mkdir -p "$K9S_CONFIG_SUPPORT/skins"
rm -f "$K9S_CONFIG_SUPPORT/skins/current.yaml"
cp "$PWD/themes/k9s.yaml" "$K9S_CONFIG_SUPPORT/skins/current.yaml"
