## dotfiles

My Unix/Linux configuration files.

### Install

    make

>If you get an error pointing out that a configuration file
already exist, please follow `Reinstall` instructions.

### Reinstall

    make re

### Uninstall

    make clean

## Experimental

You can install every dependencies required:

    make dependencies

>Warning: dependencies are meant to be installed only on
[Max OS 10.9+](https://www.apple.com/fr/osx/) and
[Ubuntu 14.04+](http://http://www.ubuntu-fr.org/). You can try
to install it on another version but this is at your own risk.

You can try this configuration inside a Docker container:

    make test

This container already have every dependencies required.
You can now use above make commands inside this container.

>You need [Docker 1.3+](http://docker.com) to build this image.

## Language stacks

You can install ruby (with rvm):

    ./scripts/ruby.sh

You can install node (with nvm):

    ./scripts/node.sh

You can install go (with gvm):

    ./scripts/go.sh

>The go installation script also install dependencies required by
vim plugin `vim-go`.
