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
               postgres \
               redis \
               ctags \
               phantomjs \
               tutum

brew link openssl --force

# Install applications
read -p "Also install applications? (y/n) " choice
case "$choice" in
    y|Y ) eval ./darwin/applications.sh;;
    n|N ) echo "Applications won't be installed.";;
    * ) echo "Invalid choice. Aborting applications installation.";;
esac
