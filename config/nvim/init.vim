call plug#begin('~/.vim/plugged')
Plug 'preservim/nerdtree'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'lifepillar/vim-solarized8'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'jiangmiao/auto-pairs'
Plug 'projekt0n/github-nvim-theme'
Plug 'chrisbra/csv.vim'
Plug 'thaerkh/vim-indentguides'
Plug 'majutsushi/tagbar'
Plug 'vim-ruby/vim-ruby'
Plug 'tpope/vim-rails'
Plug 'tpope/vim-rbenv'
Plug 'tpope/vim-bundler'
Plug 'tpope/vim-endwise'
Plug 'craigemery/vim-autotag'
Plug 'ghifarit53/tokyonight-vim'
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
autocmd FileType * setlocal comments-=://
" set formatoptions-=ro

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

" Adding new file at end of file
set nofixeol

set background=dark

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"   Color Setting
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Enable Solarized8 Dark theme
syntax enable
" let g:solarized_termtrans = 1 " This gets rid of the grey background
" colorscheme solarized8
" colorscheme onedark

set termguicolors

let g:tokyonight_style = 'night' " available: night, storm
let g:tokyonight_enable_italic = 1

colorscheme tokyonight
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

" No set automatically add comment out when add new line
" set formatoptions-=ro

" Airline
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#left_sep = ' '
let g:airline#extensions#tabline#left_alt_sep = '|'
let g:airline#extensions#tabline#formatter = 'unique_tail'
let g:airline#extensions#tabline#buffer_idx_mode = 1 " $B%?%VHV9fI=<((B
let g:airline_section_z = '%#warningmsg#%{strftime("%H:%M")}%*'
let g:airline_theme = "tokyonight"

" fzf
" Initialize
"let g:fzf_vim = {}
"let g:fzf_vim.preview_window = ['hidden,right,50%,<70(up,40%)', 'ctrl-/']
"let g:fzf_vim.preview_window = ['right,50%', 'ctrl-/']
" [Buffers] Jump to the existing window if possible
" let g:fzf_vim.buffers_jump = 1
" [[B]Commits] Customize the options used by 'git log':
" let g:fzf_vim.commits_log_options = '--graph --color=always --format="%C(auto)%h%d %s %C(black)%C(bold)%cr"'
" [Tags] Command to generate tags file
" let g:fzf_vim.tags_command = 'ctags -R'
" [Commands] --expect expression for directly executing the command
" let g:fzf_vim.commands_expect = 'alt-enter,ctrl-x'

let $FZF_DEFAULT_COMMAND='find . -type f'
nnoremap <leader>r :Rg<CR>
nnoremap <leader>f :Files<CR>
nnoremap <leader>g :GFiles<CR>
nnoremap <leader>b :Buffers<CR>

let g:NERDTreeWinPos = "left"
let g:NERDTreeWinSize = 30
let NERDTreeShowHidden=1 " Show hide files
autocmd BufEnter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif
nnoremap <tab> :NERDTreeToggle<CR>

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

nnoremap <F2> :%s/minervadb_development/minervadb_staging/g<CR>
nnoremap <F3> :%s/minervadb_staging/minervadb_production/g<CR>
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

" Ruby Support
let g:coc_global_extensions = ['coc-solargraph']
inoremap <silent><expr> <TAB> coc#pum#visible() ? coc#pum#next(1) : "\<Tab>"
inoremap <expr><S-TAB> coc#pum#visible() ? coc#pum#prev(1) : "\<C-h>"

" Make <CR> to accept selected completion item or notify coc.nvim to format
" <C-g>u breaks current undo, please make your own choice
inoremap <silent><expr> <CR> coc#pum#visible() ? coc#pum#confirm()
      \: "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"

" Indent Guide
let g:indentguides_spacechar = '┆'
let g:indentguides_tabchar = '|'

" Tagbar
nnoremap <leader>t :TagbarToggle<CR>
let g:tagbar_width = 30        " 初期設定はwidth=40なのでちょっと幅とりすぎ。
let g:tagbar_autoshowtag = 1   ":TagbarShowTag を叩かなくても有効にする

" 시스템 클립보드에 복사
vnoremap <leader>y "+y

" Vim이 시작될 때 자동으로 ctags -R 실행
autocmd VimEnter * silent! !ctags -R
