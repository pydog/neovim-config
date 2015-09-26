let g:python_host_prog='/usr/bin/python2.7'
let g:python3_host_prog='/usr/bin/python3'

set nocompatible
filetype off

call plug#begin("~/.vim/bundle")
" Plugin List
Plug 'rking/ag.vim'
Plug 'kien/ctrlp.vim'
Plug 'Yggdroot/indentLine'
Plug 'Valloric/YouCompleteMe', {'do': 'CXX=clang++ CC=clang ./install.sh --clang-completer --system-libclang --system-boost'}
Plug 'rdnetto/YCM-Generator',{'branch':'stable'}
Plug 'bigeagle/molokai'
Plug 'bling/vim-airline'
Plug 'scrooloose/nerdtree'
Plug 'scrooloose/syntastic'

Plug 'terryma/vim-multiple-cursors'
Plug 'majutsushi/tagbar'
Plug 'SirVer/ultisnips' | Plug 'honza/vim-snippets'
Plug 'jrosiek/vim-mark'
Plug 'mbbill/undotree'
Plug 'kien/rainbow_parentheses.vim'

Plug 'tpope/vim-fugitive'
Plug 'zaiste/tmux.vim'
call plug#end()

" UI
if !exists("g:vimrc_loaded")
    colorscheme molokai
    let g:molokai_original = 1
    if has("gui_running")
        set guioptions-=T "隐藏工具栏
        set guioptions-=L
        set guioptions-=r
        set guioptions-=m
        set gfn=Source\ Code\ Pro\ for\ Powerline\ Semi-Bold\ 10
        set gfw=STHeiti\ 9
        set langmenu=en_US
        set linespace=0
    endif " has
endif " exists(...)

set so=10
set number
syntax on
filetype on
filetype plugin on
filetype indent on
set t_Co=256


augroup goback_exited_line
if has("autocmd")  " go back to where you exited
    "autocmd BufWritePost * mark"
    autocmd BufReadPost *
        \ if line("'\"") > 1 && line ("'\"") <= line("$") |
        \   exe "normal g'\"" |
        \ endif
endif
augroup END

set completeopt=longest,menu " preview

"if has('mouse')
"    set mouse=a
"    set selectmode=mouse,key
"    set nomousehide
"endif

let mapleader = ","
set autoindent
set modeline
set cursorline
set cursorcolumn

set showmatch
set matchtime=0
set nobackup
set nowritebackup
"set directory=~/.vim/.swapfiles//

if has('vim')
   set ttimeout
   set ttimeoutlen=0
endif

"在insert模式下能用删除键进行删除
set backspace=indent,eol,start

"show tab and space
set list
set listchars=trail:-
set list lcs=tab:\¦\

"change tab to be space
set shiftwidth=4
set tabstop=4
set expandtab
augroup tab_space_option
if has("autocmd")
    "replace all tab to space
    autocmd BufWrite,BufRead *.c,*.cpp,*.java,*.h,*.sh,.vimrc if ! &bin | silent! :%retab! | endif
    "auto remove the space at the end of line
    autocmd BufWrite,BufRead *.c,*.cpp,*.java,*.h,*.sh,.vimrc if ! &bin | silent! :%s/\s\+$// | endif
    "auto remove space of the beginning
    autocmd BufWrite,BufRead *.c,*.cpp,*.java,*.h,*.sh,.vimrc if ! &bin | silent! %s/\r//g | endif
endif
augroup END

set fenc=utf-8
set fencs=utf-8,gbk,gb18030,gb2312,cp936,usc-bom,euc-jp
set enc=utf-8

"按缩进或手动折叠
augroup vimrc
  au BufReadPre * setlocal foldmethod=indent
  au BufWinEnter * if &fdm == 'indent' | setlocal foldmethod=manual | endif
augroup END
set foldcolumn=0 "设置折叠区域的宽度
set foldlevel=100
" 用空格键来开关折叠
nnoremap <space> @=((foldclosed(line('.')) < 0) ? 'zc' : 'zo')<CR>
vnoremap <Space> zf


set smartcase
set ignorecase
set nohlsearch
set incsearch
set autochdir

vmap j gj
vmap k gk
nmap j gj
nmap k gk

nmap T :tabnew<cr>
nmap <C-h> :vertical res-10<cr>
nmap <C-l> :vertical res+10<cr>

au FileType c,cpp,h,java,css,js,nginx,scala,go inoremap  <buffer>  {<CR> {<CR>}<Esc>O

au BufNewFile *.py call ScriptHeader()
au BufNewFile *.sh call ScriptHeader()

function ScriptHeader()
    if &filetype == 'python'
        let header = "#!/usr/bin/env python2"
        let coding = "# -*- coding:utf-8 -*-"
        let future = "from __future__ import print_function, division, unicode_literals"
        let cfg = "# vim: ts=4 sw=4 sts=4 expandtab"
    elseif &filetype == 'sh'
        let header = "#!/bin/bash"
    endif
    let line = getline(1)
    if line == header
        return
    endif
    normal m'
    call append(0,header)
    if &filetype == 'python'
        call append(1, coding)
        call append(2, future)
        call append(4, cfg)
    endif
    normal ''
endfunction


source ~/.vim/config/airline.vim
source ~/.vim/config/tagbar.vim
source ~/.vim/config/nerdtree.vim
source ~/.vim/config/cscope.vim
source ~/.vim/config/syntastic.vim
source ~/.vim/config/ycm.vim
source ~/.vim/config/ultisnips.vim
source ~/.vim/config/rainbow_brackets.vim
source ~/.vim/config/ctrlp.vim
source ~/.vim/config/undotree.vim

" Load local config if exists
if filereadable(expand("~/.vim/config/local.vim"))
    source ~/.vim/config/local.vim
endif

