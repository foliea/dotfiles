#!/bin/sh
set -e

rm -rf "$HOME/.config/nvim"
cp -r "$PWD/nvim" "$HOME/.config/nvim"

OMARCHY_THEME="$HOME/.config/omarchy/current/theme/neovim.lua"
if test -f "$OMARCHY_THEME"; then
  rm -f "$HOME/.config/nvim/lua/plugins/theme.lua"
  ln -s "$OMARCHY_THEME" "$HOME/.config/nvim/lua/plugins/theme.lua"
fi
