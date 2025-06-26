#!/bin/sh
set -e

apt-get update -qq
apt-get install -qy \
  build-essential \
  cmake \
  gawk \
  git \
  hub \
  mercurial \
  curl \
  wget \
  fish \
  tmux \
  rbenv \
  libffi-dev \
  libyaml-dev \
  libpq-dev \
  exuberant-ctags \
  openvpn \
  resolvconf \
  nodejs \
  npm \
  most \
  fzf \
  ripgrep \
  fd-find \
  ncdu \
  jq \
  rar \
  p7zip-full \
  kubectx \
  expect \
  btop

# Install latest version of neovim
curl -LO https://github.com/neovim/neovim/releases/latest/download/nvim-linux-x86_64.tar.gz && \
  rm -rf /opt/nvim && \
  mkdir -p /opt/nvim && \
  tar -C /opt/nvim --strip-components=1 -xzf nvim-linux-x86_64.tar.gz && \
  rm nvim-linux-x86_64.tar.gz

# Install k9s
wget https://github.com/derailed/k9s/releases/latest/download/k9s_linux_amd64.deb && apt install ./k9s_linux_amd64.deb && rm k9s_linux_amd64.deb

# Install ruby version manager
mkdir -p "$HOME/.rbenv/plugins"
if [ ! -d "$HOME/.rbenv/plugins/ruby-build" ]; then
  git clone https://github.com/rbenv/ruby-build.git "$HOME/.rbenv/plugins/ruby-build"
else
  echo "ruby-build already exists, skipping clone."
fi

# Install node version manager
curl -fsSL https://fnm.vercel.app/install | bash

# Setup fd-find
mkdir -p $HOME/.local/bin
ln -sf $(which fdfind) $HOME/.local/bin/fd

# Install cli tools
curl https://sh.rustup.rs -sSf | sh -s -- -y --no-modify-path

$HOME/.cargo/bin/cargo install eza zoxide

# Install TUIs
LAZYGIT_VERSION=$(curl -s "https://api.github.com/repos/jesseduffield/lazygit/releases/latest" | \grep -Po '"tag_name": *"v\K[^"]*')
curl -Lo lazygit.tar.gz "https://github.com/jesseduffield/lazygit/releases/download/v${LAZYGIT_VERSION}/lazygit_${LAZYGIT_VERSION}_Linux_x86_64.tar.gz"
tar xf lazygit.tar.gz lazygit
install lazygit -D -t /usr/local/bin/
rm lazygit.tar.gz lazygit

curl https://raw.githubusercontent.com/jesseduffield/lazydocker/master/scripts/install_update_linux.sh | bash
