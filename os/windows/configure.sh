#!/bin/sh
set -e

if ! grep -qEi "WSL" /proc/version; then
    echo "Error: This script is intended to be run inside Windows Subsystem for Linux (WSL)."
    exit 1
fi

WIN_USER=$(cmd.exe /C 'echo %USERNAME%' 2>/dev/null | tr -d '\r')

if [ -z "$WIN_USER" ]; then
    echo "Error: Could not determine Windows username. Please ensure cmd.exe is accessible."
    exit 1
fi

# WezTerm configuration
WEZTERM_DEST_DIR="/mnt/c/Users/$WIN_USER/.config/wezterm"
WEZTERM_DEST_FILE="$WEZTERM_DEST_DIR/wezterm.lua"

mkdir -p "$WEZTERM_DEST_DIR"
cp "$PWD/os/shared/wezterm.lua" "$WEZTERM_DEST_FILE"

# Windows Terminal configuration
WT_SOURCE_PATH="$PWD/os/windows/terminal.json"

# Find the Windows Terminal package directory
WT_PACKAGE_DIR=$(find "/mnt/c/Users/$WIN_USER/AppData/Local/Packages" -maxdepth 1 -type d -name "Microsoft.WindowsTerminal_*" | head -n 1)

if [ -z "$WT_PACKAGE_DIR" ]; then
    echo "Error: Could not find Windows Terminal package directory. Is Windows Terminal installed?"
    exit 1
fi

WT_DEST_DIR="$WT_PACKAGE_DIR/LocalState"
WT_DEST_FILE="$WT_DEST_DIR/settings.json"

mkdir -p "$WT_DEST_DIR"
cp "$WT_SOURCE_PATH" "$WT_DEST_FILE"

# GlazeWM
GLAZE_DEST_DIR="/mnt/c/Users/$WIN_USER/.glzr/"
mkdir -p $GLAZE_DEST_DIR

cp "$PWD/os/windows/glazewm.yaml" "$GLAZE_DEST_DIR/glazewm/config.yaml"

INSTALL_ZEBAR=false
for arg in "$@"; do
    if [ "$arg" = "--with-zebar" ]; then
        INSTALL_ZEBAR=true
        break
    fi
done

if [ "$INSTALL_ZEBAR" = "true" ]; then
    echo "Installing Zebar..."
    rm -rf "$GLAZE_DEST_DIR/zebar"
    cp -r "$PWD/os/windows/zebar" "$GLAZE_DEST_DIR"

    ZEBAR_ROAMING_DIR="/mnt/c/Users/$WIN_USER/AppData/Roaming/zebar"
    rm -rf "$ZEBAR_ROAMING_DIR"
    mkdir -p "$ZEBAR_ROAMING_DIR/downloads"
    cp -r "$PWD/os/windows/neon-folie@0.0.0" "$ZEBAR_ROAMING_DIR/downloads"
else
    echo "Skipping Zebar installation. Use --with-zebar to install."
fi
