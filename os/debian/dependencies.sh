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
    bash-completion \
    exuberant-ctags \
    phantomjs \
    expect
