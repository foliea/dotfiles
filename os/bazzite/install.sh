#!/bin/sh
set -e

install_shared() {
  sh "$(dirname "$0")/../shared/install.sh"
}

install_gnome_extensions() {
  # Install Forge extension
  curl -L -o /tmp/forge.zip "https://github.com/forge-ext/forge/archive/refs/tags/v49-89.zip"
  unzip -qo /tmp/forge.zip -d /tmp/forge-extract
  cd /tmp/forge-extract/forge-49-89 && zip -rq /tmp/forge-ext.zip .
  gnome-extensions install /tmp/forge-ext.zip --force
  rm -rf /tmp/forge.zip /tmp/forge-extract /tmp/forge-ext.zip

  # Install Workspace Indicator
  curl -L -o /tmp/workspace-indicator.zip "https://extensions.gnome.org/extension-data/workspace-indicatorgnome-shell-extensions.gcampax.github.com.v71.shell-extension.zip"
  gnome-extensions install /tmp/workspace-indicator.zip --force 2>/dev/null || true
  rm -f /tmp/workspace-indicator.zip
}

install_config() {
  ghostty_config="$HOME/.config/ghostty/config"

  # Enable window decorations for Ghostty
  sed -i 's/^window-decoration = .*/window-decoration = true/' "$ghostty_config"
  sed -i 's/^font-size = .*/font-size = 11/' "$ghostty_config"
  grep -q '^gtk-titlebar-style' "$ghostty_config" 2>/dev/null || echo 'gtk-titlebar-style = tabs' >>"$ghostty_config"

  # Forge extension config
  rm -rf "$HOME/.config/forge"
  cp -r "$PWD/os/bazzite/config/forge" "$HOME/.config/forge"

  # Set keybindings
  sh "$PWD/os/bazzite/scripts/set-default-keybindings.sh"

  # Workspace configuration
  dconf write /org/gnome/mutter/dynamic-workspaces false
  dconf write /org/gnome/desktop/wm/preferences/num-workspaces 5

  # Workspace indicator settings
  dconf write /org/gnome/shell/extensions/workspace-indicator/embed-previews false

  # Enable extensions
  gnome-extensions enable forge@jmmaranan.com 2>/dev/null || true
  gnome-extensions enable workspace-indicator@gnome-shell-extensions.gcampax.github.com 2>/dev/null || true
}

install_fonts() {
  jetbrainsmono_dir="$HOME/.local/share/fonts/JetBrainsMono"
  mkdir -p "$jetbrainsmono_dir"
  curl -L -o /tmp/jetbrainsmono-nf.zip https://github.com/ryanoasis/nerd-fonts/releases/latest/download/JetBrainsMono.zip
  unzip -o /tmp/jetbrainsmono-nf.zip -d "$jetbrainsmono_dir"
  rm /tmp/jetbrainsmono-nf.zip
  fc-cache -f "$jetbrainsmono_dir" 2>/dev/null
}

install_packages() {
  # Install terminal
  . /etc/os-release
  repo_url="https://copr.fedorainfracloud.org/coprs/scottames/ghostty/repo/fedora-${VERSION_ID}/scottames-ghostty-fedora-${VERSION_ID}.repo"
  curl -fsSL "$repo_url" | sudo tee /etc/yum.repos.d/_copr:copr.fedorainfracloud.org:scottames:ghostty.repo >/dev/null
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
extensions) install_gnome_extensions ;;
config) install_config ;;
fonts) install_fonts ;;
packages)
  install_packages
  echo "Done. Reboot required."
  ;;
decky) install_decky ;;
all)
  install_shared
  install_gnome_extensions
  install_config
  install_fonts
  install_packages
  install_decky
  ;;
*)
  echo "Usage: $0 [shared|extensions|config|fonts|packages|decky]" >&2
  exit 1
  ;;
esac
