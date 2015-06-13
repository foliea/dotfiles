#!/bin/sh
set -e

brew reinstall caskroom/cask/brew-cask

brew cask install \
    iterm2 \
    macvim \
    google-chrome \
    google-drive \
    caffeine \
    skype \
    vlc \
    unrarx \
    slack \
    transmission \
    virtualbox

echo "Applications installed successfully!"
