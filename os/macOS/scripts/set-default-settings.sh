#!/bin/sh
set -e

# Wallpaper
WALLPAPER_DIR="$HOME/.config/wallpapers"
mkdir -p "$WALLPAPER_DIR"

RES=$(system_profiler SPDisplaysDataType | awk '/Resolution/{print $2"x"$4; exit}')
WIDTH=$(echo "$RES" | cut -d'x' -f1)
HEIGHT=$(echo "$RES" | cut -d'x' -f2)

COLOR="0,0,0"
MAGICK_COLOR="rgb($COLOR)"

IMG_PATH="$WALLPAPER_DIR/wallpaper-${COLOR}-${WIDTH}x${HEIGHT}.png"
if [ ! -f "$IMG_PATH" ]; then
  magick -size ${WIDTH}x${HEIGHT} xc:"$MAGICK_COLOR" "$IMG_PATH"
fi

if command -v desktoppr >/dev/null 2>&1; then
  desktoppr "$IMG_PATH"
fi

echo "Wallpaper set to $COLOR ($IMG_PATH)"

# Global macOS settings
defaults write -g NSWindowShouldDragOnGesture -bool true
defaults write com.apple.dock autohide -bool true
defaults write com.apple.dock orientation -string left

# Disable Stage Manager
defaults write com.apple.WindowManager GloballyEnabled -bool false

# Hide Desktop Widgets
defaults write com.apple.WindowManager StandardHideWidgets -int 0
defaults write com.apple.WindowManager StageManagerHideWidgets -int 0

killall Dock
killall WindowManager
