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
    exuberant-ctags \
    phantomjs \
    expect
