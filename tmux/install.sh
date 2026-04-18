#!/bin/sh
set -e

mkdir -p "$HOME/.config/tmux"
rm -rf "$HOME/.config/tmux"/*
cp -r "$PWD/tmux"/* "$HOME/.config/tmux/"

PLUGINS_DIR="$HOME/.config/tmux/plugins"
mkdir -p "$PLUGINS_DIR"

TPM_DIR="$PLUGINS_DIR/tpm"
if [ ! -d $TPM_DIR ]; then
	git clone https://github.com/tmux-plugins/tpm $TPM_DIR
fi

$TPM_DIR/bin/install_plugins