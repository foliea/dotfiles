#!/bin/sh
set -e

install_shared() {
  sh "$(dirname "$0")/../shared/install.sh"
}

install_config() {
  ghostty_config="$HOME/.config/ghostty/config"

  # Enable window decorations for Ghostty
  sed -i 's/^window-decoration = .*/window-decoration = true/' "$ghostty_config"
  sed -i 's/^font-size = .*/font-size = 11/' "$ghostty_config"
  grep -q '^gtk-titlebar-style' "$ghostty_config" 2>/dev/null || sed -i '/^gtk-toolbar-style/a gtk-titlebar-style = tabs' "$ghostty_config"
}

install_fonts() {
  # JetBrainsMono Nerd Font (install to user fonts dir on atomicdesktop)
  jetbrainsmono_dir="$HOME/.local/share/fonts/JetBrainsMono"
  mkdir -p "$jetbrainsmono_dir"
  curl -L -o /tmp/jetbrainsmono-nf.zip https://github.com/ryanoasis/nerd-fonts/releases/latest/download/JetBrainsMono.zip
  unzip -o /tmp/jetbrainsmono-nf.zip -d "$jetbrainsmono_dir"
  rm /tmp/jetbrainsmono-nf.zip
  fc-cache -f "$jetbrainsmono_dir" 2>/dev/null
}

install_packages() {
  # Ghostty via COPR
  . /etc/os-release
  curl -fsSL "https://copr.fedorainfracloud.org/coprs/scottames/ghostty/repo/fedora-${VERSION_ID}/scottames-ghostty-fedora-${VERSION_ID}.repo" | sudo tee /etc/yum.repos.d/_copr:copr.fedorainfracloud.org:scottames:ghostty.repo >/dev/null
  sudo rpm-ostree refresh-md
  sudo rpm-ostree install -A ghostty || true

  # Install Apps
  flatpak install \
    com.discordapp.Discord \
    org.localsend.localsend_app \
    net.retrodeck.retrodeck
}

install_decky() {
  # Decky Loader
  sudo ujust setup-decky

  # Decky Plugins
  sudo ujust install-decky-plugins decky-framegen
  sudo ujust install-decky-plugins decky-lsfg-vk
}

TARGET="${1:-all}"

case "$TARGET" in
shared) install_shared ;;
config) install_config ;;
fonts) install_fonts ;;
packages)
  install_packages
  echo "Done. Reboot required."
  ;;
decky) install_decky ;;
all)
  install_shared
  install_config
  install_fonts
  install_packages
  install_decky
  ;;
*)
  echo "Usage: $0 [shared|config|fonts|packages|decky]" >&2
  exit 1
  ;;
esac
