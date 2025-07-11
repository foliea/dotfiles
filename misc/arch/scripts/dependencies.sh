#!/bin/sh
set -e

sudo pacman -Sy --noconfirm

yaourt -Sy --noconfirm

for package in base-devel \
	cmake \
	curl \
	python2 \
	git \
	hub \
	tig \
	docker \
	p7zip \
	ctags \
	tmux \
	fzf \
	ripgrep \
	mariadb \
	vim \
	vifm \
	ncdu \
	fish \
	unrar \
	most \
	xsel \
	python-grip \
	openssh \
	mercurial \
	curl \
	wget \
	expect \
	docker-compose \
	rbenv \
	ruby-build \
	crystal \
	pyenv \
	ffmpeg \
	aws-cli \
	jq \
	kubectl \
	kubectx; do
	$PWD/bin/install-package $package
done

if [ -z "$WSL_DISTRO_NAME" ]; then
	sudo systemctl enable docker
	sudo systemctl start docker
fi

sudo usermod -aG docker $USER

curl -o- https://raw.githubusercontent.com/creationix/nvm/v0.33.11/install.sh | bash
