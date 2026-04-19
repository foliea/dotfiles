#!/bin/sh
set -e

rm -rf "$HOME/.config/mise"
cp -r "$PWD/mise" "$HOME/.config/mise"

mise trust "$HOME/.config/mise/config.toml"
