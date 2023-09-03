call plug#begin('~/.vim/plugged')
Plug 'nvim-telescope/telescope.nvim', { 'tag': '0.1.2' }
Plug 'preservim/nerdtree'
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

" Find files using Telescope command-line sugar.
nnoremap <leader>ff <cmd>Telescope find_files<cr>
nnoremap <leader>fg <cmd>Telescope live_grep<cr>
nnoremap <leader>fb <cmd>Telescope buffers<cr>
nnoremap <leader>fh <cmd>Telescope help_tags<cr>

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
nnoremap <leader>w <ESC><ESC>:w<CR>
nnoremap <leader>q <ESC><ESC>:q<CR>
nnoremap <leader>wq <ESC><ESC>:wq<CR>
nnoremap <leader>wq <ESC><ESC>:wq<CR>
nnoremap <leader>u <ESC><ESC>:u<CR>
nnoremap <leader>s <ESC><ESC>:split<CR>
nnoremap <leader>v <ESC><ESC>:vsplit<CR>
nnoremap <leader>pi <ESC><ESC>:PlugInstall<CR>
nnoremap <leader>pc <ESC><ESC>:PlugClean<CR>
nnoremap <leader>nn <ESC><ESC>:nohlsearch<CR>
