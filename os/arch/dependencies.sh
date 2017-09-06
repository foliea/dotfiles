#!/bin/sh
set -e

pacman -Sy --noconfirm \
    awk \
    sed \
    make \
    cmake \
    curl \
    python2 \
    python-pip \
    gcc5 \
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
    unrar \
    xsel

yaourt -Syu --noconfirm \
    base-devel \
    openssh \
    mercurial \
    curl \
    wget \
    phantomjs \
    expect

pip install grip docker-compose

systemctl enable docker
systemctl start docker

groupadd docker
usermod -aG docker $USER
