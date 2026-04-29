#!/bin/sh
set -e

rm -rf "$HOME/.config/nvim"
cp -r "$PWD/nvim" "$HOME/.config/nvim"

if command -v omarchy-version >/dev/null 2>&1; then
  rm -f "$HOME/.config/nvim/lua/plugins/theme.lua"
  ln -s "$HOME/.config/omarchy/current/theme/neovim.lua" "$HOME/.config/nvim/lua/plugins/theme.lua"
else
  curl -fsSL "https://raw.githubusercontent.com/foliea/omarchy-madness-theme/master/neovim.lua" \
    -o "$HOME/.config/nvim/lua/plugins/theme.lua"
fi
