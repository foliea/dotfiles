#!/bin/sh
set -e

add-apt-repository -y ppa:longsleep/golang-backports
add-apt-repository -y ppa:cpick/hub
apt-get update -qq
apt-get install -qy \
    build-essential \
    python-dev \
    python-setuptools \
    python-pip \
    python3-dev \
    python3-setuptools \
    cmake \
    gawk \
    git \
    mercurial \
    hub \
    curl \
    wget \
    vim \
    fish \
    tmux \
    rbenv \
    golang-go \
    exuberant-ctags \
    openvpn \
    resolvconf \
    nodejs \
    npm \
    imagemagick \
    phantomjs \
    expect

pip install grip

curl https://sh.rustup.rs -sSf | sh -s -- -y --no-modify-path

$HOME/.cargo/bin/cargo install ripgrep
