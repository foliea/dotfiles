#!/bin/sh
set -e

brew reinstall caskroom/cask/brew-cask

brew cask install \
    iterm2 \
    macvim \
    atom \
    google-chrome \
    google-drive \
    caffeine \
    skype \
    vlc \
    unrarx \
    slack \
    transmission \
    virtualbox \
    android-file-transfer

echo "Applications installed successfully!"
