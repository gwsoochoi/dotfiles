call plug#begin('~/.vim/plugged')
Plug 'preservim/nerdtree'
Plug 'scrooloose/nerdcommenter'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
call plug#end()

set hlsearch
set nu
set autoindent
set cindent
set ts=2
set sts=2
set shiftwidth=2
set showmatch
set nofixendofline

if has("syntax")
  syntax on
endif

au BufReadPost *
			\ if line("'\"") > 0 && line("'\"") <= line("$") |
			\ exe "norm g`\"" |
			\ endif

let g:ale_disable_lsp = 1
let g:ale_lint_on_text_changed = 1
let g:airline#extensions#tabline#enabled = 1
let g:airline_theme='deus'
let $FZF_DEFAULT_OPTS="--layout=reverse"
let $FZF_DEFAULT_COMMAND="rg --files --hidden --glob '!.git/**'"
let g:fzf_layout = {'up':'~90%', 'window': { 'width': 0.8, 'height': 0.8,'yoffset':0.5,'xoffset': 0.5, 'border': 'sharp' } }

nmap <C-e> :NERDTreeToggle<CR>
nmap <C-f> :Files<CR>
nmap <C-r> :Rg<CR>
"nmap <C-g> :GFiles<CR>
"nmap <C-G> :GFiles?<CR>
"nmap <C-b> :Buffers<CR>
"nmap <C-h> :History<CR>
nmap <C-[> <Plug>AirlineSelectPrevTab
nmap <C-]> <Plug>AirlineSelectNextTab
