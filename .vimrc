" size of a hard tabstop
set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'
"Plugin 'gmarik/Vundle.vim'
Plugin 'tpope/vim-fugitive'
"Plugin 'vim-scripts/dbext.vim'
Plugin 'marcopaganini/termschool-vim-theme'
Plugin 'scrooloose/nerdtree'
Plugin 'morhetz/gruvbox'
Plugin 'sickill/vim-monokai'
call vundle#end()            " required
filetype plugin indent on    " required

set tabstop=4
set shiftwidth=4
set expandtab

" Set Airline Config Options
let g:airline#extensions#tabline#enabled = 1
let g:airline_powerline_fonts = 1
if !exists('g:aireline_symbols')
    let g:airline_symbols = {}
endif
let g:airline_symbols.space = "\ua0"
set laststatus=2 " Always show statusline
set number " add line numbers

" set color scheme
syntax enable
if has('gui_running')
    " GUI colors
    set background=dark 
    colorscheme solarized
    let g:airline_theme="luna"
    let g:airline_solarized_bg="dark"
    let g:airline_powerline_fonts = 0
    set guioptions-=T  "remove toolbar
    set guioptions-=r  "remove right-hand scroll bar
    set guioptions-=L  "remove left-hand scroll bar
else
    " Non-GUI (terminal) colors
    set t_Co=256
    set background=dark 
    let g:airline_theme="gruvbox"
    colorscheme gruvbox 
    if has("autocmd")
        "autocmd FileType python colorscheme spacegray
        "autocmd FileType python let g:airline_theme="deus"
        "autocmd FileType python colorscheme monokai
        "autocmd FileType python let g:airline_theme="luna"
        autocmd FileType ruby colorscheme termschool
        autocmd FileType ruby let g:airline_theme="deus"
        " autocmd FileType javascript colorscheme spacegray
        " autocmd FileType javascript let g:airline_theme="luna"
        autocmd FileType haskell colorscheme monokai
        autocmd FileType haskell let g:airline_theme="gruvbox"
    endif
endif

" Add standard copy paste keys
vmap <C-c> "+yi
vmap <C-x> "+c
vmap <C-v> c<ESC>"+p
imap <C-v> <ESC>"+pa

set autochdir

" Run script by pressing <F9>
nnoremap <buffer> <F9> :exec '!.' shellescape(@%, 1)<cr>   

if has("autocmd")
    autocmd FileType javascript setlocal ts=2 sts=2 sw=2 noexpandtab
    autocmd BufEnter * silent! lcd %:p:h
    autocmd FileType python nnoremap <buffer> <F9> :exec '!python' shellescape(@%, 1)<cr>
    autocmd FileType cpp nnoremap <buffer> <F9> :!g++ -std=c++11 % -Wall -g -o %.out && ./%.out<cr>
    autocmd FileType c nnoremap <buffer> <F9> :!gcc % -o %.out && ./%.out<cr>
    autocmd FileType scheme nnoremap <buffer> <F9> :exec '!scheme < ' shellescape(@%, 1)<cr>
    autocmd FileType haskell nnoremap <buffer> <F9> :exec '!time stack runghc ' shellescape(@%, 1)<cr>
    autocmd FileType tex nnoremap <buffer> <F9> :exec '!pdflatex' shellescape(@%, 1)<cr>
    autocmd BufRead,BufNewFile *.r2py set filetype=python
endif

" NERDTree Configuration
let NERDTreeChDirMode=2
nmap <F6> :NERDTreeToggle<CR>

source ~/.vim/config/config.vim
au BufNewFile *.py 0r ~/.vim/config/py_header.txt
"au BufNewFile *.py exe "%s/{{REPLACE_AUTHOR}}/" .AUTHOR
"au BufNewFile *.py exe "%s/{{REPLACE_EMAIL}}/" .EMAIL

au BufNewFile *.cpp 0r ~/.vim/config/cpp_starter.txt
au BufNewFile *.cpp exe "%s/{{REPLACE_FILENAME}}/" expand('%:t')
au BufNewFile *.cpp exe "%s/{{REPLACE_AUTHOR}}/" .AUTHOR
au BufNewFile *.cpp exe "%s/{{REPLACE_EMAIL}}/" .EMAIL
au BufNewFile *.cpp exe "%s/^Created:.*/Created: " .strftime("%Y-%m-%d %H:%M:%S")
au BufWritePre *.cpp exe "%s/^Updated:.*/Updated: " .strftime("%Y-%m-%d %H:%M:%S")
au BufWritePost *.cpp ''

au BufNewFile *.tex 0r ~/.vim/config/tex_starter.txt

" Buffer navigation
map <C-h> :bprev<CR>
map <C-l> :bnext<CR>
map <C-n> :bnew<CR>
