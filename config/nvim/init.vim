call plug#begin('~/.vim/plugged')
Plug 'preservim/nerdtree'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'lifepillar/vim-solarized8'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'tpope/vim-endwise'
Plug 'tpope/vim-rails'
Plug 'jiangmiao/auto-pairs'
Plug 'projekt0n/github-nvim-theme'
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim', { 'tag': '0.1.2' }
call plug#end()

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"   General Setting
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set encoding=utf-8
"set fileencodings=iso-2022-jp,euc-jp,sjis,utf-8
set fileencodings=utf-8
set fileformats=unix,dos,mac

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

"Auto comment out off
set formatoptions-=r
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

" Enable Solarized8 Dark theme
syntax enable
let g:solarized_termtrans = 1 " This gets rid of the grey background
colorscheme solarized8
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

" Airline
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#left_sep = ' '
let g:airline#extensions#tabline#left_alt_sep = '|'
let g:airline#extensions#tabline#formatter = 'unique_tail'
let g:airline#extensions#tabline#buffer_idx_mode = 1 " $B%?%VHV9fI=<((B

" fzf
let $FZF_DEFAULT_COMMAND='find . -type f'
nnoremap <leader>r :Rg<CR>
nnoremap <leader>f :Files<CR>
nnoremap <leader>g :GFiles<CR>
nnoremap <leader>b :Buffers<CR>

" Find files using Telescope command-line sugar.
" nnoremap <leader>ff <cmd>Telescope find_files<cr>
" nnoremap <leader>fg <cmd>Telescope live_grep<cr>
" nnoremap <leader>fb <cmd>Telescope buffers<cr>
" nnoremap <leader>fh <cmd>Telescope help_tags<cr>

let g:NERDTreeWinPos = "left"
let g:NERDTreeWinSize = 30
let NERDTreeShowHidden=1 " Show hide files
autocmd BufEnter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif
nnoremap <leader><tab> :NERDTreeToggle<CR>

nnoremap <leader>vi :tabe ~/.config/nvim/init.vim<CR>
nnoremap <leader>src :source ~/.config/nvim/init.vim<CR>
nnoremap qq :bd<CR>
nnoremap <leader>s :split<CR>
nnoremap <leader>v :vsplit<CR>
nnoremap <leader>pp :PlugInstall<CR>
nnoremap <leader>ss :nohlsearch<CR>
nnoremap <leader>w :w<CR>

nnoremap <silent> [b :bprevious<CR>
nnoremap <silent> ]b :bnext<CR>
nnoremap <silent> [B :bfirst<CR>
nnoremap <silent> [B :blast<CR>

" noremap <Up> <Nop>
" noremap <Down> <Nop>
" noremap <Left> <Nop>
" noremap <Right> <Nop>

"공백제거
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

" Coc.nvim
" Some servers have issues with backup files, see #649
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
inoremap <silent><expr> <TAB> coc#pum#visible() ? coc#pum#next(1) : "\<Tab>"
inoremap <expr><S-TAB> coc#pum#visible() ? coc#pum#prev(1) : "\<C-h>"
" Make <CR> to accept selected completion item or notify coc.nvim to format
" <C-g>u breaks current undo, please make your own choice
inoremap <silent><expr> <CR> coc#pum#visible() ? coc#pum#confirm()
                              \: "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"
