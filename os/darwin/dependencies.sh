#!/bin/sh
set -e

# Install brew
if [ ! $(command -v brew) ]; then
    ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
fi

brew prune

brew update

# Install dependencies
brew reinstall git \
               mercurial \
               hub \
               curl \
               wget \
               bash-completion \
               ctags \
               cmake \
               phantomjs

brew link openssl --force
