#!/bin/sh
set -e

if ! grep -qEi "WSL" /proc/version; then
	echo "Error: This script is intended to be run inside Windows Subsystem for Linux (WSL)."
	exit 1
fi

WIN_USER=$(cmd.exe /C 'echo %USERNAME%' 2>/dev/null | tr -d '\r')

if [ -z "$WIN_USER" ]; then
	echo "Error: Could not determine Windows username. Please ensure cmd.exe is accessible."
	exit 1
fi

winget.exe install \
	GlazeWM \
	CharlesMilette.TranslucentTB \
	Microsoft.PowerToys \
	wez.wezterm \
	Microsoft.VisualStudioCode \
	Microsoft.WindowsTerminal \
	Microsoft.PowerShell \
	Docker.DockerDesktop \
	Discord.Discord \
	Google.QuickShare \
	Starpine.Screenbox \
	DuongDieuPhap.ImageGlass \
	Starship.Starship
