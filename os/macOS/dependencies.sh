#!/bin/sh
set -e

brew install cmake \
             curl \
             wget \
             gawk \
             readline \
             most \
             jq \
             fish \
             tmux \
             macvim \
             vifm \
             ncdu \
             fzf \
             ripgrep \
             hub \
             grip \
             rar \
             p7zip \
             kubectx \
             kubeseal \
             helm

curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.40.3/install.sh | bash
