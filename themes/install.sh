#!/bin/sh
set -e

OS="$(uname -s)"

if [ "$OS" = "Darwin" ]; then
	K9S_CONFIG_SUPPORT="$HOME/Library/Application Support/k9s"
elif [ "$OS" = "Linux" ]; then
	K9S_CONFIG_SUPPORT="$HOME/.config/k9s"
else
	echo "Unsupported OS: $OS"
	exit 1
fi

# Themes
if [ ! -d "$HOME/.local/share/omarchy" ]; then
	mkdir -p "$HOME/.config/btop/themes"
	cp "$PWD/themes/btop.theme" "$HOME/.config/btop/themes/current.theme"
	mkdir -p "$HOME/.config/nvim/lua/plugins"
	cp "$PWD/themes/neovim.lua" "$HOME/.config/nvim/lua/plugins/theme.lua"
fi
mkdir -p "$K9S_CONFIG_SUPPORT/skins"
rm -f "$K9S_CONFIG_SUPPORT/skins/current.yaml"
cp "$PWD/themes/k9s.yaml" "$K9S_CONFIG_SUPPORT/skins/current.yaml"
