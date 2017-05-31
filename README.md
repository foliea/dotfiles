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

1. Spawn a new shell
2. Run `:PlugInstall` from vim to install all plugins

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
