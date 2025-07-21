#!/bin/sh
set -e

# Get script directory for relative paths
SCRIPT_DIR="$(dirname "$0")"

# Source WSL validation
. "$SCRIPT_DIR/check-wsl.sh"

# Handle arguments
INSTALL_POWERTOYS=false
for arg in "$@"; do
	if [ "$arg" = "--power-toys" ]; then
		INSTALL_POWERTOYS=true
	fi
done

# WezTerm configuration
WEZTERM_DEST_DIR="/mnt/c/Users/$WIN_USER/.config/wezterm"
mkdir -p "$WEZTERM_DEST_DIR"
cp "$SCRIPT_DIR/../shared/wezterm.lua" "$WEZTERM_DEST_DIR/wezterm.lua"
cp "$HOME/.config/themes/default/wezterm.json" "$WEZTERM_DEST_DIR/wezterm.json"

# Windows Terminal configuration
WT_SOURCE_PATH="$SCRIPT_DIR/terminal.json"

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

cp "$SCRIPT_DIR/glazewm.yaml" "$GLAZE_DEST_DIR/glazewm/config.yaml"

# Apply theme to GlazeWM configuration
GLAZEWM_THEME_FILE="$HOME/.config/themes/default/glazewm.txt"
if [ -f "$GLAZEWM_THEME_FILE" ]; then
	THEME_COLOR=$(head -n 1 "$GLAZEWM_THEME_FILE" | tr -d '[:space:]')
	if [ -n "$THEME_COLOR" ]; then
		sed -i "s/#ffffff/$THEME_COLOR/g" "$GLAZE_DEST_DIR/glazewm/config.yaml"
	fi
fi
if command -v glazewm.exe >/dev/null 2>&1; then
	glazewm.exe command wm-reload-config
fi

# Zebar configuration and theme
if command -v zebar.exe >/dev/null 2>&1; then
	taskkill.exe /IM zebar.exe /F
fi
echo "Installing Zebar..."
rm -rf "$GLAZE_DEST_DIR/zebar"
cp -r "$SCRIPT_DIR/zebar" "$GLAZE_DEST_DIR"
cp "$HOME/.config/themes/default/zebar.css" "$GLAZE_DEST_DIR/zebar/default-theme/colors.css"

if command -v zebar.exe >/dev/null 2>&1; then
	zebar.exe >/dev/null 2>&1 &
fi

# Flow Launcher configuration
FLOW_LAUNCHER_DIR="/mnt/c/Users/$WIN_USER/AppData/Roaming/FlowLauncher/Settings"
mkdir -p "$FLOW_LAUNCHER_DIR"
cp "$PWD/os/windows/flow-launcher.json" "$FLOW_LAUNCHER_DIR/Settings.json"

# Apply theme to Flow Launcher settings
FLOW_LAUNCHER_THEME_FILE="$HOME/.config/themes/default/flow-launcher.txt"
if [ -f "$FLOW_LAUNCHER_THEME_FILE" ]; then
	THEME_NAME=$(head -n 1 "$FLOW_LAUNCHER_THEME_FILE" | sed 's/^[[:space:]]*//;s/[[:space:]]*$//')
	if [ -n "$THEME_NAME" ]; then
		sed -i "s/\"Theme\": \"[^\"]*\"/\"Theme\": \"$THEME_NAME\"/g" "$FLOW_LAUNCHER_DIR/Settings.json"
	fi
fi

# Restart Flow Launcher to apply changes
FLOW_LAUNCHER_EXE="/mnt/c/Users/$WIN_USER/AppData/Local/FlowLauncher/Flow.Launcher.exe"

if [ -f "$FLOW_LAUNCHER_EXE" ]; then
	taskkill.exe /IM Flow.Launcher.exe /F 2>/dev/null || true

	"$FLOW_LAUNCHER_EXE" >/dev/null 2>&1 &
fi

# PowerToys configuration
POWERTOYS_DEST_DIR="/mnt/c/Users/$WIN_USER/AppData/Local/Microsoft/PowerToys"

if [ "$INSTALL_POWERTOYS" = "true" ] && [ -d "$POWERTOYS_DEST_DIR" ]; then
	# Remove everything except NewPlus folder
	find "$POWERTOYS_DEST_DIR" -mindepth 1 -maxdepth 1 ! -name "NewPlus" -exec rm -rf {} \;

	# Copy main configuration files only
	cp "$SCRIPT_DIR/powertoys"/*.json "$POWERTOYS_DEST_DIR/" 2>/dev/null || true

	# Copy module-specific configurations
	for module_dir in "$SCRIPT_DIR/powertoys"/*/; do
		if [ -d "$module_dir" ]; then
			module_name=$(basename "$module_dir")
			mkdir -p "$POWERTOYS_DEST_DIR/$module_name"
			if [ "$(ls -A "$module_dir" 2>/dev/null)" ]; then
				cp -r "$module_dir"* "$POWERTOYS_DEST_DIR/$module_name/"
			fi
		fi
	done
elif [ "$INSTALL_POWERTOYS" = "true" ]; then
	echo "Warning: PowerToys directory not found. Please install PowerToys first."
elif [ "$INSTALL_POWERTOYS" = "false" ]; then
	echo "Skipping PowerToys installation. Use --power-toys to install."
fi

# PowerShell profile configuration
POWERSHELL_PROFILE_DIR="/mnt/c/Users/$WIN_USER/Documents/PowerShell"

mkdir -p "$POWERSHELL_PROFILE_DIR"
cp "$SCRIPT_DIR/powershell_profile.ps1" "$POWERSHELL_PROFILE_DIR/Microsoft.PowerShell_profile.ps1"

# Wallpaper
exec "$SCRIPT_DIR/WallP.exe" $(cat "$HOME/.config/themes/default/wallpaper-win.txt")
