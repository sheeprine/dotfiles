if !has('nvim')
  set nocompatible
endif

" Install plugins
source ~/.config/nvim/plugins.vim

" autocompletion
let g:deoplete#enable_at_startup = 1
let deoplete#sources#jedi#show_docstring = 1

" Syntax highlighting
filetype plugin indent on
syntax on

" Remap leader to space
let mapleader = '<Space>'

" No Ex mode
nnoremap Q <nop>

" Set go down one caracter even on same line
noremap j gj
noremap k gk

" Cursor related
set cursorline
set relativenumber
set number
set virtualedit=onemore

" Search
set showmatch
set incsearch
set hlsearch
set ignorecase
set smartcase

" Code folding
set foldenable
set foldmethod=indent

" Colorscheme
set background=dark
colorscheme NeoSolarized

set pastetoggle=<F12>

" Mouse
set mouse=a
set mousehide
set guicursor=

" Encoding
scriptencoding utf-8
set fileencodings=utf-8
set encoding=utf-8

" Indent
set nowrap
set autoindent
set shiftwidth=2
set expandtab
set tabstop=2
set softtabstop=2
set nojoinspaces
set splitright
set splitbelow
set list
set listchars=tab:▷⋅,trail:⋅,nbsp:+,extends:»,precedes:«

set formatoptions+=l
set formatoptions+=n
set formatoptions+=o
set formatoptions+=r
set formatoptions-=c
set formatoptions-=t

set noswapfile

" Switch directory to current file
autocmd BufEnter * if bufname("") !~ "^\[A-Za-z0-9\]*://" | lcd %:p:h | endif

" Make vim quiet (no confirmation)
set shortmess+=filmnrxoOtT


" Lightline
let g:lightline = {'colorscheme': 'solarized'}

" Lightline ALE integration
let g:lightline.component_expand = {
      \  'linter_warnings': 'lightline#ale#warnings',
      \  'linter_errors': 'lightline#ale#errors',
      \  'linter_ok': 'lightline#ale#ok',
      \ }
let g:lightline.component_type = {
      \     'linter_warnings': 'warning',
      \     'linter_errors': 'error',
      \ }
let g:lightline.active = { 'right': [[ 'linter_errors', 'linter_warnings', 'linter_ok' ]] }

" fzf shortcuts
nnoremap <silent> <Leader>f :Files<CR>
nnoremap <silent> <Leader>F :Files ~<CR>
nnoremap <silent> <Leader>b :Buffers<CR>
nnoremap <silent> <Leader>G :Ag<CR>

" UltiSnips
"let g:UltiSnipsExpandTrigger="<tab>"
"let g:UltiSnipsJumpForwardTrigger="<tab>"
"let g:UltiSnipsJumpBackwardTrigger="<S-tab>"
