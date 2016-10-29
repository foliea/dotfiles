#!/bin/sh
set -e

if [ ! $VERSION ]; then VERSION="2.1.5" ; fi

rbenv install $VERSION
