if &compatible
 set nocompatible
endif

augroup MyAutoCmd
  autocmd!
augroup END

""""""""""""""""""""""""""""""""""""""""""""""
" Initialize
""""""""""""""""""""""""""""""""""""""""""""""
" Install vim-plug if not found
if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
endif

let data_dir = has('nvim') ? stdpath('data') . '/site' : '~/.vim'
if empty(glob(data_dir . '/autoload/plug.vim'))
  silent execute '!curl -fLo '.data_dir.'/autoload/plug.vim --create-dirs  https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

" Run PlugInstall if there are missing plugins
autocmd VimEnter * if len(filter(values(g:plugs), '!isdirectory(v:val.dir)'))
  \| PlugInstall --sync | PlugClean | source $MYVIMRC
\| endif

call plug#begin()

" Any valid git URL is allowed
Plug 'https://github.com/junegunn/vim-easy-align.git'

" Shorthand notation for GitHub; translates to https://github.com/junegunn/seoul256.vim.git
Plug 'junegunn/seoul256.vim'

" fzf
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }

Plug 'junegunn/fzf.vim'"

" Using a tagged release; wildcard allowed (requires git 1.9.2 or above)
Plug 'fatih/vim-go', { 'tag': '*' }

" Using a non-default branch
Plug 'neoclide/coc.nvim', { 'branch': 'release' }

" If the vim plugin is in a subdirectory, use 'rtp' option to specify its path
Plug 'nsf/gocode', { 'rtp': 'vim' }

" On-demand loading: loaded when the specified command is executed
Plug 'preservim/nerdtree', { 'on': 'NERDTreeToggle' }

" On-demand loading: loaded when a file with a specific file type is opened
Plug 'tpope/vim-fireplace', { 'for': 'clojure' }

" Git wrapper for Vim, providing Git commands within Vim
Plug 'tpope/vim-fugitive'

" Automatically closes Ruby block structures (e.g., `do...end`) in Ruby
Plug 'tpope/vim-endwise'

" Efficient comment toggling for multiple file types
Plug 'tomtom/tcomment_vim'

" Displays ANSI escape sequences in color within the terminal
Plug 'vim-scripts/AnsiEsc.vim'

" Enhanced Ruby support for Vim (syntax highlighting, indenting, etc.)
Plug 'vim-ruby/vim-ruby'

" Syntax checking and linting for various languages
Plug 'scrooloose/syntastic'

" Allows multiple cursors for simultaneous editing in Vim
Plug 'terryma/vim-multiple-cursors'

" Seamless navigation between Vim and tmux panes
Plug 'christoomey/vim-tmux-navigator'

" Vim integration for 'ag' (The Silver Searcher), a fast search tool
Plug 'rking/ag.vim'

" Lightweight and highly customizable statusline/tabline plugin for Vim
Plug 'itchyny/lightline.vim'

" Automatically inserts matching pairs for brackets, quotes, etc.
Plug 'jiangmiao/auto-pairs'

" File system explorer for Vim, opens in a tree layout
Plug 'preservim/nerdtree'

" Indent guides for code indentation levels
Plug 'Yggdroot/indentLine'

call plug#end()

filetype plugin indent on
syntax enable

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"   General Setting
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
language en_US
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
set noswapfile
set nobackup
set nowritebackup
set updatetime=300
set signcolumn=yes

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
silent! colorscheme seoul256
let g:seoul256_background = 235
colo seoul256
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
"   autocmd
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" 자동주석제거
autocmd FileType * setlocal formatoptions-=c formatoptions-=r formatoptions-=o
" tabsize set 4 for *.java
autocmd FileType java,python setlocal tabstop=4 shiftwidth=4 expandtab
" md as markdown instead of modula2
autocmd BufNewFile,BufRead *.{md,mdwn,mkd,mkdn,mark*} set filetype=markdown
" ddl, dml as sql
autocmd BufNewFile,BufRead *.{ddl,dml} set filetype=sql
" pug
autocmd BufNewFile,BufRead *.{pug*} set filetype=pug
" dockerfile
autocmd BufNewFile,BufRead Dockerfile.{*} set filetype=dockerfile

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"   fzf
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let $FZF_DEFAULT_COMMAND='find . -type f'
nnoremap ff :Files<CR>
nnoremap rr :Rg<CR>

" Initialize configuration dictionary
let g:fzf_vim = {}
let g:fzf_vim.preview_window = ['right,50%', 'ctrl-/']
let g:fzf_vim.buffers_jump = 1
let g:fzf_vim.grep_multi_line = 1
   " PATH:LINE:COL:
   " LINE

" [[B]Commits] Customize the options used by 'git log':
let g:fzf_vim.commits_log_options = '--graph --color=always --format="%C(auto)%h%d %s %C(black)%C(bold)%cr"'

" [Tags] Command to generate tags file
let g:fzf_vim.tags_command = 'ctags -R'

" [Commands] --expect expression for directly executing the command
let g:fzf_vim.commands_expect = 'alt-enter,ctrl-x'

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"   NERDTree
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:NERDTreeWinPos = "right"
let g:NERDTreeWinSize = 42
let NERDTreeShowHidden=1 " Show hide files
autocmd BufEnter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif
nnoremap <tab> :NERDTreeToggle<CR>

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"   Key mappings
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
nnoremap <leader>vi :tabe ~/.config/nvim/init.vim<CR>
nnoremap <leader>src :source ~/.config/nvim/init.vim<CR>
nnoremap <leader>ss :cohlsearch<CR>
nnoremap <silent><leader>bd :bdelete<CR>
nnoremap <leader>w :w<CR>
nnoremap <leader>q :q!<CR>
nnoremap <leader>wq :wq<CR>

nnoremap <silent> [b :bprevious<CR>
nnoremap <silent> ]b :bnext<CR>
nnoremap <silent> [B :bfirst<CR>
nnoremap <silent> [B :blast<CR>

nnoremap <silent><F5> :!ctags -R<CR>

nmap <Space> [Space]
nnoremap [Space] <Nop>

"Simply escape
inoremap jj <ESC><Right>
cnoremap <expr> j getcmdline()[getcmdpos()-2] ==# 'j' ? "\<BS>\<C-c>" : 'j'
vnoremap <C-j><C-j> <ESC>
onoremap jj <ESC>

" Windows
nnoremap sp :<C-u>split<CR>
nnoremap vs :<C-u>vsplit<CR>
nnoremap <leader>s :only<CR>

" Remove highlight
nnoremap <leader>s :nohlsearch<CR>

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Copy to clipboard
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" 시각 모드에서 사용할 수 있는 매핑 (<C-u>: 이전에 입력된 내용을 초기화)
vmap <leader>y :<C-u>call TrimAndCopy()<CR>
" 일반 모드에서 사용할 수 있는 매핑
nmap <leader>y :<C-u>call TrimAndCopy()<CR>

" 복사 기능 커스터마이징: 마지막 개행 제거 후 클립보드로 복사
function! TrimAndCopy()
  " 현재 v레지스터의 내용을 변수로 저장
  let l:save_reg = @v
  " 비주얼모드(gv)로 재진입 후 선택된 텍스트를 v레지스터에 복사(vy)
  normal! gv"vy
  " substitute함수를 이용하여 v레지스터의 내용중 마지막 개행 문자를 제거
  let l:content = substitute(@v, '\n\+$', '', '')
  " 수정 된 l:content를 시스템 클립보드(@+)에 저장
  let @+ = l:content
  " v레지스터에 원래 텍스트를 복원
  let @v = l:save_reg
endfunction

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
inoremap <silent><expr> <TAB>
      \ coc#pum#visible() ? coc#pum#next(1) :
      \ CheckBackspace() ? "\<Tab>" :
      \ coc#refresh()
inoremap <expr><S-TAB> coc#pum#visible() ? coc#pum#prev(1) : "\<C-h>"

" Make <CR> to accept selected completion item or notify coc.nvim to format
" <C-g>u breaks current undo, please make your own choice
inoremap <silent><expr> <CR> coc#pum#visible() ? coc#pum#confirm()
                              \: "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"   Indent Guide
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:indentLine_color_term = 239
let g:indentLine_char_list = ['|', '¦', '┆', '┊']

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"   respond .js
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:jsx_ext_required = 0

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"  Haml Setting
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" 자동 인덴트
autocmd FileType haml setlocal shiftwidth=2 tabstop=2 expandtab
" 자동 줄바꿈
autocmd FileType haml setlocal formatoptions+=croql
autocmd BufRead,BufNewFile *.haml set filetype=haml

" Show to double quote
let g:vim_json_syntax_conceal = 0

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"  lightline
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:lightline = {
      \ 'colorscheme': 'jellybeans',
      \ 'mode_map': { 'c': 'NORMAL' },
      \ 'active': {
      \   'left': [ [ 'mode', 'paste' ], [ 'fugitive', 'filename' ] ]
      \ },
      \ 'component_function': {
      \   'modified': 'LightLineModified',
      \   'readonly': 'LightLineReadonly',
      \   'fugitive': 'LightLineFugitive',
      \   'filename': 'LightLineFilename',
      \   'fileformat': 'LightLineFileformat',
      \   'filetype': 'LightLineFiletype',
      \   'fileencoding': 'LightLineFileencoding',
      \   'mode': 'LightLineMode',
      \ },
      \ 'separator': { 'left': "\ue0b0", 'right': "\ue0b2"},
      \ 'subseparator': { 'left': "\ue0b1", 'right': "\ue0b3"}
      \ }

function! LightLineModified()
  return &ft =~ 'help\|vimfiler\|gundo' ? '' : &modified ? '+' : &modifiable ? '' : '-'
endfunction

function! LightLineReadonly()
  return &ft !~? 'help\|vimfiler\|gundo' && &readonly ? "🔒" : ''
endfunction

function! LightLineFilename()
  return ('' != LightLineReadonly() ? LightLineReadonly() . ' ' : '') .
        \ (&ft == 'vimfiler' ? vimfiler#get_status_string() :
        \  &ft == 'unite' ? unite#get_status_string() :
        \  &ft == 'vimshell' ? vimshell#get_status_string() :
        \ '' != expand('%:p') ? expand('%:p') : '[No Name]') .
        \ ('' != LightLineModified() ? ' ' . LightLineModified() : '')
endfunction

function! LightLineFugitive()
  if &ft !~? 'vimfiler\|gundo' && exists("*fugitive#head")
    let branch = fugitive#head()
    return branch !=# '' ? "".branch : ''
  endif
  return ''
endfunction

function! LightLineFileformat()
  return winwidth(0) > 70 ? &fileformat : ''
endfunction

function! LightLineFiletype()
  return winwidth(0) > 70 ? (&filetype !=# '' ? &filetype : 'no ft') : ''
endfunction

function! LightLineFileencoding()
  return winwidth(0) > 70 ? (&fenc !=# '' ? &fenc : &enc) : ''
endfunction

function! LightLineMode()
  return winwidth(0) > 60 ? lightline#mode() : ''
endfunction

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"  Visualize multibyte space
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
function! MultibyteSpace()
  highlight MultibyteSpace cterm=underline ctermfg=lightblue guibg=darkgray
endfunction

if has('syntax')
  augroup MultibyteSpace
    autocmd!
    autocmd! ColorScheme * call MultibyteSpace()
    autocmd! VimEnter,WinEnter,BufRead * let w:m1=matchadd('MultibyteSpace', '　')
  augroup END
  call MultibyteSpace()
endif
