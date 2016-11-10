#!/bin/sh
set -e

# Install brew
if [ ! $(command -v brew) ]; then
    ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
fi

brew prune

brew update

brew tap homebrew/versions

# Install dependencies
brew reinstall git \
               mercurial \
               hub \
               curl \
               wget \
               bash-completion \
               ctags \
               cmake \
               phantomjs \
               mysql \
               openssl \
               imagemagick

brew link --force openssl

brew link --force qt55
