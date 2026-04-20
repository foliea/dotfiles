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
  gh \
  bash \
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
  bash-language-server \
  dockerfile-language-server \
  vscode-langservers-extracted

# xdg-open shim
mkdir -p "$HOME/.local/bin"
cp "$(dirname "$0")/xdg-open.sh" "$HOME/.local/bin/xdg-open"
chmod +x "$HOME/.local/bin/xdg-open"
