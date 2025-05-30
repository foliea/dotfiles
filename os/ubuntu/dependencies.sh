#!/bin/sh
set -e

add-apt-repository -y ppa:longsleep/golang-backports
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
    ncdu \
    jq \
    rar \
    p7zip-full \
    kubectx \
    expect

curl https://sh.rustup.rs -sSf | sh -s -- -y --no-modify-path

mkdir -p "$HOME/.rbenv/plugins"
git clone https://github.com/rbenv/ruby-build.git "$HOME/.rbenv/plugins/ruby-build"

curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.40.3/install.sh | bash
