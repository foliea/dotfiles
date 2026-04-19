#!/bin/sh
set -e

# Themes
cp -r "$PWD/themes/btop.theme" "$HOME/.config/btop/themes/current.theme"
cp -r "$PWD/themes/k9s.yaml" "$HOME/.config/k9s/skins/current.yaml"

# Scripts
rm -rf "$HOME/.config/scripts"
cp -r "$PWD/os/shared/scripts" "$HOME/.config/scripts"

# Mise
rm -rf "$HOME/.config/mise"
cp -r "$PWD/os/shared/mise" "$HOME/.config/mise"

# Starship
rm -f "$HOME/.config/starship.toml"
cp "$PWD/os/shared/starship.toml" "$HOME/.config/starship.toml"

# WezTerm
rm -rf "$HOME/.config/wezterm"
cp -r "$PWD/os/shared/wezterm" "$HOME/.config/wezterm"
