call plug#begin('~/.vim/plugged')
Plug 'preservim/nerdtree'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'tpope/vim-endwise'
Plug 'thaerkh/vim-indentguides'
Plug 'tpope/vim-rails'
Plug 'iamcco/markdown-preview.nvim', { 'do': 'cd app && npx --yes yarn install' }
Plug 'tpope/vim-haml'
Plug 'jiangmiao/auto-pairs'
Plug 'pangloss/vim-javascript'
Plug 'mxw/vim-jsx'
Plug 'maxmellon/vim-jsx-pretty'
Plug 'elzr/vim-json'
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
set noswapfile
syntax enable

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"   autocmd
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" 자동주석제거
autocmd FileType * setlocal formatoptions-=c formatoptions-=r formatoptions-=o
" tabsize set 4 for *.java
autocmd FileType java setlocal tabstop=4 shiftwidth=4 expandtab

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

colorscheme jellybeans
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
let g:airline_theme = "jellybeans"

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"   FZF
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let $FZF_DEFAULT_COMMAND='find . -type f'
nnoremap rr :Rg<CR>
nnoremap ff :Files<CR>
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
nnoremap q <Nop>
nnoremap <silent>qq :bd<CR>
nnoremap <silent><leader>q :q!<CR>
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

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"  클립보드 복사
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
