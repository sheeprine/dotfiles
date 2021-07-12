local configs = require'nvim-treesitter.configs'

configs.setup {
  ensure_installed = {
    'bash', 'c', 'cpp', 'go', 'json', 'lua', 'python', 'regex', 'rst', 'rust',
    'toml', 'yaml'
  },
  highlight = {
    enable = true,
  },
  indent = {
    enable = true
  },
  rainbow = {
    enable = true
  },
}

-- Use treesitter for folding
vim.wo.foldmethod = 'expr'
vim.wo.foldexpr = 'nvim_treesitter#foldexpr()'
