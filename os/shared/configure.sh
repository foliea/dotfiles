#!/bin/sh
set -e

# Themes
rm -rf "$HOME/.config/themes"
ln -sf "$PWD/themes" "$HOME/.config/themes"
rm -rf "$PWD/themes/default"
cp -r "$PWD/themes/Madness" "$HOME/.config/themes/default"

# Scripts
mkdir -p "$HOME/.config/scripts"
cp -r "$PWD/os/shared/scripts/"* "$HOME/.config/scripts/"

# WezTerm
mkdir -p "$HOME/.config/wezterm"
cp -r "$PWD/os/shared/wezterm.lua" "$HOME/.config/wezterm/wezterm.lua"
cp "$HOME/.config/themes/default/wezterm.json" "$HOME/.config/wezterm/wezterm.json"
