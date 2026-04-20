#!/bin/sh
set -e

brew install \
  mpv \
  desktoppr \
  artginzburg/tap/sudo-touchid

brew install --cask \
  font-fira-code-nerd-font \
  nikitabobko/tap/aerospace \
  hiddenbar \
  scroll-reverser \
  caffeine \
  visual-studio-code \
  wezterm \
  orbstack \
  discord

# Enable Touch ID for sudo
sudo-touchid

# WezTerm
rm -rf "$HOME/.config/wezterm"
mkdir -p "$HOME/.config/wezterm"
cp -r "$PWD/os/macOs/config/wezterm.lua" "$HOME/.config/wezterm/wezterm.lua"

# Aerospace
rm -rf "$HOME/.config/aerospace"
mkdir -p "$HOME/.config/aerospace"
cp "$PWD/os/macOs/config/aerospace.toml" "$HOME/.config/aerospace/aerospace.toml"