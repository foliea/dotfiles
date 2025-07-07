#!/bin/sh
set -e

# WezTerm
mkdir -p "$HOME/.config/wezterm"
ln -sf "$PWD/os/shared/wezterm.lua" "$HOME/.config/wezterm/wezterm.lua"

# GitHub CLI Extensions
gh extension install dlvhdr/gh-dash
