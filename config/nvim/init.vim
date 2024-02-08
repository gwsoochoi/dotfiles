call plug#begin('~/.vim/plugged')
Plug 'preservim/nerdtree'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'jiangmiao/auto-pairs'
Plug 'projekt0n/github-nvim-theme'
Plug 'chrisbra/csv.vim'
Plug 'thaerkh/vim-indentguides'
Plug 'vim-ruby/vim-ruby'
Plug 'tpope/vim-rails'
Plug 'tpope/vim-rbenv'
Plug 'tpope/vim-bundler'
Plug 'tpope/vim-endwise'
Plug 'craigemery/vim-autotag'
Plug 'lifepillar/vim-solarized8'
Plug 'ghifarit53/tokyonight-vim'
call plug#end()

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"   General Setting
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set encoding=utf-8
set fileencodings=utf-8
set fileformats=unix,dos,mac
set history=500
set ruler
set lazyredraw
set magic
set showmatch
set mat=2
set number
set mouse=
autocmd FileType * setlocal comments-=://
set noswapfile
syntax enable

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"   Search Setting
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set ignorecase
set smartcase
set hlsearch
set incsearch
set nofixeol
set background=dark

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"   Color Setting
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set termguicolors

let g:tokyonight_style = 'night' " available: night, storm
let g:tokyonight_enable_italic = 1

colorscheme tokyonight
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"   indent setting
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set tabstop=2
set shiftwidth=2
set softtabstop=2
set expandtab
set smarttab
set ai
set si
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"   Airline
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#left_sep = ' '
let g:airline#extensions#tabline#left_alt_sep = '|'
let g:airline#extensions#tabline#formatter = 'unique_tail'
let g:airline#extensions#tabline#buffer_idx_mode = 1 " $B%?%VHV9fI=<((B
let g:airline_section_z = '%#warningmsg#%{strftime("%H:%M")}%*'
let g:airline_theme = "tokyonight"

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"   FZF
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let $FZF_DEFAULT_COMMAND='find . -type f'
nnoremap <leader>r :Rg<CR>
nnoremap <leader>f :Files<CR>
nnoremap <leader>g :GFiles<CR>
nnoremap <leader>b :Buffers<CR>

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"   NERDTree
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:NERDTreeWinPos = "left"
let g:NERDTreeWinSize = 30
let NERDTreeShowHidden=1 " Show hide files
autocmd BufEnter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif
nnoremap <tab> :NERDTreeToggle<CR>

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"   Shortcut
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
nnoremap <leader>vi :tabe ~/.config/nvim/init.vim<CR>
nnoremap <leader>src :source ~/.config/nvim/init.vim<CR>
nnoremap <leader>q :bd<CR>
nnoremap <leader>s :split<CR>
nnoremap <leader>v :vsplit<CR>
nnoremap <leader>pp :PlugInstall<CR>
nnoremap <leader>ss :nohlsearch<CR>
nnoremap <leader>w :w<CR>

nnoremap <silent> [b :bprevious<CR>
nnoremap <silent> ]b :bnext<CR>
nnoremap <silent> [B :bfirst<CR>
nnoremap <silent> [B :blast<CR>

nnoremap <F2> :%s/minervadb_development/minervadb_production/g<CR>

" noremap <Up> <Nop>
" noremap <Down> <Nop>
" noremap <Left> <Nop>
" noremap <Right> <Nop>

nnoremap <silent><F5> :!ctags -R<CR>
vnoremap <leader>y "+y

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"   공백제거
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
function! s:remove_trailing_spaces() abort
	let x = @/
	let w = winsaveview()
	silent! %s/\s\+$//e  "silent 명령으로 치환 결과를 표시 안함
	let @/ = x
	call winrestview(w)
endfunction
" 명령으로 정의
command! -nargs=0 RemoveTrailingSpaces
			\ call <SID>remove_trailing_spaces()
" 저장시마다 발동
augroup TS
  au!
  au BufWritePre * RemoveTrailingSpaces
augroup END
" 키맵으로 정의해서 원할때마다 실행하려면
noremap <script><silent> <Plug>(remove_trailing_spaces)
			\ :<C-u>RemoveTrailingSpaces()<CR>
nmap <F12> <Plug>(remove_trailing_spaces)

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"   Coc.nvim
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set nobackup
set nowritebackup

" Having longer updatetime (default is 4000 ms = 4s) leads to noticeable
" delays and poor user experience
set updatetime=300

" Always show the signcolumn, otherwise it would shift the text each time
" diagnostics appear/become resolved
set signcolumn=yes

" Use tab for trigger completion with characters ahead and navigate
" NOTE: There's always complete item selected by default, you may want to enable
" no select by `"suggest.noselect": true` in your configuration file
" NOTE: Use command ':verbose imap <tab>' to make sure tab is not mapped by
" other plugin before putting this into your config

" Ruby Support
let g:coc_global_extensions = ['coc-solargraph']
inoremap <silent><expr> <TAB> coc#pum#visible() ? coc#pum#next(1) : "\<Tab>"
inoremap <expr><S-TAB> coc#pum#visible() ? coc#pum#prev(1) : "\<C-h>"

" Make <CR> to accept selected completion item or notify coc.nvim to format
" <C-g>u breaks current undo, please make your own choice
inoremap <silent><expr> <CR> coc#pum#visible() ? coc#pum#confirm()
      \: "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"   Indent Guide
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:indentguides_spacechar = '┆'
let g:indentguides_tabchar = '|'

noremap <Up> <Nop>
noremap <Down> <Nop>
noremap <Left> <Nop>
noremap <Right> <Nop>
