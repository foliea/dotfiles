#!/bin/sh
set -e

# btop
mkdir -p "$HOME/.config/btop/themes"
ln -sf "$PWD/tuis/btop.conf" "$HOME/.config/btop/btop.conf"
ln -sf "$HOME/.config/themes/default/btop.theme" "$HOME/.config/btop/themes/default.theme"

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
ln -sf "$HOME/.config/themes/default/k9s.yaml" "$K9S_CONFIG_SUPPORT/skins/default.yaml"
ln -sf "$PWD/tuis/k9s/config.yaml" "$K9S_CONFIG_SUPPORT/config.yaml"

# lazygit
mkdir -p "$HOME/.config/lazygit"
ln -sf "$PWD/tuis/lazygit/config.yml" "$HOME/.config/lazygit/config.yml"

# lazydocker
mkdir -p "$HOME/.config/lazydocker"
ln -sf "$PWD/tuis/lazydocker/config.yml" "$HOME/.config/lazydocker/config.yml"

# yazi
rm -rf "$HOME/.config/yazi"
ln -sf "$PWD/tuis/yazi/" "$HOME/.config/yazi"
ln -sf "$HOME/.config/themes/default/yazi.toml" "$HOME/.config/yazi/flavors/default.yazi/flavor.toml"

# gh-dash
mkdir -p "$HOME/.config/gh-dash"
ln -sf "$HOME/.config/themes/default/gh-dash.yml" "$HOME/.config/gh-dash/config.yml"

# fastfetch
mkdir -p "$HOME/.config/fastfetch"
ln -sf "$PWD/tuis/fastfetch.jsonc" "$HOME/.config/fastfetch/config.jsonc"

# opencode
mkdir -p "$HOME/.config/opencode/themes"
ln -sf "$PWD/tuis/opencode/opencode.json" "$HOME/.config/opencode/opencode.json"
ln -sf "$HOME/.config/themes/default/opencode.json" "$HOME/.config/opencode/themes/default.json"
