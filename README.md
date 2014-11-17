## Dotfiles

My configuration for vim, bash and git.

### Install

    make

### Reinstall

    make re

### Update

    make update

### Uninstall

    make clean

## Experimental

You can install every dependencies and applications on Darwin:

    ./scripts/mac.sh

You can install ruby (with rvm):

    ./scripts/ruby.sh

You can install node (with nvm):

    ./scripts/node.sh

You can install go (with gvm):

    ./scripts/go.sh

>The go installation script also install dependencies required by
vim plugin `vim-go`.
