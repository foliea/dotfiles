#!/bin/sh
# WSL environment validation script

set -e

# Check if running in WSL
if ! grep -qEi "WSL" /proc/version; then
	echo "Error: This script is intended to be run inside Windows Subsystem for Linux (WSL)."
	exit 1
fi

# Get Windows username
WIN_USER=$(cmd.exe /C 'echo %USERNAME%' 2>/dev/null | tr -d '\r')

if [ -z "$WIN_USER" ]; then
	echo "Error: Could not determine Windows username. Please ensure cmd.exe is accessible."
	exit 1
fi

# Export WIN_USER for use in calling scripts
export WIN_USER