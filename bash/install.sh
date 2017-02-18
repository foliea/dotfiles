#!/bin/sh
set -e

bash="$PWD/bash"

ln -s $bash/bash_profile $HOME/.bash_profile
ln -s $bash/bashrc $HOME/.bashrc
ln -s $bash/prompt $HOME/.bash-git-prompt
