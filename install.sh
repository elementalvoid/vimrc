#!/bin/bash
set -xe

if [[ ! -d bundle/vundle ]]; then
  git clone https://github.com/gmarik/vundle.git bundle/vundle
else
  ( cd bundle/vundle; git pull; )
fi

vim -u bundle.vim +PluginInstall! +PluginClean! +q -c ':q'

[ -e ~/.vimrc ] || (cd ../; ln -s .vim/personal.vim .vimrc)
