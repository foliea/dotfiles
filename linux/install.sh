#!/bin/sh
set -e

apt-get update -qq
apt-get install -qy \
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
    postgresql-9.3 \
    redis-server \
    phantomjs \
    expect
