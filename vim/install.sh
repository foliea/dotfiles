#!/bin/sh
set -e

echo $PWD

tmp="$PWD/vim/tmp"

mkdir -p $tmp/backup
mkdir -p $tmp/swap
mkdir -p $tmp/undo

ln -sf $PWD/vim/ $HOME/.vim
ln -sf $PWD/vim/tern-config $HOME/.tern-config

curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

# Install CoC extensions
mkdir -p $HOME/.config/coc/extensions

cd $HOME/.config/coc/extensions

if [ ! -f package.json ]; then
  echo '{"dependencies":{}}'> package.json
fi

for extension in coc-tsserver \
    coc-solargraph \
    coc-json \
    coc-prisma \
    coc-sh \
    coc-yaml \
    coc-cmake \
    coc-swagger
do
    npm install $extension --global-style --ignore-scripts --no-bin-links --no-package-lock --only=prod
done

cd -
rm $PWD/vim/vim
