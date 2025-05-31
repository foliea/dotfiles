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

# Install plugins
vim +'PlugInstall --sync' +qa

# Install coc extensions
coc_extensions_dir="$HOME/.config/coc/extensions"

mkdir -p "$coc_extensions_dir"

package_json="$coc_extensions_dir/package.json"

if [ ! -f "$package_json" ]; then
    echo '{"dependencies":{}}' > "$package_json"
fi

for extension in coc-tsserver \
    coc-solargraph \
    coc-json \
    coc-prisma \
    coc-sh \
    coc-yaml \
    coc-cmake \
    coc-swagger \
    coc-markdownlint
do
    npm install "$extension" --prefix "$coc_extensions_dir" --global-style --ignore-scripts --no-bin-links --no-package-lock --only=prod
done
