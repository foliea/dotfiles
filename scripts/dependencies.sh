#!/bin/sh
set -e

echo "Installing dependencies..."
echo "Warning! dependencies can be installed only on Darwin and Ubuntu"

if [ `uname -s` = "Darwin" ]; then
    ./darwin/install.sh

    # Install applications
    read -p "Also install applications? (y/n) " choice
    case "$choice" in
      y|Y ) eval install_applications;;
      n|N ) echo "Applications won't be installed.";;
      * ) echo "Invalid choice. Aborting applications installation.";;
    esac
elif [ `uname -s` = "Linux" ]; then
    ./ubuntu/install.sh
fi

./docker-compose/install.sh

echo "Dependencies installed successfully."