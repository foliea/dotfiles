#!/bin/sh
set -e

install_config() {
    mkdir -p "$HOME/.config"
    rsync -a "$PWD/os/omarchy/config/" "$HOME/.config/"
}

install_keyboard() {
    local conf_dest="$HOME/.config/makima"
    mkdir -p "$conf_dest"

    KBD_NAME=$(cat /proc/bus/input/devices | grep -m 1 '^N: Name=' | cut -d'"' -f2)
    cp "$PWD/os/omarchy/keyboard.toml" "$conf_dest/$KBD_NAME.toml"
    echo "Keyboard config copied as: $conf_dest/$KBD_NAME.toml"
}

install_webapps() {
    omarchy-webapp-install "Calendar" "https://calendar.google.com"
    omarchy-webapp-install "Discord" "https://discord.com/channels/@me"
    omarchy-webapp-install "Drive" "https://drive.google.com"
    omarchy-webapp-install "Gemini" "https://gemini.google.com/"
    omarchy-webapp-install "GitHub" "https://github.com/"
    omarchy-webapp-install "Keep Notes" "https://keep.google.com"
    omarchy-webapp-install "Maps" "https://map.google.com"
    omarchy-webapp-install "Photos" "https://photos.google.com"
    omarchy-webapp-install "X" "https://x.com/"
    omarchy-webapp-install "YouTube" "https://youtube.com/"
    omarchy-webapp-install "YT Music" "https://music.youtube.com"
    omarchy-webapp-install "Zoom" "https://zoom.us" "" "omarchy-webapp-handler-zoom %u" "x-scheme-handler/zoommtg;x-scheme-handler/zoomus"
    echo "Installed web apps"
}

install_services() {
    local service_dest="$HOME/.config/systemd/user"
    mkdir -p "$service_dest"
    cp -n "$PWD/os/omarchy/services/makima.service" "$service_dest/" 2>/dev/null || true

    echo "Reloading systemd and starting makima..."
    systemctl --user daemon-reload
    systemctl --user enable --now makima || true
    systemctl --user status makima || true
}

install_config
install_keyboard
install_webapps
install_services