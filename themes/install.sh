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

THEME_BASE_URL="https://raw.githubusercontent.com/foliea/omarchy-madness-theme/master"

# Themes
if ! command -v omarchy-version > /dev/null 2>&1; then
	mkdir -p "$HOME/.config/btop/themes"
	curl -fsSL "$THEME_BASE_URL/btop.theme" -o "$HOME/.config/btop/themes/current.theme"
	mkdir -p "$HOME/.config/nvim/lua/plugins"
	curl -fsSL "$THEME_BASE_URL/neovim.lua" -o "$HOME/.config/nvim/lua/plugins/theme.lua"
fi
mkdir -p "$K9S_CONFIG_SUPPORT/skins"
rm -f "$K9S_CONFIG_SUPPORT/skins/current.yaml"
cp "$PWD/themes/k9s.yaml" "$K9S_CONFIG_SUPPORT/skins/current.yaml"
