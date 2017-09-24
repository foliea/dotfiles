#!/bin/sh
set -e

key_id=$(gpg --card-status | awk '( $1 == "sec#" ){ print $2 }' | cut -d '/' -f 2)

gpg --recv $key_id
gpg --edit-key $key_id
