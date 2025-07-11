#!/bin/sh
set -e

# Source WSL validation
. "$(dirname "$0")/check-wsl.sh"

# WSL configuration
sudo cp "$(dirname "$0")/wsl.conf" /etc/wsl.conf

echo "\n[user]\ndefault=$USER" | sudo tee -a /etc/wsl.conf

# WezTerm configuration
WEZTERM_DEST_DIR="/mnt/c/Users/$WIN_USER/.config/wezterm"
mkdir -p "$WEZTERM_DEST_DIR"
cp "$PWD/os/shared/wezterm.lua" "$WEZTERM_DEST_DIR/wezterm.lua"

# Windows Terminal configuration
WT_SOURCE_PATH="$PWD/os/windows/terminal.json"

# Find the Windows Terminal package directory
WT_PACKAGE_DIR=$(find "/mnt/c/Users/$WIN_USER/AppData/Local/Packages" -maxdepth 1 -type d -name "Microsoft.WindowsTerminal_*" | head -n 1)

if [ -z "$WT_PACKAGE_DIR" ]; then
	echo "Error: Could not find Windows Terminal package directory. Is Windows Terminal installed?"
	exit 1
fi

WT_DEST_DIR="$WT_PACKAGE_DIR/LocalState"
WT_DEST_FILE="$WT_DEST_DIR/settings.json"

mkdir -p "$WT_DEST_DIR"
cp "$WT_SOURCE_PATH" "$WT_DEST_FILE"

# GlazeWM
GLAZE_DEST_DIR="/mnt/c/Users/$WIN_USER/.glzr"
mkdir -p "$GLAZE_DEST_DIR/glazewm"

cp "$PWD/os/windows/glazewm.yaml" "$GLAZE_DEST_DIR/glazewm/config.yaml"

INSTALL_ZEBAR=false
for arg in "$@"; do
	if [ "$arg" = "--with-zebar" ]; then
		INSTALL_ZEBAR=true
		break
	fi
done

if [ "$INSTALL_ZEBAR" = "true" ]; then
	echo "Installing Zebar..."
	rm -rf "$GLAZE_DEST_DIR/zebar"
	cp -r "$PWD/os/windows/zebar" "$GLAZE_DEST_DIR"
else
	echo "Skipping Zebar installation. Use --with-zebar to install."
fi

# PowerToys configuration
POWERTOYS_DEST_DIR="/mnt/c/Users/$WIN_USER/AppData/Local/Microsoft/PowerToys"

if [ -d "$POWERTOYS_DEST_DIR" ]; then
	# Copy configuration files, excluding runtime files
	find "$PWD/os/windows/powertoys" -name "*.json" -exec cp {} "$POWERTOYS_DEST_DIR/" \;

	# Copy module-specific configurations
	for module_dir in "$PWD/os/windows/powertoys"/*/; do
		if [ -d "$module_dir" ]; then
			module_name=$(basename "$module_dir")
			mkdir -p "$POWERTOYS_DEST_DIR/$module_name"
			if [ "$(ls -A "$module_dir" 2>/dev/null)" ]; then
				cp -r "$module_dir"* "$POWERTOYS_DEST_DIR/$module_name/"
			fi
		fi
	done
else
	echo "Warning: PowerToys directory not found. Please install PowerToys first."
fi

# PowerShell profile configuration
POWERSHELL_PROFILE_DIR="/mnt/c/Users/$WIN_USER/Documents/PowerShell"

mkdir -p "$POWERSHELL_PROFILE_DIR"
cp "$PWD/os/windows/powershell_profile.ps1" "$POWERSHELL_PROFILE_DIR/Microsoft.PowerShell_profile.ps1"
