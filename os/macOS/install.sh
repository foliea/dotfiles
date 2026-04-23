#!/bin/sh
set -e

sh "$(dirname "$0")/../shared/install.sh"

brew install \
  mpv \
  desktoppr \
  artginzburg/tap/sudo-touchid

brew install --cask \
  font-fira-code-nerd-font \
  nikitabobko/tap/aerospace \
  hiddenbar \
  scroll-reverser \
  caffeine \
  visual-studio-code \
  ghostty \
  orbstack \
  discord \
  chromium

# Chromium from Homebrew isn't notarized; clear the quarantine attribute so
# macOS Gatekeeper doesn't flag it as damaged.
if [ -d "/Applications/Chromium.app" ]; then
  xattr -cr "/Applications/Chromium.app"
fi

# Install Chrome only if not already present (e.g. managed by work IT)
if [ ! -d "/Applications/Google Chrome.app" ] && [ ! -d "$HOME/Applications/Google Chrome.app" ]; then
  printf "Google Chrome is not installed. Install it via Homebrew? [y/N] "
  read -r answer
  case "$answer" in
  [yY] | [yY][eE][sS])
    brew install --cask google-chrome
    ;;
  esac
fi

# Enable Touch ID for sudo
sudo-touchid

# Aerospace
rm -rf "$HOME/.config/aerospace"
mkdir -p "$HOME/.config/aerospace"
cp "$PWD/os/macOS/config/aerospace/aerospace.toml" "$HOME/.config/aerospace/aerospace.toml"

# If Chrome is not installed, fall back to Chromium for bindings that use Chrome
if [ ! -d "/Applications/Google Chrome.app" ] && [ ! -d "$HOME/Applications/Google Chrome.app" ]; then
  sed -i '' 's/"Google Chrome"/Chromium/g' "$HOME/.config/aerospace/aerospace.toml"
fi

sh "$(dirname "$0")/scripts/set-default-settings.sh"
