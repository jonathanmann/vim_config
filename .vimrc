" size of a hard tabstop
filetype plugin indent on
set tabstop=4
set shiftwidth=4
set expandtab

" add line numbers
set number

" set color scheme
syntax enable
set background=dark 
colorscheme solarized

set guioptions-=T  "remove toolbar
set guioptions-=r  "remove right-hand scroll bar
set guioptions-=L  "remove left-hand scroll bar

imap ` <Esc>

" add standard copy paste keys
vmap <C-c> "+yi
vmap <C-x> "+c
vmap <C-v> c<ESC>"+p
imap <C-v> <ESC>"+pa

nnoremap <buffer> <F9> :exec '!python' shellescape(@%, 1)<cr>
