#!/bin/sh
set -e

cp "$PWD/bash/bashrc" "$HOME/.bashrc"
cp "$PWD/bash/bash_profile" "$HOME/.bash_profile"

rm -rf "$HOME/.config/bash"
mkdir -p "$HOME/.config/bash"
cp "$PWD/bash/brew" "$HOME/.config/bash/brew"
cp "$PWD/bash/functions" "$HOME/.config/bash/functions"
cp "$PWD/bash/aliases" "$HOME/.config/bash/aliases"

mkdir -p "$HOME/.config/bash/fns"
cp -r "$PWD/bash/fns"/* "$HOME/.config/bash/fns/"
