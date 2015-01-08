#!/bin/sh
set -e

brew cask install iterm2 \
                  macvim \
                  gitx \
                  boot2docker \
                  google-chrome \
                  google-drive \
                  caffeine \
                  skype \
                  vlc \
                  unrarx \
                  transmission
echo "Applications installed successfully!"