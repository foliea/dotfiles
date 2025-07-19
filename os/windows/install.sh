#!/bin/sh
set -e

# Source WSL validation
. "$(dirname "$0")/check-wsl.sh"

WIN_USER=$(cmd.exe /C 'echo %USERNAME%' 2>/dev/null | tr -d '\r')

# Install or update Winget system packages
winget.exe install \
	GlazeWM \
	CharlesMilette.TranslucentTB \
	Microsoft.PowerToys \
	Microsoft.WindowsTerminal \
	Microsoft.PowerShell \
	Discord.Discord \
	Google.QuickShare \
	DuongDieuPhap.ImageGlass || true

# Install or update Winget user packages
winget.exe install --scope user --exact --id Microsoft.WindowsStudioCode || true
winget.exe install --scope user --exact --id Starship.Starship || true

SCOOP="/mnt/c/Users/$WIN_USER/scoop/shims/scoop"

# Install scoop if necessary
if ! command -v "$SCOOP" >/dev/null 2>&1; then
	powershell.exe -Command "Set-ExecutionPolicy -ExecutionPolicy RemoteSigned -Scope CurrentUser -Force"
	powershell.exe -Command "Invoke-RestMethod -Uri https://get.scoop.sh | Invoke-Expression"
fi

# Install git first (required for bucket operations)
if ${SCOOP} list | grep -q "git"; then
	${SCOOP} update git
else
	${SCOOP} install git
fi

# Add scoop buckets
${SCOOP} bucket add versions 2>/dev/null || true
${SCOOP} bucket add nerd-fonts 2>/dev/null || true

# Install or update scoop packages
SCOOP_PACKAGES="versions/wezterm-nightly nerd-fonts/FiraCode"

for package in $SCOOP_PACKAGES; do
	if ${SCOOP} list | grep -q "$(echo "$package" | sed 's|.*/||')"; then
		${SCOOP} update "$package"
	else
		${SCOOP} install "$package"
	fi
done
