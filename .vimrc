" size of a hard tabstop
set tabstop=4
set shiftwidth=4
set softtabstop=4

" add line numbers
set number

" set color scheme
syntax enable
set background=dark 
colorscheme solarized

"highlight LineNr ctermfg=grey
"highlight NonText ctermfg=12
"highlight Comment ctermfg=12

set guioptions-=T  "remove toolbar
set guioptions-=r  "remove right-hand scroll bar
set guioptions-=L  "remove left-hand scroll bar

imap ;; <Esc>
vmap <C-c> "+yi
vmap <C-x> "+c
vmap <C-v> c<ESC>"+p
imap <C-v> <ESC>"+pa

nnoremap <buffer> <F9> :exec '!python' shellescape(@%, 1)<cr>
