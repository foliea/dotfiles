#!/bin/sh
set -e

yaourt -Sy --noconfirm heroku-toolbelt \
                       atom-editor \
                       google-chrome \
                       caffeine-ng
                       rbenv \
                       ruby-build
