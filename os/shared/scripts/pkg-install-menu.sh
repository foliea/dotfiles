#!/bin/sh

options=""
command -v bbrew >/dev/null 2>&1 && options="${options}Brew\n"
command -v aptitude >/dev/null 2>&1 && options="${options}Aptitude\n"
command -v omarchy-pkg-install >/dev/null 2>&1 && options="${options}Pacman\n"
command -v omarchy-pkg-aur-install >/dev/null 2>&1 && options="${options}AUR\n"

if [ -z "$options" ]; then
  echo "No package manager found" >&2
  exit 1
fi

choice=$(printf "%b" "$options" | fzf --prompt="Install with:" --height=100% --reverse)

case "$choice" in
Brew) exec bbrew ;;
Aptitude) exec sudo aptitude ;;
Pacman) exec omarchy-pkg-install ;;
AUR) exec omarchy-pkg-aur-install ;;
esac
