# dotfiles

My configuration files.

<img src="/images/env.png" width="350"/>

## Dependencies

To install every dependency required:

- For macOS: See the [Darwin script](os/darwin/install.sh).
- For Ubuntu: See the [Ubuntu script](os/ubuntu/install.sh).  
  *Note: I primarily use macOS, so the Ubuntu script might not be up to date.*

The `os/arch` scripts were designed to install everything on a minimal Arch Linux CLI installation, including the window manager and applications. However, it is now deprecated and may not work as expected.

    cd os/darwin && make dependencies

## Install

    make

>If you get an error pointing out that a configuration file
already exists, please follow the `Reinstall` instructions.

## Post-installation

1. Run `chsh -s $(which fish) $USER` to change your login shell
1. Spawn a new login shell
1. Install Vim plugins (see [documentation](https://github.com/junegunn/vim-plug))
1. Install Tmux plugins (see [documentation](https://github.com/tmux-plugins/tpm))

## Reinstall

    make re

## Uninstall

    make clean
