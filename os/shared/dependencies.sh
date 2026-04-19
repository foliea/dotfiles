#!/bin/sh
set -e

brew update

brew install \
	wget \
	curl \
	cmake \
	gawk \
	readline \
	bat \
	expect \
	jq \
	fzf \
	ripgrep \
	fd \
	eza \
	zoxide \
	git \
	git-delta \
	hub \
	gh \
	bash \
	fish \
	starship \
	tmux \
	neovim \
	mise \
	ncdu \
	kubectx \
	kubeseal \
	helm \
	awscli \
	fastfetch \
	btop \
	k9s \
	ffmpeg \
	sevenzip \
	poppler \
	resvg \
	imagemagick \
	lazygit \
	jesseduffield/lazydocker/lazydocker \
	sst/tap/opencode \
	stylua \
	prettier \
	prettierd \
	shfmt \
	beautysh \
	lua-language-server \
	fish-lsp \
	bash-language-server \
	dockerfile-language-server \
	vscode-langservers-extracted

# Ruby
ln -sf "$PWD/os/shared/default-gems" "$HOME/.default-gems"

# Node.js
ln -sf "$PWD/os/shared/default-npm-packages" "$HOME/.default-npm-packages"
