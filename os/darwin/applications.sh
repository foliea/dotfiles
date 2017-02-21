#!/bin/sh
set -e

brew reinstall caskroom/cask/brew-cask \
               heroku-toolbelt \
               ruby-build

brew link ruby-build

brew reinstall rbenv

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
