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
    phantomjs \
    expect \
    apt-transport-https \
    ca-certificates

if [ "$SKIP_APPLICATIONS" = "true" ]; then exit 0 ; fi

# Install applications
read -p "Also install applications? (y/n) " choice
case "$choice" in
    y|Y ) eval ./linux/applications.sh;;
    n|N ) echo "Applications won't be installed.";;
    * ) echo "Invalid choice. Aborting applications installation.";;
esac
