#!/bin/sh
set -e

pacman -Sy --noconfirm \
    awk \
    sed \
    make \
    cmake \
    python2 \
    python-pip \
    gcc \
    git \
    docker \
    p7zip \
    ctags \
    tmux \
    fzf \
    ripgrep \
    mariadb \
    vim \
    vifm \
    fish \
    xsel

yaourt -Syu --noconfirm \
    base-devel \
    openssh \
    mercurial \
    curl \
    wget \
    phantomjs \
    expect

pip install docker-compose
pip install grip
