# dotfiles
[![Build Status](https://travis-ci.org/foliea/dotfiles.svg)](https://travis-ci.org/foliea/dotfiles)

My configuration files.

### Install

    make

>If you get an error pointing out that a configuration file
already exist, please follow `Reinstall` instructions.

### Reinstall

    make re

### Post-installation

    source ~/.bashrc

### Uninstall

    make clean

## Experimental

You can install every dependencies required:

    make dependencies

>Warning: dependencies are meant to be installed only on
[Mac OS 10.9+](https://www.apple.com/fr/osx/) and on
[Debian](https://www.debian.org/) /
[Arch](https://www.archlinux.org/) based linux distributions.

You can try this configuration inside a Docker container:

    make dev

This will create a container with `archlinux` by default, but you can specify
the os base with the environment variable `OS_BASE`:

    OS_BASE=debian make dev

This container will already have every dependencies required.

You can now use above make commands inside this container.

>You need [Docker 1.3+](http://docker.com) to build this image.

## Language stacks

>N.B. `VERSION` is optional.

You can install node (with nvm):

    VERSION=0.10.30 ./node/install.sh

You can install go (with gvm):

    VERSION=1.3.1 ./go/install.sh

>The go installation script also install dependencies required by
vim plugin `vim-go`.
