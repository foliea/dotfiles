#!/bin/sh
set -e

if ! command -v omarchy-version >/dev/null 2>&1; then
  brew update

  # Core CLI
  brew install \
    wget \
    curl \
    cmake \
    gawk \
    readline \
    expect \
    jq \
    bat \
    fzf \
    ripgrep \
    fd \
    eza \
    zoxide

  # Tools
  brew install \
    bash \
    git \
    git-delta \
    gh \
    mise \
    neovim \
    sops \
    starship \
    tmux \
    typst

  # TUIs
  brew install \
    ncdu \
    k9s \
    btop \
    yazi \
    lazygit \
    jesseduffield/lazydocker/lazydocker \
    fastfetch \
    Valkyrie00/homebrew-bbrew/bbrew

  # Yazi dependencies
  brew install \
    ffmpeg \
    sevenzip \
    poppler \
    resvg \
    imagemagick

  # Linters
  brew install \
    selene \
    shellcheck \
    actionlint
fi

# Local bin scripts
mkdir -p "$HOME/.local/bin"
for script in xdg-open pkg-install-menu open-folder-menu agents-menu npm-global-install; do
  cp "$PWD/os/shared/scripts/$script.sh" "$HOME/.local/bin/$script"
  chmod +x "$HOME/.local/bin/$script"
done
