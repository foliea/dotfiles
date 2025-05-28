#!/bin/sh
set -e

mkdir -p "$HOME/.config/bash"

ln -sf "$PWD/bash/bashrc" "$HOME/.bashrc"
ln -sf "$PWD/bash/bash_profile" "$HOME/.bash_profile"
ln -sf "$PWD/bash/prompt.bash" "$HOME/.config/bash/prompt.bash"
