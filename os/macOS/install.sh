#!/bin/sh
set -e

brew install --cask nikitabobko/tap/aerospace

# Aerospace
mkdir -p "$HOME/.config/aerospace"
ln -sf "$PWD/os/macOs/aerospace.toml" "$HOME/.config/aerospace/aerospace.toml"
