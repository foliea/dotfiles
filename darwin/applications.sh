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
    vlc \
    unrarx \
    transmission \
    virtualbox \
    android-file-transfer \
    docker

echo "Applications installed successfully!"
