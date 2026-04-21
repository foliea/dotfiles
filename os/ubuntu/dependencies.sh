#!/bin/bash
set -e

install_ubuntu_deps() {
  apt-get update
  apt-get install -y \
    build-essential \
    procps \
    curl \
    file \
    git \
    python3 \
    sudo \
    locales \
    libffi-dev \
    libyaml-dev \
    zlib1g-dev \
    aptitude
  locale-gen en_US.UTF-8
}

install_homebrew() {
  /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
}

install_shared_deps() {
  sh "$(dirname "$0")/../shared/dependencies.sh"
}

main() {
  sudo install_ubuntu_deps
  install_homebrew
  install_shared_deps
}

if [ "$1" = "install_ubuntu_deps" ]; then
  install_ubuntu_deps
elif [ "$1" = "install_homebrew" ]; then
  install_homebrew
elif [ "$1" = "install_shared_deps" ]; then
  install_shared_deps
else
  main "$@"
fi
