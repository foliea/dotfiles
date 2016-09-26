#!/bin/sh
set -e

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
                        expect
