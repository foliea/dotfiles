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
		zlib1g-dev
	locale-gen en_US.UTF-8
}

install_homebrew() {
	/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
}

main() {
	sudo install_ubuntu_deps
	install_homebrew
}

if [ "$1" = "install_ubuntu_deps" ]; then
	install_ubuntu_deps
elif [ "$1" = "install_homebrew" ]; then
	install_homebrew
else
	main "$@"
fi
