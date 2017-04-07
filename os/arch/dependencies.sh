#!/bin/sh
set -e

pacman -Sy --noconfirm cmake docker p7zip ctags tmux fzf ripgrep mariadb vim

yaourt -Syu --noconfirm base-devel \
                        make \
                        cmake \
                        python2 \
                        openssh \
                        git \
                        mercurial \
                        curl \
                        wget \
                        bash-completion \
                        phantomjs \
                        expect
