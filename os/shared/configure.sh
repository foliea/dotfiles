#!/bin/sh
set -e

# Themes
mkdir -p "$HOME/.config/btop/themes"
if [ ! -f "$HOME/.config/btop/themes/current.theme" ]; then
	cp "$PWD/themes/btop.theme" "$HOME/.config/btop/themes/current.theme"
fi
mkdir -p "$HOME/.config/k9s/skins"
if [ ! -f "$HOME/.config/k9s/skins/current.yaml" ]; then
	cp "$PWD/themes/k9s.yaml" "$HOME/.config/k9s/skins/current.yaml"
fi

# Mise
rm -rf "$HOME/.config/mise"
cp -r "$PWD/os/shared/mise" "$HOME/.config/mise"
