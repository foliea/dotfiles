#!/bin/sh
set -e

# Wallpaper
sh "$(dirname "$0")/set-wallpaper.sh"

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
