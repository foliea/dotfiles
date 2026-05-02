#!/bin/sh
set -e

if ! command -v omarchy-version >/dev/null 2>&1; then
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
    yazi \
    tmux \
    neovim \
    mise \
    ncdu \
    fastfetch \
    btop \
    k9s \
    lazygit \
    jesseduffield/lazydocker/lazydocker \
    anomalyco/tap/opencode \
    Valkyrie00/homebrew-bbrew/bbrew \
    ffmpeg \
    sevenzip \
    poppler \
    resvg \
    imagemagick \
    selene \
    shellcheck \
    actionlint
fi

# Local bin scripts
mkdir -p "$HOME/.local/bin"
for script in xdg-open pkg-install-menu open-folder-menu agents-menu node-global-install; do
  cp "$PWD/os/shared/scripts/$script.sh" "$HOME/.local/bin/$script"
  chmod +x "$HOME/.local/bin/$script"
done
