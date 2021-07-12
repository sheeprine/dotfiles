local compe = require'compe'

compe.setup {
  min_length = 3,
  source = {
    path = true,
    buffer = true,
    nvim_lsp = true,
    ultisnips = true,
    vsnip = true,
  }
}
