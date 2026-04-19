#!/bin/sh
set -e

rm -f "$HOME/.config/starship.toml"
cp "$PWD/starship/starship.toml" "$HOME/.config/starship.toml"
