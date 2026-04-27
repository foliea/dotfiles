#!/bin/sh
set -e

install_system_deps() {
  sudo apt-get update
  sudo apt-get install -y \
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
  sudo locale-gen en_US.UTF-8
}

install_homebrew() {
  /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
}

install_shared() {
  sh "$(dirname "$0")/../shared/dependencies.sh"
}

TARGET="${1:-all}"

case "$TARGET" in
  system) install_system_deps ;;
  homebrew) install_homebrew ;;
  shared) install_shared ;;
  all)
    install_system_deps
    install_homebrew
    install_shared
    ;;
  *) echo "Usage: $0 [system|homebrew|shared|all]" >&2; exit 1 ;;
esac
