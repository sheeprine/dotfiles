return {
  "mfussenegger/nvim-dap",
  dependencies = {
    "theHamsta/nvim-dap-virtual-text",
    "igorlfs/nvim-dap-view",
    "mfussenegger/nvim-dap-python",
    "nvim-neotest/nvim-nio"
  },
  lazy = true,
  config = function()
    require("nvim-dap-virtual-text").setup()
    require('dap-view').setup()
    local python_path = table.concat({ vim.fn.stdpath('data'),  'mason', 'packages', 'debugpy', 'venv', 'bin', 'python'}, '/'):gsub('//+', '/')
    require('dap-python').setup(python_path)

    local dap = require('dap')
    local api = vim.api
    local keymap_restore = {}
    dap.listeners.after['event_initialized']['me'] = function()
      for _, buf in pairs(api.nvim_list_bufs()) do
        local keymaps = api.nvim_buf_get_keymap(buf, 'n')
        for _, keymap in pairs(keymaps) do
          if keymap.lhs == "K" then
            table.insert(keymap_restore, keymap)
            api.nvim_buf_del_keymap(buf, 'n', 'K')
            -- api.nvim_buf_del_keymap(buf, 'n', '<Down>')
            -- api.nvim_buf_del_keymap(buf, 'n', '<Right>')
            -- api.nvim_buf_del_keymap(buf, 'n', '<Left>')
          end
        end
      end
      api.nvim_set_keymap(
        'n', 'K', '<Cmd>lua require("dap.ui.widgets").hover()<CR>', { silent = true })
      api.nvim_set_keymap(
        'n', '<Down>', '<Cmd>lua require("dap").step_over()<CR>', { silent = true })
      api.nvim_set_keymap(
        'n', '<Right>', '<Cmd>lua require("dap").step_into()<CR>', { silent = true })
      api.nvim_set_keymap(
        'n', '<Left>', '<Cmd>lua require("dap").step_out()<CR>', { silent = true })
    end

    dap.listeners.after['event_terminated']['me'] = function()
      for _, keymap in pairs(keymap_restore) do
        if keymap.rhs then
          api.nvim_buf_set_keymap(
            keymap.buffer,
            keymap.mode,
            keymap.lhs,
            keymap.rhs,
            { silent = keymap.silent == 1 }
          )
        elseif keymap.callback then
          vim.keymap.set(
          keymap.mode,
          keymap.lhs,
          keymap.callback,
          { buffer = keymap.buffer, silent = keymap.silent == 1 }
          )
        end
      end
      keymap_restore = {}
    end
  end,
  keys = {
    {"<leader>dt", function() require("dap").repl.toggle() end},
    {"<leader>dv", function() require("dap-view").toggle() end},
    {"<leader>db", function() require('dap').toggle_breakpoint() end},
    {"<leader>dc", function() require("dap").continue() end},
    {"<leader>dC", function() require("dap").run_to_cursor() end},
  },
}
