local telescope = require'telescope'
local actions = require'telescope.actions'

-- Override default send to quickfix
telescope.setup{
  defaults = {
    file_ignore_patterns = {
      "^vendor/",
      "^plugged/",
    },
    mappings = {
      i = {
        ["<C-q>"] = actions.smart_send_to_qflist + actions.open_qflist,
      },
      n = {
        ["<C-q>"] = actions.smart_send_to_qflist + actions.open_qflist,
      }
    }
  }
}

local opts = {noremap = true, silent = true}
vim.api.nvim_set_keymap('n', '<leader>f', [[<cmd>lua require('telescope.builtin').find_files({ hidden = true })<CR>]], opts)
vim.api.nvim_set_keymap('n', '<leader>b', [[<cmd>lua require('telescope.builtin').buffers()<CR>]], opts)
vim.api.nvim_set_keymap('n', '<leader>rg', [[<cmd>lua require('telescope.builtin').live_grep()<CR>]], opts)
vim.api.nvim_set_keymap('n', '<leader>rh', [[<cmd>lua require('telescope.builtin').live_grep({prompt_title='Live Grep (hidden)', additional_args=function(opts) return {'--hidden'} end})<CR>]], opts)
vim.api.nvim_set_keymap('n', '<leader>gc', [[<cmd>lua require('telescope.builtin').git_commits()<CR>]], opts)
