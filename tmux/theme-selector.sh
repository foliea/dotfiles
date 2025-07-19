#!/bin/sh
set -e

THEMES_DIR="$HOME/.config/themes"
DEFAULT_THEME_DIR="$THEMES_DIR/default"

# List all .json files except default.json
SELECTED=$(find -L "$THEMES_DIR" -maxdepth 1 -type d ! -name 'themes' ! -name 'default' -exec basename {} \; | fzf --prompt="Select a theme: ")

if [ -z "$SELECTED" ]; then
	echo "No theme selected."
	exit 1
fi

rm -rf "$DEFAULT_THEME_DIR"
mkdir -p "$DEFAULT_THEME_DIR"
cp -r "$THEMES_DIR/$SELECTED"/* "$DEFAULT_THEME_DIR/"

sh "$DEFAULT_THEME_DIR/git-delta.sh"

if command -v wezterm >/dev/null 2>&1; then
	touch "$HOME/.config/wezterm/wezterm.lua"
fi

# Reload tmux config if tmux is running
if command -v tmux >/dev/null 2>&1 && tmux list-sessions >/dev/null 2>&1; then
	tmux source-file ~/.tmux.conf
fi
echo "Theme $SELECTED set as default."
