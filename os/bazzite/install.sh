#!/bin/sh
set -e

sh "$(dirname "$0")/../shared/install.sh"

# Enable window decorations for Ghostty
sed -i 's/window-decoration = false/window-decoration = true/' "$HOME/.config/ghostty/config"
sed -i 's/font-size = 13/font-size = 11/' "$HOME/.config/ghostty/config"

# Fira Code Nerd Font (install to user fonts dir on atomicdesktop)
firacode_dir="$HOME/.local/share/fonts/FiraCode"
mkdir -p "$firacode_dir"
curl -L -o /tmp/firacode-nf.zip https://github.com/ryanoasis/nerd-fonts/releases/latest/download/FiraCode.zip
unzip -o /tmp/firacode-nf.zip -d "$firacode_dir"
rm /tmp/firacode-nf.zip
fc-cache -f "$firacode_dir" 2>/dev/null

# Ghostty via COPR (requires reboot)
. /etc/os-release
curl -fsSL "https://copr.fedorainfracloud.org/coprs/scottames/ghostty/repo/fedora-${VERSION_ID}/scottames-ghostty-fedora-${VERSION_ID}.repo" | sudo tee /etc/yum.repos.d/_copr:copr.fedorainfracloud.org:scottames:ghostty.repo >/dev/null
sudo rpm-ostree refresh-md
sudo rpm-ostree install -A ghostty || true

# Install Apps
flatpak install \
  com.discordapp.Discord \
  org.localsend.localsend_app \
  net.retrodeck.retrodeck

echo "Done. Reboot required."
