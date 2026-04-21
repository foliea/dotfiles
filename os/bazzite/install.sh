#!/bin/sh
set -e

sh "$(dirname "$0")/../shared/install.sh"

# Ghostty (Flatpak — preferred on atomic desktops over rpm-ostree layering)
flatpak install --assumeyes --noninteractive flathub com.mitchellh.ghostty
