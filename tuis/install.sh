#!/bin/sh
set -e

# btop
mkdir -p $HOME/.config/btop/themes

ln -sf "$PWD/tuis/btop/themes/tomorrow-night-eighties.theme" $HOME/.config/btop/themes/tomorrow-night-eighties.theme

# k9s
OS="$(uname -s)"

if [ "$OS" = "Darwin" ]; then
	K9S_CONFIG_SUPPORT="$HOME/Library/Application Support/k9s"
elif [ "$OS" = "Linux" ]; then
	K9S_CONFIG_SUPPORT="$HOME/.config/k9s"
else
	echo "Unsupported OS: $OS"
	exit 1
fi

mkdir -p "$K9S_CONFIG_SUPPORT/skins"
ln -sf "$PWD/tuis/k9s/skins/tomorrow-night-eighties.yaml" "$K9S_CONFIG_SUPPORT/skins/tomorrow-night-eighties.yaml"
ln -sf "$PWD/tuis/k9s/config.yaml" "$K9S_CONFIG_SUPPORT/config.yaml"

# yazi
rm -rf "$HOME/.config/yazi"
ln -sf "$PWD/tuis/yazi/" "$HOME/.config/yazi"

# gh-dash
mkdir -p "$HOME/.config/gh-dash"
ln -sf "$PWD/tuis/gh-dash/config.yml" "$HOME/.config/gh-dash/config.yml"
