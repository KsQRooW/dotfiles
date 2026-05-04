return {
  "neovim/nvim-lspconfig",
  {
    "williamboman/mason.nvim",
    config = function()
      require("mason").setup()
    end,
  },
  {
    "williamboman/mason-lspconfig.nvim",
    dependencies = { "williamboman/mason.nvim", "neovim/nvim-lspconfig" },
    opts = {
      ensure_installed = {
        -- python
        "pyright",
        "ruff",

        -- lua
        "lua_ls",
        "stylua",
      },
      automatic_installation = true,
    },
  },
}
