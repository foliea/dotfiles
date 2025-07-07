#!/bin/sh

case $1/$2 in
post/*)
	pkill gpg-agent
	;;
esac
