syntax on
set nocompatible
set number
set hlsearch
set ignorecase
set incsearch
set encoding=UTF-8
set colorcolumn=120
set termguicolors
set mouse=

call plug#begin()

Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'scrooloose/nerdtree'
Plug 'jiangmiao/auto-pairs'
Plug 'tpope/vim-endwise'
Plug 'sheerun/vim-polyglot'
Plug 'mattn/emmet-vim'
Plug 'kqito/vim-easy-replace'
" Plug 'prettier/vim-prettier', { 'do': 'yarn install --frozen-lockfile --production' }
Plug 'joshdick/onedark.vim'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'ryanoasis/vim-devicons'
Plug 'tpope/vim-fugitive'
Plug 'mhinz/vim-signify'
Plug 'neoclide/coc.nvim', { 'branch': 'release' }
Plug 'github/copilot.vim'
Plug 'scrooloose/nerdcommenter'
Plug 'APZelos/blamer.nvim'
Plug 'terryma/vim-multiple-cursors'
Plug 'SirVer/ultisnips'
Plug 'mlaursen/vim-react-snippets'
Plug 'w0rp/ale'

call plug#end()

colorscheme onedark

let g:airline#extensions#tabline#enabled = 1
let g:airline_powerline_fonts = 1
let g:airline#extensions#branch#enabled=1
let g:airline_theme='luna'

let g:WebDevIconsUnicodeDecorateFolderNodes = 1
let g:WebDevIconsNerdTreeAfterGlyphPadding = '  '
let g:webdevicons_enable_airline_tabline = 1
let g:webdevicons_enable_airline_statusline = 1

let ruby_space_errors = 1
let ruby_operators = 1

let g:user_emmet_leader_key=','
let g:onedark_termcolor = 256

let g:copilot#enabled = 1

" let g:prettier#autoformat = 1
" let g:prettier#autoformat_require_pragma = 0

let g:ale_sign_error = '❌'
let g:ale_sign_warning = '⚠️ '
let g:ale_fix_on_save = 1
let g:ale_ruby_rubocop_executable = 'bin/rubocop'
let g:ale_sign_column_always = 1
let g:ale_linters_explicit = 1
let g:ale_fixers = {
			\ 'javascript': ['prettier'],
			\ 'javascriptreact': ['prettier'],
			\ 'ruby': ['rubocop']
			\}

let g:ale_linters = {
			\ 'javascript': ['eslint'],
			\ 'javascriptreact': ['eslint'],
			\ 'ruby': ['rubocop']
			\}


let g:NERDSpaceDelims = 1
let g:NERDTrimTrailingWhitespace = 1
let g:NERDCompactSexyComs = 1

let g:blamer_enabled = 1

let g:python3_host_prog = $PYTHON3_LOCATION

command! -bang -nargs=* RG
	\ call fzf#vim#grep2(
	\ "rg --column --line-number --no-heading --color=always --smart-case " . $FZF_IGNORED_FOLDERS . " -- ",
	\ <q-args>,
	\ fzf#vim#with_preview(),
	\ <bang>0)

nnoremap <C-p> :FZF <CR>
nnoremap <C-h> :bp <CR>
nnoremap <C-l> :bn <CR>
nnoremap <C-\> :NERDTreeToggle <CR>
nnoremap <C-s> :w <CR>
nnoremap <C-w><C-w> :bp\|bd #<CR>

nmap 		 <leader>f :NERDTreeFind<CR>
nmap     <C-F>f :RG <CR>

inoremap <silent><expr> <CR> coc#pum#visible() ? coc#pum#confirm() : "\<CR>"

autocmd BufWritePre * %s/\s\+$//e
