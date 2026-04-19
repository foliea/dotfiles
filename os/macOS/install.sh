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
cp -r "$PWD/os/macOs/wezterm" "$HOME/.config/wezterm"

# Aerospace
mkdir -p "$HOME/.config/aerospace"
ln -sf "$PWD/os/macOs/aerospace.toml" "$HOME/.config/aerospace/aerospace.toml"

