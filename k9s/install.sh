#!/bin/sh
set -e

OS="$(uname -s)"

if [ "$OS" = "Darwin" ]; then
  K9S_CONFIG_SUPPORT="$HOME/Library/Application Support/k9s"
elif [ "$OS" = "Linux" ]; then
  K9S_CONFIG_SUPPORT="$HOME/.config/k9s"
else
  echo "Unsupported OS: $OS"
  exit 1
fi

mkdir -p "$K9S_CONFIG_SUPPORT/skins"
ln -sf "$PWD/k9s/skins/tomorrow-night-eighties.yaml" "$K9S_CONFIG_SUPPORT/skins/tomorrow-night-eighties.yaml"
ln -sf "$PWD/k9s/config.yaml" "$K9S_CONFIG_SUPPORT/config.yaml"