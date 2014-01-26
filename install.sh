#!/bin/env bash

pushd $(dirname $0) &> /dev/null
INSTALL_DIR=`dirname $(pwd)`
popd &> /dev/null

datestr=`date +%Y_%m_%d`

for filename in bashrc vim vimrc screenrc; 
do
    if test -f ~/.${filename};then
        mv ~/.${filename} ~/.${filename}.bk.${datestr}
    fi
    ln -sf $INSTALL_DIR/.dotfiles/${filename} ~/.${filename}
done

