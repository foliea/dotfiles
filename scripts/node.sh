#!/bin/sh

set -e

VERSION=0.10.30

# Install Node Version Manager
#curl https://raw.githubusercontent.com/creationix/nvm/v0.18.0/install.sh | bash

# Source nvm
source ~/.nvm/nvm.sh

# Install Node VERSION
nvm install "$VERSION"

# Use Node VERSION as default
nvm alias default "$VERSION"
