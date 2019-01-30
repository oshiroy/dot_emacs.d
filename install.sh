#!/usr/bin/env sh


cur_dir = pwd
# install auto install
if [ ! -e $HOME/.emacs.d/auto-install ]; then
    mkdir -p $HOME/.emacs.d/auto-install
    cd ~/.emacs.d/auto-install
    wget http://www.emacswiki.org/emacs/download/auto-install.el
    emacs --batch -Q -f batch-byte-compile auto-install.el
    cd $cur_dir
fi
