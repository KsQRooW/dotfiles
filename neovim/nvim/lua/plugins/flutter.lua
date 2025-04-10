return {
  {
    'nvim-flutter/flutter-tools.nvim',
    dependencies = {
      'nvim-lua/plenary.nvim',
      'stevearc/dressing.nvim',
      'mfussenegger/nvim-dap',
    },
    config = function()
      require("flutter-tools").setup {}
    end,
  }
}

