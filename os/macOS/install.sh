#!/bin/sh
set -e

install_shared() {
  sh "$(dirname "$0")/../shared/install.sh"
}

install_packages() {
  brew install \
    desktoppr

  brew install --cask \
    font-jetbrains-mono-nerd-font \
    nikitabobko/tap/aerospace \
    hiddenbar \
    scroll-reverser \
    caffeine \
    stolendata-mpv \
    ghostty \
    orbstack \
    discord \
    chromium \
    localsend

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
}

install_config() {
  # Aerospace
  rm -rf "$HOME/.config/aerospace"
  mkdir -p "$HOME/.config/aerospace"
  cp "$PWD/os/macOS/config/aerospace/aerospace.toml" "$HOME/.config/aerospace/aerospace.toml"

  # If Chrome is not installed, fall back to Chromium for bindings that uses Chrome
  if [ ! -d "/Applications/Google Chrome.app" ] && [ ! -d "$HOME/Applications/Google Chrome.app" ]; then
    sed -i '' 's/"Google Chrome"/Chromium/g' "$HOME/.config/aerospace/aerospace.toml"
  fi
}

install_settings() {
  sh "$(dirname "$0")/scripts/set-default-settings.sh"
}

TARGET="${1:-all}"

case "$TARGET" in
shared) install_shared ;;
packages) install_packages ;;
config) install_config ;;
settings) install_settings ;;
all)
  install_shared
  install_packages
  install_config
  install_settings
  ;;
*)
  echo "Usage: $0 [shared|packages|config|settings]" >&2
  exit 1
  ;;
esac
