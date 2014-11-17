#!/bin/sh

set -e

apt-get update -q
apt-get -qy install \
    curl \
    wget \
    git \
    mercurial \
    vim \
    exuberant-ctags \
    postgres \
    redis-server \
    phantomjs
