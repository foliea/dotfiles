#!/bin/sh
set -e

THEMES_DIR="$HOME/.config/omamad/themes"

# List all .json files except default.json
SELECTED=$(find -L "$THEMES_DIR" -maxdepth 1 -type d ! -name 'themes' ! -name 'default' -exec basename {} \; | fzf --prompt="Select a theme: ")

if [ -z "$SELECTED" ]; then
	echo "No theme selected."
	exit 1
fi

rm -rf "$THEMES_DIR/default"
mkdir -p "$THEMES_DIR/default"
cp -r "$THEMES_DIR/$SELECTED"/* "$THEMES_DIR/default/"
echo "Theme $SELECTED set as default."
