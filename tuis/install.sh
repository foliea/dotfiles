#!/bin/sh
set -e

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

if ! command -v omarchy-version >/dev/null 2>&1; then
  install_tuis "fastfetch" "$HOME/.config/fastfetch"

  mkdir -p "$HOME/.config/btop/themes"
  curl -fsSL "https://raw.githubusercontent.com/foliea/omarchy-madness-theme/master/btop.theme" \
    -o "$HOME/.config/btop/themes/current.theme"
fi
