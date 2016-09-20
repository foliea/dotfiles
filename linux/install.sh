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
    redis-server \
    phantomjs \
    expect \
    apt-transport-https \
    ca-certificates

# Docker part
apt-key adv --keyserver hkp://p80.pool.sks-keyservers.net:80 --recv-keys 58118E89F3A912897C070ADBF76221572C52609D

echo "deb https://apt.dockerproject.org/repo ubuntu-xenial main" > /etc/apt/sources.list.d/docker.list

apt-get update -qq
apt-get install -qy docker-engine
#############

if [ "$SKIP_APPLICATIONS" = "true" ]; then exit 0 ; fi

# Install applications
read -p "Also install applications? (y/n) " choice
case "$choice" in
    y|Y ) eval ./linux/applications.sh;;
    n|N ) echo "Applications won't be installed.";;
    * ) echo "Invalid choice. Aborting applications installation.";;
esac
