#!/bin/sh
set -e

sudo pacman -Sy --noconfirm

yaourt -Sy --noconfirm

for package in base-devel \
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
    python-grip \
    openssh \
    mercurial \
    curl \
    wget \
    phantomjs \
    expect \
    docker-compose \
    rbenv \
    ruby-build \
    crystal
do
    sh $PWD/bin/install-package.sh $package
done

sudo systemctl enable docker
sudo systemctl start docker

sudo usermod -aG docker $USER

curl -L https://raw.github.com/pine/crenv/master/install.sh | bash
