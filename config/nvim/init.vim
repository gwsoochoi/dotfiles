" init.vim 또는 init.lua 파일에 추가
call plug#begin('~/.vim/plugged')
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim', { 'tag': '0.1.2' }
Plug 'preservim/nerdtree'
Plug 'vim-airline/vim-airline'
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

nmap <S-z> :u<CR>
nmap <S-x> :redo<CR>
nmap <C-s> :w<CR>
nmap <C-q> :q<CR>
nmap <C-o> :bprev<CR>
nmap <C-p> :bnext<CR>

" Find files using Telescope command-line sugar.
nnoremap <F1> :Telescope find_files<CR>
nnoremap <F2> :Telescope live_grep<CR>
nnoremap <F3> :Telescope buffers<CR>
nnoremap <F4> :Telescope help_tags<CR>

" Using Lua functions
"nnoremap <leader>ff <cmd>lua require('telescope.builtin').find_files()<cr>
"nnoremap <leader>fg <cmd>lua require('telescope.builtin').live_grep()<cr>
"nnoremap <leader>fb <cmd>lua require('telescope.builtin').buffers()<cr>
"nnoremap <leader>fh <cmd>lua require('telescope.builtin').help_tags()<cr>

let g:NERDTreeWinPos = "left"  " 너드트리 창을 왼쪽에 열기
let g:NERDTreeWinSize = 30     " 너드트리 창의 크기 조정
let g:NERDTreeIgnore = ['\.git$', '\.DS_Store', '\.vim$']  " 무시할 파일/디렉터리 목록
" Nerdtree 자동 열림 설정 (예시: 특정 파일 형식일 때만)
autocmd FileType [*] NERDTree
" Nerdtree 토글 시 자동으로 현재 파일 위치로 이동
autocmd VimEnter * NERDTree
autocmd BufEnter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif
nnoremap <C-e> :NERDTreeToggle<CR>

"nmap <C-e> :NERDTreeToggle<CR>
"nmap <C-f> :Files<CR>
"nmap <C-r> :Rg<CR>
"nmap <C-g> :GFiles<CR>
"nmap <C-G> :GFiles?<CR>
"nmap <C-b> :Buffers<CR>
"nmap <C-h> :History<CR>
"nmap <C-[> <Plug>AirlineSelectPrevTab
"nmap <C-]> <Plug>AirlineSelectNextTab
