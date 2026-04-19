#!/bin/sh
set -e

# Themes
rm -rf "$HOME/.config/themes"
mkdir -p "$HOME/.config/themes"
cp -r "$PWD/themes" "$HOME/.config/themes"
rm -rf "$HOME/.config/themes/default"
cp -r "$PWD/themes/Madness" "$HOME/.config/themes/default"

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
