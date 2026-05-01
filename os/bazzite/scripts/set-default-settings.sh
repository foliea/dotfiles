#!/bin/sh
set -e

# Workspace configuration
dconf write /org/gnome/mutter/dynamic-workspaces false
dconf write /org/gnome/desktop/wm/preferences/num-workspaces 5

# Workspace indicator settings
dconf write /org/gnome/shell/extensions/workspace-indicator/embed-previews false

# Set black wallpaper
dconf write /org/gnome/desktop/background/picture-options "'none'"
dconf write /org/gnome/desktop/background/color-shading-type "'solid'"
dconf write /org/gnome/desktop/background/primary-color "'#000000'"
dconf write /org/gnome/desktop/background/secondary-color "'#000000'"

# Enable extensions
gnome-extensions enable forge@jmmaranan.com 2>/dev/null || true
gnome-extensions enable workspace-indicator@gnome-shell-extensions.gcampax.github.com 2>/dev/null || true
