#!/bin/sh
set -e

sh "$(dirname "$0")/../shared/install.sh"

# Enable window decorations for Ghostty
sed -i 's/window-decoration = false/window-decoration = true/' "$HOME/.config/ghostty/config"
sed -i 's/font-size = 13/font-size = 11/' "$HOME/.config/ghostty/config"

# Fira Code Nerd Font (install to user fonts dir on atomicdesktop)
mkdir -p "$HOME/.local/share/fonts/FiraCode"
curl -L -o /tmp/firacode-nf.zip https://github.com/ryanoasis/nerd-fonts/releases/latest/download/FiraCode.zip
unzip -o /tmp/firacode-nf.zip -d "$HOME/.local/share/fonts/FiraCode"
rm /tmp/firacode-nf.zip
fc-cache -f ~/.local/share/fonts/FiraCode 2>/dev/null || true

# Ghostty via COPR (requires reboot)
. /etc/os-release
curl -fsSL "https://copr.fedorainfracloud.org/coprs/scottames/ghostty/repo/fedora-${VERSION_ID}/scottames-ghostty-fedora-${VERSION_ID}.repo" | sudo tee /etc/yum.repos.d/_copr:copr.fedorainfracloud.org:scottames:ghostty.repo >/dev/null
sudo rpm-ostree refresh-md
sudo rpm-ostree install -A ghostty || true

echo "Done. Reboot required."
