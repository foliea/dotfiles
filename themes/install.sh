#!/bin/sh
set -e

# Themes
if [ ! -d "$HOME/.local/share/omarchy" ]; then
	mkdir -p "$HOME/.config/btop/themes"
	cp "$PWD/themes/btop.theme" "$HOME/.config/btop/themes/current.theme"
fi
mkdir -p "$HOME/.config/k9s/skins"
cp "$PWD/themes/k9s.yaml" "$HOME/.config/k9s/skins/current.yaml"
