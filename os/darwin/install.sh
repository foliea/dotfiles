#!/bin/sh
set -e

sh $PWD/os/darwin/dependencies.sh

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
