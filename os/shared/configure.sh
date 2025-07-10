#!/bin/sh
set -e

# WezTerm
mkdir -p "$HOME/.config/wezterm"
ln -sf "$PWD/os/shared/wezterm.lua" "$HOME/.config/wezterm/wezterm.lua"

# Fastfetch
mkdir -p "$HOME/.config/fastfetch"
ln -sf "$PWD/os/shared/fastfetch.jsonc" "$HOME/.config/fastfetch/config.jsonc"

# GitHub CLI Extensions
gh extension install dlvhdr/gh-dash
