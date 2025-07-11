#!/bin/sh
set -e

rm -rf "$HOME/.tmux"
ln -sf $PWD/tmux $HOME/.tmux
ln -sf $PWD/tmux/tmux.conf $HOME/.tmux.conf

plugins_dir="$HOME/.tmux/plugins"
mkdir -p $plugins_dir

tpm_dir="$plugins_dir/tpm"

if [ ! -d $tpm_dir ]; then
	git clone https://github.com/tmux-plugins/tpm $tpm_dir
fi

# Install tmux plugins
$tpm_dir/bin/install_plugins

rm -rf "$HOME/.config/tmux"
ln -sf "$PWD/tmux" "$HOME/.config/tmux"
