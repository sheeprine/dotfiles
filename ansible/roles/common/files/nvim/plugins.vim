call plug#begin('~/.config/nvim/plugged')

" Sensible settings
Plug 'tpope/vim-sensible'

" Color scheme
Plug 'altercation/vim-colors-solarized'
Plug 'iCyMind/NeoSolarized'

" Fuzzy finder
if has('macunix')
  " Installed via homebrew on osx
  Plug '/usr/local/opt/fzf'
else
  Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
endif

" Async Linter
Plug 'w0rp/ale'

" Status line
Plug 'itchyny/lightline.vim' | set noshowmode
Plug 'maximbaz/lightline-ale'

" Code completion
if has('nvim')
  Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
else
  Plug 'Shougo/deoplete.nvim' | Plug 'roxma/nvim-yarp' | Plug 'roxma/vim-hug-neovim-rpc'
endif
" Language specific completion
" Go
Plug 'fatih/vim-go', { 'do': ':GoInstallBinaries' }
Plug 'zchee/deoplete-go', { 'do': 'make'}
" Python
Plug 'zchee/deoplete-jedi'

" Snippets
Plug 'SirVer/ultisnips'
Plug 'honza/vim-snippets'

Plug 'ervandew/supertab'

" Misc
Plug 'tpope/vim-surround'
Plug 'tpope/vim-sleuth'
Plug 'tpope/vim-commentary'
Plug 'tmux-plugins/vim-tmux-focus-events'

" Auto create dir on save
Plug 'benizi/vim-automkdir'

"inoremap <silent><expr> <S-TAB> pumvisible() ? "\<C-p>" : "\<S-TAB>"
"inoremap <silent><expr> <Tab> pumvisible() ? "\<C-n>" : "\<Tab>"

" Git integration
Plug 'tpope/vim-fugitive'
Plug 'airblade/vim-gitgutter'

call plug#end()
