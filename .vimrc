set nocompatible
filetype off

set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
	Plugin 'VundleVim/Vundle.vim'
	Plugin 'scrooloose/nerdtree'
	Plugin 'junegunn/fzf.vim'
	Plugin 'machakann/vim-highlightedyank'
	Plugin 'vim-airline/vim-airline'
	Plugin 'vim-airline/vim-airline-themes'
	Plugin 'vim-ruby/vim-ruby'
call vundle#end()

set rtp+=~/.fzf
let g:fzf_layout = { 'window': { 'width': 0.9, 'height': 0.6 } }

if has("syntax")
  syntax on
endif

let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#left_sep = ' '
let g:airline#extensions#tabline#left_alt_sep = '|'
let g:airline#extensions#tabline#formatter = 'default'

set hlsearch
set nu
set autoindent
set cindent
set ts=2
set sts=2
set shiftwidth=2
set laststatus=2
set showmatch
set smartcase
set smarttab
set smartindent
set ruler

colorscheme jellybeans

nmap <C-e> :NERDTreeToggle<CR>
nmap <C-s> :w<CR>
nmap <C-q> :q<CR>
nmap <C-l> :Files<CR>
nmap <C-o> :vsp<CR>
nmap <C-p> :sp<CR>

" :b ${filename}: 파일이동
