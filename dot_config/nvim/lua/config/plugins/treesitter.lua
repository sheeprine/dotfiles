return {
  "nvim-treesitter/nvim-treesitter",
  build = ":TSUpdate",
  opts = {
    ensure_installed = {
      "bash", "c", "cpp", "go", "json", "lua", "python", "regex", "rst", "rust",
      "toml", "yaml"
    },
    auto_install = true,
    indent = {
      enable = true
    },
    highlight = {
      enable = true,
    },
  },
}
