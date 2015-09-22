#!/bin/sh

#if [ 0 -eq 1 ];then
if [ -L $HOME/.vim ];then
    echo ".vim directory exist, delete .vim_bak and relink"
    rm -fr $HOME/.vim
    ln -s $HOME/neovim-config/ $HOME/.vim
else
    echo "install .vim"
    ln -s $HOME/neovim-config/ $HOME/.vim
fi

echo "install plug.vim"
curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
      https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

if [ -L $HOME/.vimrc ];then
    echo ".vimrc exist, delete .vimrc.bak and relink"
    rm -fr $HOME/.vimrc
    ln -s $HOME/.vim/nvimrc $HOME/.vimrc
else
    echo "install .vimrc"
    ln -s $HOME/.vim/nvimrc $HOME/.vimrc
fi

if [ -L $HOME/.tmux.conf ];then
    echo ".tmux.conf exist, delete .tmux.conf.bak and relink"
    rm -fr $HOME/.tmux.conf
    ln -s $HOME/.vim/tmuxrc/tmux.conf $HOME/.tmux.conf
else
    echo "install .tmux.conf"
    ln -s $HOME/.vim/tmuxrc/tmux.conf $HOME/.tmux.conf
fi

if [ -L $HOME/.bash_aliases ];then
    echo ".bash_aliases exist, delete .bash_aliases.bak and relink"
    rm -fr $HOME/.bash_aliases
    ln -s $HOME/.vim/bash_aliases $HOME/.bash_aliases
else
    echo "install .bash_aliases"
    ln -s $HOME/.vim/bash_aliases $HOME/.bash_aliases
fi
#fi
