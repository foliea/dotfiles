#!/bin/sh
set -e

OS="$(uname -s)"
if [ "$OS" = "Darwin" ]; then
  CONFIG_DIR="$HOME/Library/Application Support"
elif [ "$OS" = "Linux" ]; then
  CONFIG_DIR="$HOME/.config"
else
  echo "Unsupported OS: $OS"
  exit 1
fi

for tool in k9s yazi lazygit lazydocker; do
  TOOL_CONFIG_DIR="$CONFIG_DIR/$tool"
  mkdir -p "$TOOL_CONFIG_DIR"
  rm -rf "$TOOL_CONFIG_DIR"/*
  cp -r "$PWD/tuis/$tool"/* "$TOOL_CONFIG_DIR/"
done

mkdir -p "$HOME/.config/fastfetch"
if ! command -v omarchy-version >/dev/null 2>&1; then
  rm -rf "$HOME/.config/fastfetch"/*
  cp -r "$PWD/tuis/fastfetch"/* "$HOME/.config/fastfetch/"
fi

mkdir -p "$HOME/.config/opencode"
rm -rf "$HOME/.config/opencode"/*
cp -r "$PWD/tuis/opencode"/* "$HOME/.config/opencode/"
