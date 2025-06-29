#!/bin/sh
set -e

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
  rbenv \
  p7zip \
  kubectx \
  kubeseal \
  helm \
  k9s \
  awscli \
  fnm \
  eza \
  zoxide \
  fastfetch \
  lazygit \
  jesseduffield/lazydocker/lazydocker \
  btop

ln -sf "$PWD/os/shared/starship.toml" "$HOME/.config/starship.toml"

mkdir -p "$HOME/.config/wezterm"
ln -sf "$PWD/os/shared/wezterm.lua" "$HOME/.config/wezterm/wezterm.lua"

