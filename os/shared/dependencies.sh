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
	yazi \
	lazygit \
	jesseduffield/lazydocker/lazydocker \
	gemini-cli \
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

# Starship
mkdir -p "$HOME/.config"
ln -sf "$PWD/os/shared/starship.toml" "$HOME/.config/starship.toml"

# Mise
mkdir -p "$HOME/.config/mise"
ln -sf "$PWD/os/shared/mise.toml" "$HOME/.config/mise/config.toml"

# Ruby
ln -sf "$PWD/os/shared/default-gems" "$HOME/.default-gems"

# Node.js
ln -sf "$PWD/os/shared/default-npm-packages" "$HOME/.default-npm-packages"

# Install default languages and tools
mise install
