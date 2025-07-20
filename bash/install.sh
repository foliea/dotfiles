#!/bin/sh
set -e

mkdir -p "$HOME/.config/bash"

ln -sf "$PWD/bash/bashrc" "$HOME/.bashrc"
ln -sf "$PWD/bash/bash_profile" "$HOME/.bash_profile"
