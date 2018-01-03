" size of a hard tabstop
set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'
"Plugin 'gmarik/Vundle.vim'
Plugin 'tpope/vim-fugitive'
"Plugin 'derekwyatt/vim-scala'
"Plugin 'vim-scripts/dbext.vim'
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
"let g:airline_theme="deus"
let g:airline_symbols.space = "\ua0"

" Always show statusline
set laststatus=2

" add line numbers
set number


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
    colorscheme spacegray
    set background=dark 
    let g:airline_theme="gruvbox"
    colorscheme gruvbox 
endif

" Add standard copy paste keys
vmap <C-c> "+yi
vmap <C-x> "+c
vmap <C-v> c<ESC>"+p
imap <C-v> <ESC>"+pa

set autochdir

if has("autocmd")
    autocmd FileType javascript setlocal ts=2 sts=2 sw=2 noexpandtab
    autocmd BufEnter * silent! lcd %:p:h
    autocmd FileType python colorscheme spacegray
    autocmd FileType python let g:airline_theme="luna"
    autocmd FileType ruby colorscheme monokai
    autocmd FileType ruby let g:airline_theme="deus"
    " run script by pressing <F9>
    autocmd FileType python nnoremap <buffer> <F9> :exec '!python' shellescape(@%, 1)<cr>
    autocmd FileType scheme nnoremap <buffer> <F9> :exec '!scheme < ' shellescape(@%, 1)<cr>
endif

" NERDTree Configuration
let NERDTreeChDirMode=2
nmap <F6> :NERDTreeToggle<CR>

" Remap upper case command to lower case command
"command Wq wq

" Buffer navigation
map <C-h> :bprev<CR>
map <C-l> :bnext<CR>
map <C-t> :bnew<CR>
