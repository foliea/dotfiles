#!/bin/sh
set -e

WIN_USER=$(cmd.exe /C 'echo %USERNAME%' 2>/dev/null | tr -d '\r')

if [ -z "$WIN_USER" ]; then
    echo "Error: Could not determine Windows username. Please ensure cmd.exe is accessible."
    exit 1
fi

WEZTERM_SOURCE_PATH="$PWD/os/shared/wezterm.lua"
WEZTERM_DEST_DIR="/mnt/c/Users/$WIN_USER/.config/wezterm"
WEZTERM_DEST_FILE="$WEZTERM_DEST_DIR/wezterm.lua"

mkdir -p "$WEZTERM_DEST_DIR"
cp "$WEZTERM_SOURCE_PATH" "$WEZTERM_DEST_FILE"
