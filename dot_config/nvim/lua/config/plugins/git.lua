return {
  {
    "tpope/vim-fugitive",
    lazy = true,
    keys = {
      {"<leader>gl", function() vim.cmd.Git("log") end},
      {"<leader>gm", function() vim.cmd.Git("log main..HEAD") end},
      {"<leader>gs", function() vim.cmd.Gtabedit(":") end},
      {"<leader>gb", function() vim.cmd.Git("branch") end},
    },
    cmd = "Git",
    config = function() 
      local Git_Plugin = vim.api.nvim_create_augroup("Git_Plugin", {})

      local autocmd = vim.api.nvim_create_autocmd
      autocmd("BufWinEnter", {
        group = Git_Plugin,
        pattern = "*",
        callback = function()
          if vim.bo.ft ~= "fugitive" then
            return
          end

          local opts = {buffer = true, remap = false}
          vim.keymap.set("n", "<leader>gpu", function()
            vim.cmd.Git("push -u origin")
          end, opts)
          vim.keymap.set("n", "<leader>gpf", function()
            vim.cmd.Git("push -fu origin")
          end, opts)
        end,
      })
      autocmd("DiffUpdated", {
        group = Git_Plugin,
        pattern = "*",
        callback = function()
          local opts = {buffer = true, remap = false}
          vim.keymap.set("n", "gl", function() vim.cmd.diffget("//2") end, opts)
          vim.keymap.set("n", "gr", function() vim.cmd.diffget("//3") end, opts)
          vim.keymap.set("n", "ZZ", vim.cmd.Gwrite, opts)
        end,
      })
    end
  },
  {
    "mhinz/vim-signify",
  }
}
