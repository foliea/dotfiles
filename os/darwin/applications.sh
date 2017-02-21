#!/bin/sh
set -e

brew reinstall caskroom/cask/brew-cask \
               heroku-toolbelt \
               rbenv \
               ruby-build

brew cask install \
    iterm2 \
    google-chrome \
    google-drive \
    caffeine \
    slack \
    vlc \
    unrarx \
    transmission \
    virtualbox \
    android-file-transfer \
    docker

# Enable tap to click (Trackpad) for this user and for the login screen
defaults write com.apple.driver.AppleBluetoothMultitouch.trackpad Clicking -bool true
defaults -currentHost write NSGlobalDomain com.apple.mouse.tapBehavior -int 1
defaults write NSGlobalDomain com.apple.mouse.tapBehavior -int 1
