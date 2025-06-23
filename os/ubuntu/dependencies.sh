#!/bin/sh
set -e

apt-get update -qq
apt-get install -qy \
  build-essential \
  cmake \
  gawk \
  git \
  hub \
  mercurial \
  curl \
  wget \
  vim \
  fish \
  tmux \
  rbenv \
  libffi-dev \
  libyaml-dev \
  libpq-dev \
  exuberant-ctags \
  openvpn \
  resolvconf \
  nodejs \
  npm \
  most \
  fzf \
  ripgrep \
  fd-find \
  ncdu \
  jq \
  rar \
  p7zip-full \
  kubectx \
  expect

# Install k9s
wget https://github.com/derailed/k9s/releases/latest/download/k9s_linux_amd64.deb && apt install ./k9s_linux_amd64.deb && rm k9s_linux_amd64.deb

curl https://sh.rustup.rs -sSf | sh -s -- -y --no-modify-path

# Install ruby version manager
mkdir -p "$HOME/.rbenv/plugins"
if [ ! -d "$HOME/.rbenv/plugins/ruby-build" ]; then
  git clone https://github.com/rbenv/ruby-build.git "$HOME/.rbenv/plugins/ruby-build"
else
  echo "ruby-build already exists, skipping clone."
fi

# Install node version manager
curl -fsSL https://fnm.vercel.app/install | bash

# Setup fd-find
mkdir -p $HOME/.local/bin
ln -s $(which fdfind) $HOME/.local/bin/fd
