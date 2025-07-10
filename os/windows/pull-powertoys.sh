#!/bin/sh
set -e

# Source WSL validation
. "$(dirname "$0")/check-wsl.sh"

# PowerToys configuration
echo "Pulling PowerToys configuration from Windows..."
POWERTOYS_SOURCE_DIR="/mnt/c/Users/$WIN_USER/AppData/Local/Microsoft/PowerToys"
POWERTOYS_DEST_DIR="$PWD/os/windows/powertoys"

if [ ! -d "$POWERTOYS_SOURCE_DIR" ]; then
	echo "Error: PowerToys directory not found. Please install PowerToys first."
	exit 1
fi

# Clean existing configuration
rm -rf "$POWERTOYS_DEST_DIR"
mkdir -p "$POWERTOYS_DEST_DIR"

# Copy all configuration files and directories
cp -r "$POWERTOYS_SOURCE_DIR"/* "$POWERTOYS_DEST_DIR/"

# Clean up runtime files and logs
rm -rf "$POWERTOYS_DEST_DIR/RunnerLogs/" \
	"$POWERTOYS_DEST_DIR/UpdateLogs/" \
	"$POWERTOYS_DEST_DIR/Updates/" \
	"$POWERTOYS_DEST_DIR/etw/" \
	"$POWERTOYS_DEST_DIR/last_version_run.json" \
	"$POWERTOYS_DEST_DIR/UpdateState.json" \
	"$POWERTOYS_DEST_DIR/settings-telemetry.json"

# Remove any remaining log files
find "$POWERTOYS_DEST_DIR" -name "*.log" -delete

echo "PowerToys configuration pulled successfully from Windows to $POWERTOYS_DEST_DIR"

