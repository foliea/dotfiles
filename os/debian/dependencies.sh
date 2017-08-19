#!/bin/sh
set -e

apt-get update -qq
apt-get install -qy \
    build-essential \
    python-dev \
    cmake \
    gawk \
    git \
    mercurial \
    curl \
    wget \
    vim \
    fish \
    tmux \
    rbenv \
    ruby-build \
    fzf \
    python-pip \
    exuberant-ctags \
    libmysqlclient-dev \
    openvpn \
    resolvconf \
    nodejs \
    npm \
    imagemagick \
    phantomjs \
    expect

curl -fsSL get.docker.com -o get-docker.sh

pip install docker-compose grip

curl https://sh.rustup.rs -sSf | sh -s -- -y --no-modify-path

$HOME/.cargo/bin/cargo install ripgrep
