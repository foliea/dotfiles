#!/bin/sh
set -e

apt-get update -q
apt-get -qy install \
    git \
    mercurial \
    curl \
    wget \
    vim \
    bash-completion \
    build-essential \
    cmake \
    python-dev \
    exuberant-ctags \
    postgresql \
    redis-server \
    phantomjs
