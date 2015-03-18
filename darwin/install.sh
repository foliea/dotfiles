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

# Install docker-compose
if [ ! $COMPOSE ]; then COMPOSE=1.1.0 ; fi

curl -L https://github.com/docker/compose/releases/download/$COMPOSE/docker-compose-`uname -s`-`uname -m` > /usr/local/bin/docker-compose
chmod +x /usr/local/bin/docker-compose

curl -L https://raw.githubusercontent.com/docker/compose/$COMPOSE/contrib/completion/bash/docker-compose > /etc/bash_completion.d/docker-compose
