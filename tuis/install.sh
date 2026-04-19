#!/bin/sh
set -e

OS="$(uname -s)"

if [ "$OS" = "Darwin" ]; then
	K9S_CONFIG_SUPPORT="$HOME/Library/Application Support/k9s"
	LAZYGIT_CONFIG_SUPPORT="$HOME/Library/Application Support/lazygit"
	LAZYDOCKER_CONFIG_SUPPORT="$HOME/Library/Application Support/lazydocker"
elif [ "$OS" = "Linux" ]; then
	K9S_CONFIG_SUPPORT="$HOME/.config/k9s"
	LAZYGIT_CONFIG_SUPPORT="$HOME/.config/lazygit"
	LAZYDOCKER_CONFIG_SUPPORT="$HOME/.config/lazydocker"
else
	echo "Unsupported OS: $OS"
	exit 1
fi

rm -f "$HOME/.config/btop/btop.conf"
cp "$PWD/tuis/btop.conf" "$HOME/.config/btop/btop.conf"
if [ -f "$HOME/.config/themes/default/btop.theme" ]; then
  mkdir -p "$HOME/.config/btop/themes"
	cp "$HOME/.config/themes/default/btop.theme" "$HOME/.config/btop/themes/current.theme"
fi

mkdir -p "$K9S_CONFIG_SUPPORT/skins"
rm -f "$K9S_CONFIG_SUPPORT/config.yaml"
cp "$PWD/tuis/k9s/config.yaml" "$K9S_CONFIG_SUPPORT/config.yaml"
if [ -f "$HOME/.config/themes/default/k9s.yaml" ]; then
	cp "$HOME/.config/themes/default/k9s.yaml" "$K9S_CONFIG_SUPPORT/skins/current.yaml"
fi

mkdir -p "$LAZYGIT_CONFIG_SUPPORT"
rm -rf "$LAZYGIT_CONFIG_SUPPORT"/*
cp -r "$PWD/tuis/lazygit"/* "$LAZYGIT_CONFIG_SUPPORT/"

mkdir -p "$LAZYDOCKER_CONFIG_SUPPORT"
rm -rf "$LAZYDOCKER_CONFIG_SUPPORT"/*
cp -r "$PWD/tuis/lazydocker"/* "$LAZYDOCKER_CONFIG_SUPPORT/"

mkdir -p "$HOME/.config/fastfetch"
rm -rf "$HOME/.config/fastfetch"/*
cp -r "$PWD/tuis/fastfetch"/* "$HOME/.config/fastfetch/"

mkdir -p "$HOME/.config/opencode"
rm -rf "$HOME/.config/opencode"/*
cp -r "$PWD/tuis/opencode"/* "$HOME/.config/opencode/"
