return {
  "epwalsh/obsidian.nvim",
  dependencies = {
    "nvim-lua/plenary.nvim",
  },
  opts = {
    workspaces = {
      {
        name = "notes",
        path = vim.env.DOTFILES .. "/notes",
      },
      {
        name = "fogio",
        path = "D:\\obsidian-vaults\\fogio-notes",
      },
    },
  },
}
