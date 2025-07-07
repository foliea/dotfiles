#!/bin/sh
set -e

brew update

brew install \
    wget \
    curl \
    cmake \
    gawk \
    readline \
    most \
    expect \
    jq \
    fzf \
    ripgrep \
    fd \
    eza \
    zoxide \
    git \
    hub \
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
ln -sf "$PWD/os/shared/starship.toml" "$HOME/.config/starship.toml"

# Ruby
ln -sf "$PWD/os/shared/default-gems" "$HOME/.default-gems"
mise settings add idiomatic_version_file_enable_tools ruby
mise use -g ruby@latest

# Node.js
ln -sf "$PWD/os/shared/default-npm-packages" "$HOME/.default-npm-packages"
mise settings add idiomatic_version_file_enable_tools node
mise use -g node@latest

# Terraform
mise settings add idiomatic_version_file_enable_tools terraform
mise use -g terraform@latest
