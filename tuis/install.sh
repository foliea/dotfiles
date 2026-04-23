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

install_tools() (
  for tool in "$1"; do
    local tool_config_dir = "$2/$tool"

    echo $tool $tool_config_dir
    #    mkdir -p $tool_config_dir
    #rm -rf $tool_config_dir/*
    #  cp -r "$PWD/tuis/$tool"/* "$tool_config_dir/"
  done
)

install_tools "k9s lazygit lazydocker" "$CONFIG_DIR"
install_tools "yazi opencode" "$HOME/.config"

if ! command -v omarchy-version >/dev/null 2>&1; then
  install_tools "fastfetch" "$HOME/.config"
fi
