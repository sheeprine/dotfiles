return {
  {
    "folke/trouble.nvim",
    opts = {
      modes = {
        symbols = {
          mode = "lsp_document_symbols",
          focus = true,
          win = {
            type = "split",
            position = "right",
            size = 0.25,
          },
        },
      },
    },
    lazy = true,
    cmd = "Trouble",
    keys = {
      {
        "<leader>da",
        "<cmd>Trouble diagnostics toggle<cr>",
        desc = "Diagnostics (Trouble)",
      },
      {
        "<leader>db",
        "<cmd>Trouble diagnostics toggle filter.buf=0<cr>",
        desc = "Buffer Diagnostics (Trouble)",
      },
      {
        "<leader>cs",
        "<cmd>Trouble symbols toggle focus=true<cr>",
        desc = "Symbols (Trouble)",
      },
    },
  },
}
