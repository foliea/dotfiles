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
    local app_dest="$HOME/.local/share/applications"
    mkdir -p "$app_dest"
    cp -n "$PWD/os/omarchy/webapps"/*.desktop "$app_dest/" 2>/dev/null || true
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