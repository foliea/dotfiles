#!/bin/sh
set -e

if [ ! $VERSION ]; then VERSION="2.1.5" ; fi

gpg --keyserver hkp://keys.gnupg.net --recv-keys 409B6B1796C275462A1703113804BB82D39DC0E3

# Install Ruby Version Manager
\curl -sSL https://get.rvm.io | bash -s stable --ruby

# Source rvm
source "$HOME/.rvm/scripts/rvm"

# Install Ruby VERSION
rvm install ruby-$VERSION

# Use Ruby VERSION as default
rvm --default use ruby-$VERSION
