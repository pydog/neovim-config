# NeoVim config files

It's a new start

fork from: `git@github.com:bigeagle/neovim-config.git`

## HowTo

```
for nvim
git clone https://github.com/bigeagle/neovim-config.git
ln -s path/to/neovim-config ~/.nvim
ln -s ~/.nvim/nvimrc ~/.nvimrc
curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
  https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
pip install neovim

or
for vim
ln -s path/to/neovim-config ~/.vim
ln -s ~/.vim/nvimrc ~/.vimrc
curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
  https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
```

```
安装YCM：(前提必须联网，会需要更新第三方插件和编译)
    
    cd ~/.vim/bundle/YouCompleteMe
    ./install.sh --clang-completer
```

I use `vim-plug` to manage my plugins, you can deactive unneeded ones by commenting `.nvimrc/.vimrc`.

run `nvim/vim` then run `:PluginInstall`
