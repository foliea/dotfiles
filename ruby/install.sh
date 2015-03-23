#!/bin/sh
set -e

if [ ! $VERSION ]; then VERSION="2.1.5" ; fi

# Install Ruby Version Manager
\curl -sSL https://get.rvm.io | bash --ruby

# Source rvm
source "$HOME/.rvm/scripts/rvm"

# Install Ruby VERSION
rvm install ruby-$VERSION

# Use Ruby VERSION as default
rvm --default use ruby-$VERSION
