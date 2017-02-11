#!/bin/sh
set -e

pacman -Sy --noconfirm docker p7zip ctags ripgrep mariadb

yaourt -Syu --noconfirm base-devel \
                        make \
                        cmake \
                        python2 \
                        openssh \
                        git \
                        mercurial \
                        curl \
                        wget \
                        vim \
                        bash-completion \
                        phantomjs \
                        expect \
                        chromedriver

git clone --depth 1 https://github.com/junegunn/fzf.git ~/.fzf

sh $HOME/.fzf/install --all
