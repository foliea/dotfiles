#!/bin/sh
set -e

rm -rf "$HOME/.config/mise"
cp -r "$PWD/mise" "$HOME/.config/mise"

mise trust "$HOME/.config/mise/config.toml" >/dev/null 2>&1

# RTK integrations for AI CLIs
mise install rtk
mise exec -- rtk init --global --hook-only --auto-patch
mise exec -- rtk init --global --agent cursor --hook-only --no-patch
mise exec -- rtk init --global --opencode --hook-only --no-patch
mise exec -- rtk init --global --gemini --hook-only --auto-patch
mise exec -- rtk init --global --codex
mise exec -- rtk init --global --agent pi --hook-only --auto-patch
mise exec -- rtk init --global --agent vibe --hook-only --auto-patch
