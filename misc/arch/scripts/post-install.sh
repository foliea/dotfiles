#!/bin/sh
set -e

gpg --import < $GNUPGHOME/foliea.gpg

key_id=$(gpg --card-status | awk '( $1 == "sec#" ){ print $2 }' | cut -d '/' -f 2)

gpg --edit-key $key_id

sudo chmod 700 $GNUPGHOME

git remote remove origin
git remote add origin git@github.com:foliea/dotfiles.git

git clone git@github.com:foliea/passwords.git $HOME/.password-store

cp $PWD/config/slack-term $HOME/.slack-term
sed -i -e "s/{{SLACK_TOKEN}}/$(pass show Social/SlackToken)/" $HOME/.slack-term
