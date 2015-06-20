" size of a hard tabstop
set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')
" let Vundle manage Vundle, required
Plugin 'gmarik/Vundle.vim'
Plugin 'tpope/vim-fugitive'
Plugin 'nanotech/jellybeans.vim'
" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required

set tabstop=4
set shiftwidth=4
set expandtab

" add line numbers
set number

" set color scheme
set t_Co=256
syntax enable
set background=dark 
if has('gui_running')
    " GUI colors
    colorscheme solarized
else
    " Non-GUI (terminal) colors
    colorscheme tomorrownighteighties
endif

set guioptions-=T  "remove toolbar
set guioptions-=r  "remove right-hand scroll bar
set guioptions-=L  "remove left-hand scroll bar

" add standard copy paste keys
vmap <C-c> "+yi
vmap <C-x> "+c
vmap <C-v> c<ESC>"+p
imap <C-v> <ESC>"+pa

nnoremap <buffer> <F9> :exec '!python' shellescape(@%, 1)<cr>

" Remap upper case command to lower case command
command WQ wq
command Wq wq
command W w
command Q q 
