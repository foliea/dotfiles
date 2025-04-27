#!/bin/sh
set -e

add-apt-repository -y ppa:longsleep/golang-backports
apt-get update -qq
apt-get install -qy \
    build-essential \
    python2-dev \
    python-setuptools \
    python3-pip \
    python3-dev \
    python3-setuptools \
    python-is-python3 \
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
    golang-go \
    exuberant-ctags \
    openvpn \
    resolvconf \
    nodejs \
    npm \
    expect

pip install grip

curl https://sh.rustup.rs -sSf | sh -s -- -y --no-modify-path

$HOME/.cargo/bin/cargo install ripgrep

mkdir -p "$HOME/.rbenv/plugins"
git clone https://github.com/rbenv/ruby-build.git "$HOME/.rbenv/plugins/ruby-build"

curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.40.3/install.sh | bash
