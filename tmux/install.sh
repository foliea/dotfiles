#!/bin/sh
set -e

ln -sf $PWD/tmux $HOME/.tmux
ln -sf $PWD/tmux/tmux.conf $HOME/.tmux.conf

tpm_dir="$HOME/.tmux/plugins"

if [ ! -d $tpm_dir ]; then
  git clone https://github.com/tmux-plugins/tpm $tpm_dir
fi
