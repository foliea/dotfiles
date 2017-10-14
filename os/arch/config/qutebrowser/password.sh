#!/bin/sh

domain=$(echo "$QUTE_URL" | awk -F/ '{ print $3 }')

pass show Web/$domain | xclip -r -in -selection clipboard
