#!/bin/sh
set -e

rm -rf "$HOME/.config/bash"
mkdir -p "$HOME/.config/bash/fns"

for file in env functions aliases; do
	cp "$PWD/bash/$file" "$HOME/.config/bash/$file"
done
cp -r "$PWD/bash/fns"/* "$HOME/.config/bash/fns/"

cp "$PWD/bash/bashrc" "$HOME/.bashrc"
cp "$PWD/bash/bash_profile" "$HOME/.bash_profile"
