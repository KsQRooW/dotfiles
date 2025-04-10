return {
  {
    'lewis6991/gitsigns.nvim',
    event = { "BufReadPre", "BufNewFile" }, -- лениво загружать при открытии файла
    config = function()
      require('gitsigns').setup {
        current_line_blame = true, -- показывает blame автора для текущей строки
      }
    end,
  }
}
