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
  anomalyco/tap/opencode \
  Valkyrie00/homebrew-bbrew/bbrew \
  stylua \
  prettier \
  prettierd \
  shfmt \
  beautysh \
  lua-language-server \
  bash-language-server \
  dockerfile-language-server \
  vscode-langservers-extracted

# Local bin scripts
mkdir -p "$HOME/.local/bin"
for script in xdg-open pkg-install-menu; do
  cp "$PWD/os/shared/scripts/$script.sh" "$HOME/.local/bin/$script"
  chmod +x "$HOME/.local/bin/$script"
done
