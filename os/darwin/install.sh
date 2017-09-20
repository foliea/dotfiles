#!/bin/sh
set -e

brew reinstall gnupg2

brew reinstall caskroom/cask/brew-cask

brew cask install \
    iterm2 \
    google-chrome \
    caffeine \
    slack \
    vlc \
    unrarx \
    transmission \
    docker

cp -f $PWD/os/darwin/environment.plist $HOME/Library/LaunchAgents/
