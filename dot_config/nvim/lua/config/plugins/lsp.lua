return {
  "neovim/nvim-lspconfig",
  dependencies = {
    "williamboman/mason.nvim",
    "williamboman/mason-lspconfig.nvim",
    "hrsh7th/cmp-nvim-lsp",
    "hrsh7th/cmp-buffer",
    "hrsh7th/cmp-path",
    "hrsh7th/cmp-cmdline",
    "hrsh7th/nvim-cmp",
    "L3MON4D3/LuaSnip",
    "saadparwaiz1/cmp_luasnip",
    {
      "j-hui/fidget.nvim",
      opts = {},
    },
  },
  config = function()
    local cmp = require('cmp')
    local cmp_lsp = require("cmp_nvim_lsp")
    local capabilities = vim.tbl_deep_extend(
        "force",
        {},
        vim.lsp.protocol.make_client_capabilities(),
        cmp_lsp.default_capabilities())

    require("mason").setup()
    vim.lsp.config('lua_ls', {
      on_init = function(client)
        if client.workspace_folders then
          local path = client.workspace_folders[1].name
          if path ~= vim.fn.stdpath('config') and (vim.uv.fs_stat(path..'/.luarc.json') or vim.uv.fs_stat(path..'/.luarc.jsonc')) then
            return
          end
        end

        client.config.settings.Lua = vim.tbl_deep_extend('force', client.config.settings.Lua, {
          runtime = {
            -- Tell the language server which version of Lua you're using
            -- (most likely LuaJIT in the case of Neovim)
            version = 'LuaJIT'
          },
          -- Make the server aware of Neovim runtime files
          workspace = {
            checkThirdParty = false,
            library = {
              vim.env.VIMRUNTIME
              -- Depending on the usage, you might want to add additional paths here.
              -- "${3rd}/luv/library"
              -- "${3rd}/busted/library",
            }
            -- or pull in all of 'runtimepath'. NOTE: this is a lot slower and will cause issues when working on your own configuration (see https://github.com/neovim/nvim-lspconfig/issues/3189)
            -- library = vim.api.nvim_get_runtime_file("", true)
          }
        })
      end,
      settings = {
        Lua = {
          diagnostics = {
            globals = { "bit", "vim", "it", "describe", "before_each", "after_each" },
          }
        }
      }
    })
    vim.lsp.config('bashls', {
      settings = {
        bashIde = {
          globPattern = vim.env.GLOB_PATTERN or '*@(.sh|.inc|.bash|.command|.zsh)',
        },
      },
      filetypes = {"bash", "sh", "zsh"}
    })
    -- local handlers = {
    --   function(server_name)
    --     require("lspconfig")[server_name].setup {
    --       capabilities = capabilities
    --     }
    --   end,
    -- }
    require("mason-lspconfig").setup({
      ensure_installed = {
        "bashls",
        -- "pyright",
        "basedpyright",
        -- "debugpy",
        "lua_ls",
        "rust_analyzer",
        "gopls",
        "yamlls",
      },
      handlers = handlers
    })

    vim.lsp.enable("bashls")
    vim.lsp.enable("basedpyright")
    vim.lsp.enable("lua_ls")
    vim.lsp.enable("rust_analyzer")
    vim.lsp.enable("gopls")
    vim.lsp.enable("yamlls")

    local cmp_select = { behavior = cmp.SelectBehavior.Select }
    cmp.setup({
      snippet = {
        expand = function(args)
          require('luasnip').lsp_expand(args.body)
        end,
      },
      mapping = cmp.mapping.preset.insert({
        ['<C-d>'] = cmp.mapping.scroll_docs(-4),
        ['<C-f>'] = cmp.mapping.scroll_docs(4),
        ['<C-p>'] = cmp.mapping.select_prev_item(cmp_select),
        ['<C-n>'] = cmp.mapping.select_next_item(cmp_select),
        ['<C-e>'] = cmp.mapping.close(),
        ['<C-y>'] = cmp.mapping.confirm({ select = true }),
        ["<C-Space>"] = cmp.mapping.complete(),
      }),
      sources = cmp.config.sources({
        { name = 'nvim_lsp' },
        { name = 'luasnip' },
      }, {
        { name = 'buffer' },
      })
    })

    vim.diagnostic.config({
      float = {
        focusable = false,
        style = "minimal",
        border = "rounded",
        source = true,
        header = "",
        prefix = "",
      },
      virtual_lines = {
        current_line=true,
      },
    })
    local Lsp_Plugin = vim.api.nvim_create_augroup("Lsp_Plugin", {})

    local autocmd = vim.api.nvim_create_autocmd
    autocmd('LspAttach', {
      group = Lsp_Plugin,
      callback = function()
        local opts = {buffer = true, remap = false, silent = true}
        vim.keymap.set("n", "gD", vim.lsp.buf.declaration, opts)
        vim.keymap.set("n", "gd", vim.lsp.buf.definition, opts)
        vim.keymap.set("n", "<leader>vws", vim.lsp.buf.workspace_symbol, opts)
        vim.keymap.set("n", "<leader>vd", function() vim.diagnostic.open_float() end, opts)
        vim.keymap.set("i", "<C-h>", vim.lsp.buf.signature_help, opts)
        print("Loaded keybindings")
      end
  })
  end
}
