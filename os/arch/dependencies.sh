#!/bin/sh
set -e

sudo pacman -Sy --noconfirm

yaourt -Sy --noconfirm

for package in awk \
    sed \
    make \
    cmake \
    curl \
    python2 \
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
    xsel \
    base-devel \
    python-grip \
    openssh \
    mercurial \
    curl \
    wget \
    phantomjs \
    expect \
    docker-compose \
    rbenv \
    ruby-build
do
    sh $PWD/os/arch/install-package.sh $package
done

sudo systemctl enable docker
sudo systemctl start docker

sudo usermod -aG docker $USER
