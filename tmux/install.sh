#!/bin/sh
set -e

rm -f "$HOME/.tmux.conf"
rm -rf "$HOME/.config/tmux"
ln -sf "$PWD/tmux" "$HOME/.config/tmux"

PLUGINS_DIR="$HOME/.config/tmux/plugins"
mkdir -p $PLUGINS_DIR

TPM_DIR="$PLUGINS_DIR/tpm"
if [ ! -d $TPM_DIR ]; then
	git clone https://github.com/tmux-plugins/tpm $TPM_DIR
fi

# Install tmux plugins
$TPM_DIR/bin/install_plugins
