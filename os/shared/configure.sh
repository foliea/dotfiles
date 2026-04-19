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
mkdir -p "$HOME/.config/mise"
rm -f "$HOME/.config/mise/config.toml"
cp "$PWD/os/shared/mise.toml" "$HOME/.config/mise/config.toml"

# Starship
rm -f "$HOME/.config/starship.toml"
cp "$PWD/os/shared/starship.toml" "$HOME/.config/starship.toml"

# WezTerm
rm -rf "$HOME/.config/wezterm"
mkdir -p "$HOME/.config/wezterm"
cp "$PWD/os/shared/wezterm.lua" "$HOME/.config/wezterm/wezterm.lua"
