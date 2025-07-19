#!/bin/sh
set -e

sh "$(dirname "$0")/../shared/configure.sh"

# Use systemd on WSL
if grep -qEi "WSL" /proc/version; then
	sudo cp "$(dirname "$0")/wsl.conf" /etc/wsl.conf

	echo "\n[user]\ndefault=$USER" | sudo tee -a /etc/wsl.conf >/dev/null
	
	# Install WSL xdg-open wrapper
	sudo cp "$(dirname "$0")/xdg-open-wsl" /usr/local/bin/xdg-open
	sudo chmod +x /usr/local/bin/xdg-open
fi

# Create fake OrbStack init file to prevent fish-lsp warnings
mkdir -p "$HOME/.orbstack/shell"
touch "$HOME/.orbstack/shell/init2.fish"
