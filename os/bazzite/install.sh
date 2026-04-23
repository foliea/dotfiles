#!/bin/sh
set -e

sh "$(dirname "$0")/../shared/install.sh"

# Fira Code Nerd Font via COPR
sudo dnf copr enable -y che/nerd-fonts
sudo rpm-ostree install -A firacode-nf

# Ghostty (Flatpak — preferred on atomic desktops over rpm-ostree layering)
flatpak install --assumeyes --noninteractive flathub com.mitchellh.ghostty

echo "Done. Reboot required."
