#!/bin/sh
set -e

mkdir -p "$HOME/.config/tmux"
rm -rf "$HOME/.config/tmux"/*
cp -r "$PWD/tmux"/* "$HOME/.config/tmux/"