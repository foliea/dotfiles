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
	Docker.DockerDesktop \
	Discord.Discord \
	Google.QuickShare \
	Starpine.Screenbox \
	DuongDieuPhap.ImageGlass \
	Starship.Starship
