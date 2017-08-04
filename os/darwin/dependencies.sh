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
               ctags \
               cmake \
               phantomjs \
               mysql \
               postgresql \
               redis \
               imagemagick \
               ripgrep \
               vim \
               fzf \
               tmux \
               fish \
               gawk \
               ncdu \
               grip \
               reattach-to-user-namespace \
               https://raw.githubusercontent.com/Homebrew/homebrew-core/c5674f07fcabc3b4d6814eacbf5ec98fac9acfe9/Formula/chromedriver.rb # 2.24

brew reinstall openssl
