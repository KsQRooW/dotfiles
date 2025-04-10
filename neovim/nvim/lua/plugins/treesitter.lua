return {
   {
    'nvim-treesitter/nvim-treesitter',
    build = ':TSUpdate',
    config = function()
      require('nvim-treesitter.configs').setup {
        -- Устанавливаем парсеры
        ensure_installed = {
          "go", "python", "rust", "dart",
          "html", "css", "json", "jinja",
          "make", "bash", "javascript",
          "typescript", "dockerfile", "jq", 
          "lua", "markdown", "sql", "toml", "yaml", "xml"
        },
        highlight = {
          enable = true,
          additional_vim_regex_highlighting = false,
        },
        indent = {
          enable = true,
        },
      }
    end,
  }
}

