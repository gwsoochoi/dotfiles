call plug#begin('~/.vim/plugged')
Plug 'preservim/nerdtree'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
call plug#end()

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"   General Setting
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Sets history line
set history=500

" Mapping <leader> => ,
" let mapleader=","

" Show current position at bottom-right
set ruler
set lazyredraw
set magic

" Show matching brackets when text indicator is over them
set showmatch

" How many tenths of a second to blink when matching brackets
set mat=2

" Show line number
set number

"deactive mouse
set mouse=

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"   Search Setting
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Ignore case when searching
set ignorecase

" Be smart when searching
set smartcase

" Highlight search last result
set hlsearch

" Move cursor when searching
set incsearch

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"   Color Setting
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Syntax Enable
syntax on

" Use color scheme 'jellybeans'
colorscheme jellybeans

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"   Indent Setting
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" tab == 2 space
set tabstop=2
set shiftwidth=2
set softtabstop=2

" Using tab like 4 space
set expandtab
set smarttab

" Auto Indent
set ai
" Smart Indent
set si

let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#left_sep = ' '
let g:airline#extensions#tabline#left_alt_sep = '|'
let g:airline#extensions#tabline#formatter = 'default'

" fzf
nnoremap <leader><tab> :GFiles<CR>
nnoremap <leader>fb :Buffers<CR>

let g:NERDTreeWinPos = "left"
let g:NERDTreeWinSize = 30
autocmd BufEnter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif
nnoremap <C-n> :NERDTreeToggle<CR>
nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l

nnoremap <leader>vi :tabe ~/.config/nvim/init.vim<CR>
nnoremap <leader>src :source ~/.config/nvim/init.vim<CR>
nnoremap <leader>w :w<CR>
nnoremap <leader>q :bd<CR>
nnoremap <leader>s :split<CR>
nnoremap <leader>v :vsplit<CR>
nnoremap <leader>pp :PlugInstall<CR>
nnoremap <leader>ss :nohlsearch<CR>
nnoremap <S-z> :u<CR>
