#!/bin/sh
set -e

brew update

brew install cmake \
    curl \
    git \
    cmake \
    wget \
    gawk \
    readline \
    most \
    expect \
    jq \
    fish \
    starship \
    tmux \
    neovim \
    vifm \
    ncdu \
    fzf \
    ripgrep \
    fd \
    hub \
    p7zip \
    kubectx \
    kubeseal \
    helm \
    k9s \
    awscli \
    eza \
    zoxide \
    fastfetch \
    lazygit \
    jesseduffield/lazydocker/lazydocker \
    btop \
    gemini-cli \
    yazi \
    ffmpeg \
    sevenzip \
    poppler \
    resvg \
    imagemagick \
    mise

# Starship
ln -sf "$PWD/os/shared/starship.toml" "$HOME/.config/starship.toml"

# WezTerm
mkdir -p "$HOME/.config/wezterm"
ln -sf "$PWD/os/shared/wezterm.lua" "$HOME/.config/wezterm/wezterm.lua"

# Ruby
ln -sf "$PWD/os/shared/default-gems" "$HOME/.default-gems"
mise settings add idiomatic_version_file_enable_tools ruby

# Node.js
ln -sf "$PWD/os/shared/default-npm-packages" "$HOME/.default-npm-packages"
mise settings add idiomatic_version_file_enable_tools node

