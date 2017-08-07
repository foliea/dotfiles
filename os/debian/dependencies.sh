#!/bin/sh
set -e

apt-get update -qq
apt-get install -qy \
    build-essential \
    python-dev \
    cmake \
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
    nodejs \
    npm \
    imagemagick \
    phantomjs \
    expect

curl -fsSL get.docker.com -o get-docker.sh

pip install docker-compose

pip install docker-compose grip
