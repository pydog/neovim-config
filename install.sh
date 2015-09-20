#!/bin/sh

if [ -d $HOME/.vim ];then
    echo ".vim directory exist, rename to .vim_bak"
    mv $HOME/.vim $HOME/.vim_bak
    ln -s $HOME/neovim-config/ $HOME/.vim
else
    echo "install .vim"
    ln -s $HOME/neovim-config/ $HOME/.vim
fi

echo "install plug.vim"
curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
      https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

if [ -f $HOME/.vimrc ];then
    echo ".vimrc exist, rename to .vimrc.bak"
    mv $HOME/.vimrc $HOME/.vimrc.bak
    ln -s $HOME/.vim/nvimrc $HOME/.vimrc
else
    echo "install .vimrc"
    ln -s $HOME/.vim/nvimrc $HOME/.vimrc
fi

if [ -f $HOME/.tmux.conf ];then
    echo ".tmux.conf exist, rename to .tmux.conf.bak"
    mv $HOME/.tmux.conf $HOME/.tmux.conf.bak
    ln -s $HOME/.vim/tmuxrc/tmux.conf $HOME/.tmux.conf
else
    echo "install .tmux.conf"
    ln -s $HOME/.vim/tmuxrc/tmux.conf $HOME/.tmux.conf
fi

if [ -f $HOME/.bashrc ];then
    echo ".bashrc exist, rename to .bashrc.bak"
    mv $HOME/.bashrc $HOME/.bashrc.bak
    ln -s $HOME/.vim/bashrc $HOME/.bashrc
else
    echo "install .bashrc"
    ln -s $HOME/.vim/bashrc $HOME/.bashrc
fi

