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

# Hide Desktop Widgets when clicking on wallpaper
defaults write com.apple.WindowManager StandardHideWidgets -int 2
defaults write com.apple.WindowManager StageManagerHideWidgets -int 0

# Hide all icons from Desktop
defaults write com.apple.finder CreateDesktop -bool false

# Disable Ctrl+Space for input source switching (frees it for tmux prefix)
/usr/libexec/PlistBuddy -c "Set :AppleSymbolicHotKeys:60:enabled false" \
  ~/Library/Preferences/com.apple.symbolichotkeys.plist 2>/dev/null || true

killall Dock
killall WindowManager
killall Finder 2>/dev/null || true
killall SystemUIServer 2>/dev/null || true
