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
  \| PlugInstall --sync | source $MYVIMRC
\| endif

call plug#begin()
Plug 'https://github.com/junegunn/vim-easy-align.git'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'"
Plug 'fatih/vim-go', { 'do': ':GoUpdateBinaries' }
Plug 'neoclide/coc.nvim', { 'branch': 'release' }
Plug 'nsf/gocode', { 'rtp': 'vim' }
Plug 'preservim/nerdtree', { 'on': 'NERDTreeToggle' }
Plug 'tpope/vim-fireplace', { 'for': 'clojure' }
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-endwise'
Plug 'tomtom/tcomment_vim'
Plug 'vim-scripts/AnsiEsc.vim'
Plug 'vim-ruby/vim-ruby'
Plug 'scrooloose/syntastic'
Plug 'terryma/vim-multiple-cursors'
Plug 'christoomey/vim-tmux-navigator'
Plug 'rking/ag.vim'
Plug 'itchyny/lightline.vim'
Plug 'jiangmiao/auto-pairs'
Plug 'preservim/nerdtree'
Plug 'majutsushi/tagbar'
Plug 'nathanaelkane/vim-indent-guides'
Plug 'othree/html5.vim'
Plug 'pangloss/vim-javascript'
Plug 'evanleck/vim-svelte', {'branch': 'main'}
Plug 'dart-lang/dart-vim-plugin'
Plug 'thosakwe/vim-flutter'
Plug 'catppuccin/nvim', { 'as': 'catppuccin' }
let g:tagbar_sort = 0
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
set endofline

colorscheme catppuccin-mocha

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"   Search Setting
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set ignorecase
set smartcase
set hlsearch
set incsearch
set nofixeol

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
autocmd FileType * setlocal formatoptions-=c formatoptions-=r formatoptions-=o
autocmd FileType java,python setlocal tabstop=4 shiftwidth=4 expandtab
autocmd FileType js,css,html setlocal tabstop=2 shiftwidth=2 expandtab
autocmd BufNewFile,BufRead *.{md,mdwn,mkd,mkdn,mark*} set filetype=markdown
autocmd BufNewFile,BufRead *.{ddl,dml} set filetype=sql
autocmd BufNewFile,BufRead *.{pug*} set filetype=pug
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
nnoremap <leader>ss :nohlsearch<CR>
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
nnoremap <leader>s :nohlsearch<cr>

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
" Function to check if the character before the cursor is a space
function! CheckBackspace() abort
  let col = col('.') - 1
  return col == 0 || getline('.')[col - 1]  =~# '\s'
endfunction

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
let g:indent_guides_enable_on_vim_startup = 1
let g:indent_guides_auto_colors = 1
let g:indent_guides_start_level = 2
let g:indent_guides_guide_size = 1

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
      \ 'colorscheme': 'one',
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
  let filename = expand('%:.')
  return ('' != LightLineReadonly() ? LightLineReadonly() . ' ' : '') .
        \ (&ft == 'vimfiler' ? vimfiler#get_status_string() :
        \  &ft == 'unite' ? unite#get_status_string() :
        \  &ft == 'vimshell' ? vimshell#get_status_string() :
        \ '' != filename ? filename : '[No Name]') .
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

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"  Tagbar
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
nmap tt :TagbarToggle<CR>
