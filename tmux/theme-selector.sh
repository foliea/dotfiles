#!/bin/sh
set -e

THEMES_DIR="$HOME/.config/themes"
DEFAULT_THEME_DIR="$THEMES_DIR/default"
SCRIPT_DIR="$(dirname "$(readlink -f "$0")")"
REPO_ROOT="$(dirname "$SCRIPT_DIR")"

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
	tmux source-file ~/.config/tmux/tmux.conf
fi

# Check if running inside WSL
if grep -qEi "WSL" /proc/version; then
	# Check if Windows tools are installed
	if command -v glazewm.exe >/dev/null 2>&1 || command -v zebar.exe >/dev/null 2>&1; then
		sh "$REPO_ROOT/os/windows/configure.sh"
	fi
fi

echo "Theme $SELECTED set as default."
