#!/bin/sh
set -e

bash="$PWD/bash"

ln -s $bash/prompt $HOME/.bash-git-prompt
ln -s $bash/bashrc $HOME/.bashrc