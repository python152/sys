#!/bin/sh

# set up mac vim 

cd $HOME
rm -rf .vim*
rm -rf .spf13-vim-3
ln -sf sys/vim/vimrc.local .vimrc.local
ln -sf sys/vim/vimrc.bundles.local .vimrc.bundles.local
ln -sf sys/configure/bashrc .bashrc

curl http://j.mp/spf13-vim3 -L -o - | sh

echo "Done"
