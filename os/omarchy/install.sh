#!/bin/bash
set -e

install_shared() {
  sh "$(dirname "$0")/../shared/install.sh"
}

install_packages() {
  omarchy-pkg-add \
    makima-bin \
    "JetBrainsMono Nerd Font Mono"

  omarchy-install-terminal ghostty
}

install_config() {
  mkdir -p "$HOME/.config"
  rsync -a "$PWD/os/omarchy/config/" "$HOME/.config/"
  sed -i 's/^font-size = .*/font-size = 9.1/' "$HOME/.config/ghostty/config"
  sed -i 's/mode="assign" binding="strong"/mode="assign"/' "$HOME/.config/fontconfig/fonts.conf"
  omarchy-font-set "JetBrainsMono Nerd Font Mono"
}

install_keyboard() {
  local conf_dest="$HOME/.config/makima"
  mkdir -p "$conf_dest"

  KBD_NAME=$(cat /proc/bus/input/devices | grep '^N: Name=' | grep -i keyboard | head -1 | cut -d'"' -f2)
  cp "$PWD/os/omarchy/makima/keyboard.toml" "$conf_dest/$KBD_NAME.toml"
  echo "Keyboard config copied as: $conf_dest/$KBD_NAME.toml"
}

install_webapps() {
  omarchy-webapp-install "Calendar" "https://calendar.google.com" ""
  omarchy-webapp-install "Discord" "https://discord.com/channels/@me" ""
  omarchy-webapp-install "Drive" "https://drive.google.com" ""
  omarchy-webapp-install "Gemini" "https://gemini.google.com/" ""
  omarchy-webapp-install "GitHub" "https://github.com/" ""
  omarchy-webapp-install "Keep Notes" "https://keep.google.com" ""
  omarchy-webapp-install "Maps" "https://map.google.com" ""
  omarchy-webapp-install "Photos" "https://photos.google.com" ""
  omarchy-webapp-install "X" "https://x.com/" ""
  omarchy-webapp-install "YouTube" "https://youtube.com/" ""
  omarchy-webapp-install "YT Music" "https://music.youtube.com" ""
  omarchy-webapp-install "Zoom" "https://zoom.us" "" "omarchy-webapp-handler-zoom %u" "x-scheme-handler/zoommtg;x-scheme-handler/zoomus"
  echo "Installed web apps"
}

install_services() {
  local service_dest="$HOME/.config/systemd/user"
  mkdir -p "$service_dest"
  cp -n "$PWD/os/omarchy/services/makima.service" "$service_dest/" 2>/dev/null || true

  if [ -c /dev/uinput ] && ! sudo -n chmod 666 /dev/uinput 2>/dev/null; then
    echo "Fixing /dev/uinput permissions..."
    sudo chmod 666 /dev/uinput 2>/dev/null || echo "/!\\ Run: sudo chmod 666 /dev/uinput"
  fi

  local udev_rule="/etc/udev/rules.d/99-uinput.rules"
  if [ -c /dev/uinput ] && ! grep -q "MODE.*0660" "$udev_rule" 2>/dev/null; then
    echo 'KERNEL=="uinput", MODE="0660", GROUP="input", OPTIONS+="static_node=uinput"' | sudo tee "$udev_rule" >/dev/null 2>&1 || true
  fi

  echo "Reloading systemd and starting makima..."
  systemctl --user daemon-reload
  systemctl --user enable --now makima || true
  systemctl --user status makima || true
}

install_hardware_fixes() {
  sh "$PWD/os/omarchy/scripts/fix-audio-ux5406sa.sh"
}

TARGET="${1:-all}"

case "$TARGET" in
shared) install_shared ;;
packages) install_packages ;;
config) install_config ;;
keyboard) install_keyboard ;;
webapps) install_webapps ;;
services) install_services ;;
hardware_fixes | hardware) install_hardware_fixes ;;
all)
  install_shared
  install_packages
  install_config
  install_keyboard
  install_webapps
  install_services
  install_hardware_fixes
  ;;
*)
  echo "Usage: $0 [shared|packages|config|keyboard|webapps|services|hardware]" >&2
  exit 1
  ;;
esac
