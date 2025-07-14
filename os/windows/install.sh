#!/bin/sh
set -e

# Source WSL validation
. "$(dirname "$0")/check-wsl.sh"

winget.exe install \
	GlazeWM \
	CharlesMilette.TranslucentTB \
	Microsoft.PowerToys \
	wez.wezterm \
	Microsoft.VisualStudioCode \
	Microsoft.WindowsTerminal \
	Microsoft.PowerShell \
	Discord.Discord \
	Google.QuickShare \
	mpv.net \
	DuongDieuPhap.ImageGlass

# Alongside the other packages, it just gets ignored for no reason
winget.exe install --scope user --exact --id Starship.Starship
