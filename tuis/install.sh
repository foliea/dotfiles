#!/bin/sh
set -e

# OS-specific config paths
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

# btop
mkdir -p "$HOME/.config/btop/themes"
ln -sf "$PWD/tuis/btop.conf" "$HOME/.config/btop/btop.conf"
ln -sf "$HOME/.config/themes/default/btop.theme" "$HOME/.config/btop/themes/default.theme"

# k9s
mkdir -p "$K9S_CONFIG_SUPPORT/skins"
ln -sf "$HOME/.config/themes/default/k9s.yaml" "$K9S_CONFIG_SUPPORT/skins/default.yaml"
ln -sf "$PWD/tuis/k9s/config.yaml" "$K9S_CONFIG_SUPPORT/config.yaml"

# lazygit
mkdir -p "$LAZYGIT_CONFIG_SUPPORT"
ln -sf "$PWD/tuis/lazygit/config.yml" "$LAZYGIT_CONFIG_SUPPORT/config.yml"

# lazydocker
mkdir -p "$LAZYDOCKER_CONFIG_SUPPORT"
ln -sf "$PWD/tuis/lazydocker/config.yml" "$LAZYDOCKER_CONFIG_SUPPORT/config.yml"

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
rm -rf "$HOME/.config/opencode/prompts"
ln -sf "$PWD/tuis/opencode/prompts" "$HOME/.config/opencode/prompts"
