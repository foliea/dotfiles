#!/bin/sh
set -e

case $1/$2 in
  post/*)
    pkill openvpn
    ;;
esac
