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
  rar \
  rbenv \
  p7zip \
  kubectx \
  kubeseal \
  helm \
  k9s \
  awscli

curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.40.3/install.sh | bash
