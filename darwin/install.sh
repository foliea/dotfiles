#!/bin/sh
set -e

# Install brew
if [ ! $(command -v brew) ]; then
    ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
fi

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

install_applications(){
    brew cask install iterm2 \
                      macvim \
                      gitx \
                      boot2docker \
                      google-chrome \
                      google-drive \
                      caffeine \
                      skype \
                      vlc \
                      unrarx \
                      transmission
    echo "Applications installed successfully!"
}

# Install applications
read -p "Also install applications? (y/n) " choice
case "$choice" in
  y|Y ) eval install_applications;;
  n|N ) echo "Applications won't be installed.";;
  * ) echo "Invalid choice. Aborting applications installation.";;
esac
