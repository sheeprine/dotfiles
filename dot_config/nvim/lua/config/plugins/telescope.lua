return {
  {
    "nvim-telescope/telescope.nvim",
    tag = "0.1.8",
    dependencies = {
      "nvim-lua/plenary.nvim",
      {
        "nvim-telescope/telescope-fzf-native.nvim",
        build = "make",
      },
    },
    -- keys = {
    --   {"<leader>f", function () require("telescope.builtin").find_files({hidden=true}) end},
    --   {"<leader>b", require("telescope.builtin").buffers},
    --   {"<leader>rg", require("telescope.builtin").live_grep},
    --   {"<leader>rh", function ()
    --     require("telescope.builtin").live_grep({
    --       prompt_title="Live Grep (hidden)",
    --       additional_args=function(opts) return {"--hidden"}
    --     end})
    --   end},
    --   {"<leader>gc", require("telescope.builtin").git_commits},
    -- },
    config = function()
      local actions = require"telescope.actions"
      require("telescope").setup({
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
      })
      require("telescope").load_extension("fzf")

      local builtin = require("telescope.builtin")

      local opts = {remap = false, silent = true}
      vim.keymap.set("n", "<leader>f", function () builtin.find_files({hidden=true}) end, opts)
      vim.keymap.set("n", "<leader>b", builtin.buffers, opts)
      vim.keymap.set("n", "<leader>rg", builtin.live_grep, opts)
      vim.keymap.set("n", "<leader>rh", function ()
        builtin.live_grep({
          prompt_title="Live Grep (hidden)",
          additional_args=function(opts) return {"--hidden"} end})
      end, opts)
      vim.keymap.set("n", "<leader>gc", builtin.git_commits, opts)
    end
  },
  {
    "barrett-ruth/http-codes.nvim",
    config = true,
    lazy = true,
    dependencies = {
      "nvim-telescope/telescope.nvim",
    },
    keys = {
      {"<leader>hc", vim.cmd.HTTPCodes}
    },
  }
}
