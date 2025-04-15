# dotfiles

My configuration files.

<img src="/images/env.png" width="350"/>

## Dependencies

To install every dependency required (only works on [Arch](https://www.archlinux.org/)-based distributions):

    cd os/arch && make dependencies

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
