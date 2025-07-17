#!/bin/sh
set -e

# WezTerm
mkdir -p "$HOME/.config/wezterm"
ln -sf "$PWD/os/shared/wezterm.lua" "$HOME/.config/wezterm/wezterm.lua"
ln -sf "$HOME/.config/themes/default/wezterm.json" "$HOME/.config/wezterm/wezterm.json"

# GitHub CLI Extensions
gh extension install dlvhdr/gh-dash
