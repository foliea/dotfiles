#!/bin/sh
set -e

ln -s $PWD/tmux $HOME/.tmux
ln -s $PWD/tmux/tmux.conf $HOME/.tmux.conf

git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
