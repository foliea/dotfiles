#!/bin/sh
set -e

MADNESS_THEME_URL="https://raw.githubusercontent.com/foliea/omarchy-madness-theme/master"

if [ "$(uname -s)" = "Darwin" ]; then
  CONFIG_DIR="$HOME/Library/Application Support"
else
  CONFIG_DIR="$HOME/.config"
fi

install_tuis() (
  for tui in $1; do
    tui_config_dir="$2/$tui"

    mkdir -p "$tui_config_dir"
    rm -rf "${tui_config_dir:?}"/*
    cp -r "$PWD/tuis/$tui"/* "$tui_config_dir/"
  done
)

install_tuis "k9s lazygit lazydocker" "$CONFIG_DIR"

install_tuis "yazi opencode" "$HOME/.config"

# Install the Madness theme, then let RTK configure its Claude hook.
mkdir -p "$HOME/.claude/themes"
curl -fsSL "$MADNESS_THEME_URL/claude.json" \
  -o "$HOME/.claude/themes/madness.json"
printf '{"theme":"custom:madness"}\n' >"$HOME/.claude/settings.json"
mise exec -- rtk init --global --hook-only --auto-patch

if ! command -v omarchy-version >/dev/null 2>&1; then
  install_tuis "fastfetch" "$HOME/.config/fastfetch"

  mkdir -p "$HOME/.config/btop/themes"
  curl -fsSL "$MADNESS_THEME_URL/btop.theme" \
    -o "$HOME/.config/btop/themes/current.theme"
fi
