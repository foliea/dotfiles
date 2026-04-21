#!/bin/sh
set -e

sh "$(dirname "$0")/../shared/install.sh"

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
  ghostty \
  orbstack \
  discord

# Enable Touch ID for sudo
sudo-touchid

# Aerospace
rm -rf "$HOME/.config/aerospace"
mkdir -p "$HOME/.config/aerospace"
cp "$PWD/os/macOS/config/aerospace.toml" "$HOME/.config/aerospace/aerospace.toml"

