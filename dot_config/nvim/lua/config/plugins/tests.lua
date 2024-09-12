return {
  {
    "nvim-neotest/neotest",
    dependencies = {
      "nvim-neotest/nvim-nio",
      "nvim-lua/plenary.nvim",
      "antoinemadec/FixCursorHold.nvim",
      "nvim-treesitter/nvim-treesitter",
      "nvim-neotest/neotest-python",
    },
    opts = {
      output = {open_on_run=true},
    },
    config = function()
      local neotest = require("neotest")
      neotest.setup({
        adapters = {
          require("neotest-python"),
        },
      })
      vim.keymap.set("n", "<leader>ts", function()
        neotest.run.run({suite = true})
      end)
      vim.keymap.set("n", "<leader>tf", function()
        neotest.run.run(vim.fn.expand("%"))
      end)
      vim.keymap.set("n", "<leader>tn", function()
        neotest.run.run()
      end)
      vim.keymap.set("n", "<leader>tl", function()
        neotest.run.run_last()
      end)
      vim.keymap.set("n", "<leader>to", function()
        neotest.output.open({enter=true, auto_close=true})
      end)
      vim.keymap.set("n", "<leader>tO", function()
        neotest.output_panel.toggle()
      end)
      vim.keymap.set("n", "<leader>tp", function()
        neotest.summary.toggle({enter=true})
      end)
    end,
  },
}
