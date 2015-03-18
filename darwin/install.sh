#!/bin/sh
set -e

# Install brew
if [ ! $(command -v brew) ]; then
    ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
fi

brew update

# Install dependencies
brew install git \
             mercurial \
             hub \
             curl \
             wget \
             bash-completion \
             postgres \
             redis \
             ctags \
             phantomjs
