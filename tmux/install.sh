#!/bin/sh
set -e

ln -s $PWD/tmux/tmux-colors.conf $HOME/.tmux-colors.conf
ln -s $PWD/tmux/tmux.conf $HOME/.tmux.conf
ln -s $PWD/tmux $HOME/.tmux

git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm

