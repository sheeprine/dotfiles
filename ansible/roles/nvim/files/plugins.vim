call plug#begin('~/.config/nvim/plugged')

" Sensible settings
Plug 'tpope/vim-sensible'

" Color scheme
if has('nvim-0.5.0')
  Plug 'sainnhe/gruvbox-material'
  Plug 'sainnhe/sonokai'
else
  Plug 'morhetz/gruvbox'
  Plug 'altercation/vim-colors-solarized'
  Plug 'iCyMind/NeoSolarized'
endif

" Fuzzy finder
if has('nvim-0.5.0')
  " Use telescope instead of fzf
  Plug 'nvim-telescope/telescope.nvim' | Plug 'nvim-lua/popup.nvim' | Plug 'nvim-lua/plenary.nvim'
else
  " FZF
  if has('macunix')
    " Installed via homebrew on osx
    if (isdirectory('/usr/local/opt/fzf'))
      Plug '/usr/local/opt/fzf'
    endif
  endif

  if (isdirectory($HOME . '/.fzf'))
    " Already installed locally
    Plug '~/.fzf'
  else
    " Install it using nvim
    Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --bin' }
  endif
  Plug 'junegunn/fzf.vim'
endif

if has('nvim-0.5.0')
  " Tree sitter plugins
  Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
  Plug 'p00f/nvim-ts-rainbow'
endif

" Async Linter
Plug 'dense-analysis/ale'

" Status line
if has('nvim-0.5.0')
  Plug 'nvim-lualine/lualine.nvim' | Plug 'kyazdani42/nvim-web-devicons'
else
  Plug 'itchyny/lightline.vim' | set noshowmode
  Plug 'maximbaz/lightline-ale'
endif

" Code completion
if has('nvim-0.5.0')
  " Use neovim LSP integration
  Plug 'williamboman/mason.nvim'
  Plug 'williamboman/mason-lspconfig.nvim'
  Plug 'neovim/nvim-lspconfig'
  " LSP aware Completion
  Plug 'hrsh7th/cmp-nvim-lsp'
  Plug 'hrsh7th/cmp-buffer'
  Plug 'hrsh7th/nvim-cmp'
else
  if has('nvim')
    Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
  else
    Plug 'Shougo/deoplete.nvim' | Plug 'roxma/nvim-yarp' | Plug 'roxma/vim-hug-neovim-rpc'
  endif

  " Language specific completion
  " Go
  Plug 'zchee/deoplete-go', { 'do': 'make'}
  " Python
  Plug 'zchee/deoplete-jedi'
endif
Plug 'fatih/vim-go', { 'do': ':GoInstallBinaries' }

" Snippets
if has('nvim-0.5.0')
  Plug 'rafamadriz/friendly-snippets' | Plug 'L3MON4D3/LuaSnip' | Plug 'saadparwaiz1/cmp_luasnip'
else
  Plug 'SirVer/ultisnips' | Plug 'honza/vim-snippets'
endif

" Misc
Plug 'tpope/vim-surround'
if has('nvim-0.5.0')
  Plug 'b3nj5m1n/kommentary'
else
  Plug 'tpope/vim-commentary'
endif
Plug 'vim-test/vim-test'

" OpenSCAD syntax highlighting
Plug 'sirtaj/vim-openscad'
" GCode syntax highlighting
Plug 'wilriker/gcode.vim'
" Terraform highlighting
Plug 'hashivim/vim-terraform'
" Platformio support
Plug 'meck/ale-platformio'
" Mardown interactive previewer
Plug 'iamcco/markdown-preview.nvim', { 'do': { -> mkdp#util#install() }, 'for': ['markdown', 'vim-plug']}

" Auto create dir on save
Plug 'benizi/vim-automkdir'

" Git integration
Plug 'tpope/vim-fugitive'
Plug 'mhinz/vim-signify'

call plug#end()
