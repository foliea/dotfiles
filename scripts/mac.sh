#!/bin/sh

set -e

# Install brew
ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"

# Install brew bundler
brew tap homebrew/boneyard

# Install dependencies
brew bundle

# Install applications
brew bundle Caskfile
