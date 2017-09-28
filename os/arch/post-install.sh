#!/bin/sh
set -e

gpg --import < $PWD/os/arch/misc/foliea.gpg

key_id=$(gpg --card-status | awk '( $1 == "sec#" ){ print $2 }' | cut -d '/' -f 2)

gpg --edit-key $key_id

git clone git@github.com:foliea/passwords.git $HOME/.password-store
