#!/bin/sh

set -e

# Install brew
ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"

# Install brew bundler
brew tap homebrew/boneyard

# Install dependencies
brew bundle

# Install applications
read -p "Also install applications? (y/n)" choice
case "$choice" in
  y|Y ) brew bundle Caskfile;;
  n|N ) echo "Applications won't be installed.";;
  * ) echo "Invalid choice. Aborting applications installation.";;
esac
