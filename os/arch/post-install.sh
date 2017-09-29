#!/bin/sh
set -e

gpg --import < $PWD/os/arch/misc/foliea.gpg

key_id=$(gpg --card-status | awk '( $1 == "sec#" ){ print $2 }' | cut -d '/' -f 2)

gpg --edit-key $key_id

sudo chmod 700 $GNUPGHOME

git remote remove origin
git remote add origin git@github.com:foliea/dotfiles.git