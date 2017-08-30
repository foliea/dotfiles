#!/bin/sh
set -e

yaourt -Sy --noconfirm heroku-toolbelt \
                       google-chrome \
                       vlc \
                       qt4 \ # Required by VLC
                       albert \
                       rbenv \
                       ruby-build
