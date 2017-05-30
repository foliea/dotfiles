#!/bin/sh
set -e

pacman -Sy --noconfirm \
    awk \
    sed \
    make \
    cmake \
    python2 \
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
    fish

yaourt -Syu --noconfirm \
    base-devel \
    openssh \
    mercurial \
    curl \
    wget \
    phantomjs \
    expect
