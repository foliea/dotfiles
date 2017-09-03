#!/bin/sh
set -e

yaourt -Sy --noconfirm google-chrome \
                       terminator \
                       rbenv \
                       ruby-build

sh $PWD/terminator/install.sh
