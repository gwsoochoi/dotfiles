set nocompatible
filetype off

set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
Plugin 'VundleVim/Vundle.vim'
Plugin 'scrooloose/nerdtree'
Plugin 'junegunn/fzf.vim'
call vundle#end()

set rtp+=~/.fzf
let g:fzf_layout = { 'window': { 'width': 0.9, 'height': 0.6 } }

if has("syntax")
  syntax on
endif

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

nmap <C-n> :NERDTreeToggle<CR>
nmap <C-s> :w<CR>
nmap <C-e> :q<CR>
nmap <C-p> :Files<CR>
