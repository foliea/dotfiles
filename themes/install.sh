#!/bin/sh
set -e

# Themes
if [ ! -d "$HOME/.local/share/omarchy" ]; then
	mkdir -p "$HOME/.config/btop/themes"
	cp "$PWD/themes/btop.theme" "$HOME/.config/btop/themes/current.theme"
	mkdir -p "$HOME/.config/nvim/lua/plugins"
	cp "$PWD/themes/neovim.lua" "$HOME/.config/nvim/lua/plugins/theme.lua"
fi
mkdir -p "$HOME/.config/k9s/skins"
cp "$PWD/themes/k9s.yaml" "$HOME/.config/k9s/skins/current.yaml"
