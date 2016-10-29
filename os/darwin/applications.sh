#!/bin/sh
set -e

brew reinstall caskroom/cask/brew-cask \
               heroku-toolbelt \
               rbenv \
               ruby-build

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
