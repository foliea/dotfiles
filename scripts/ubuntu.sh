#!/bin/sh

set -e

apt-get update -q
apt-get -qy install \
    curl \
    wget \
    git \
    mercurial \
    vim \
    build-essential \
    cmake \
    python-dev \
    exuberant-ctags \
    postgresql \
    redis-server \
    phantomjs
