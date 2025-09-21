return {
  "nvim-flutter/flutter-tools.nvim",
  dependencies = {
    "nvim-lua/plenary.nvim",
    "stevearc/dressing.nvim",
    "mfussenegger/nvim-dap",
  },
  config = function()
    require("flutter-tools").setup({
      dev_log = {
        open_cmd = "10split",
        focus_on_open = false,
      },
      widget_guides = {
        enabled = true,
      },
      lsp = {
        color = {
          enabled = true,
          foreground = false,
          background = true,
        },
      },
    })
  end,
}
