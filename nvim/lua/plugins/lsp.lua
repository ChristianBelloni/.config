return {
  "mason-org/mason-lspconfig.nvim",
  opts = {},
  dependencies = {
    {
      "mason-org/mason.nvim",
      opts = {
        ensure_installed = {
          "tree-sitter-cli",
        }
      }
    },
    "neovim/nvim-lspconfig",
  },
}
