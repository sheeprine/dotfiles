-- Cursor related
vim.opt.cursorline = true
vim.opt.relativenumber = true
vim.opt.number = true
vim.opt.virtualedit = "onemore"
vim.opt.colorcolumn = "80"

-- Search
vim.opt.showmatch = true
vim.opt.incsearch = true
vim.opt.hlsearch = true
vim.opt.ignorecase = true
vim.opt.smartcase = true

-- Code folding
vim.opt.foldenable = true
vim.opt.foldcolumn = "2"
vim.opt.foldminlines = 3

-- Mouse
vim.opt.mouse = "a"
vim.opt.mousehide = true
vim.opt.guicursor = ""

-- Encoding
vim.opt.fileencodings = "utf-8"
vim.opt.encoding = "utf-8"

-- Indent
vim.opt.wrap = false
vim.opt.autoindent = true
vim.opt.shiftwidth = 2
vim.opt.expandtab = true
vim.opt.tabstop = 2
vim.opt.softtabstop = 2
vim.opt.joinspaces = true
vim.opt.splitright = true
vim.opt.splitbelow = true
vim.opt.list = true
vim.opt.listchars = {
  tab = "▷⋅",
  trail = "⋅",
  nbsp = "+",
  extends = "»",
  precedes = "«",
}
vim.opt.formatoptions = {
  l = true,
  n = true,
  o = true,
  r = true,
  q = true,
  j = true,
  c = false,
  t = false,
}

-- Persistent undo tree
vim.opt.undofile = true

-- Make vim quiet (no confirmation)
vim.opt.shortmess:append({
  f = true,
  i = true,
  l = true,
  m = true,
  n = true,
  r = true,
  x = true,
  o = true,
  O = true,
  t = true,
  T = true,
})

-- Set neovim dedicated python virtualenv
vim.g.python3_host_prog = vim.fn.stdpath("data") .. "/pyvenv/bin/python"
