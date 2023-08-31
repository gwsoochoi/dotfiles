" init.vim 또는 init.lua 파일에 추가
call plug#begin('~/.vim/plugged')
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim', { 'tag': '0.1.2' }
Plug 'preservim/nerdtree'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'vim-ruby/vim-ruby'
Plug 'tpope/vim-rails'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
call plug#end()

set hlsearch
set nu
set autoindent
set cindent
set ts=2
set sts=2
set shiftwidth=2
set showmatch
set smartcase
set smarttab
set smartindent
set ruler
set nofixendofline

colorscheme jellybeans

if has("syntax")
  syntax on
endif

au BufReadPost *
			\ if line("'\"") > 0 && line("'\"") <= line("$") |
			\ exe "norm g`\"" |
			\ endif

let g:rails_use_deco = 1
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#left_sep = ' '
let g:airline#extensions#tabline#left_alt_sep = '|'
let g:airline#extensions#tabline#formatter = 'default'

nmap <S-z> :u<CR>
nmap <S-x> :redo<CR>
nmap <C-s> :w<CR>
nmap <C-q> :q<CR>
nmap <C-o> :bprev<CR>
nmap <C-p> :bnext<CR>
nmap <C-[> :split<CR>
nmap <C-]> :vsplit<CR>

" Find files using Telescope command-line sugar.
nnoremap <C-f> :Telescope find_files<CR>
nnoremap <C-g> :Telescope live_grep<CR>
nnoremap <F3> :Telescope buffers<CR>
nnoremap <F4> :Telescope help_tags<CR>

let g:NERDTreeWinPos = "left"
let g:NERDTreeWinSize = 30
let g:NERDTreeShowHidden = 1
autocmd BufEnter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif
nnoremap <C-n> :NERDTreeToggle<CR>
