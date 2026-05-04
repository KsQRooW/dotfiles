return {
  "nvim-treesitter/nvim-treesitter",
  build = ":TSUpdate",
  config = function()
    require("nvim-treesitter.configs").setup({
      -- Устанавливаем парсеры
      ensure_installed = {
        "go",
        "python",
        "rust",
        "dart",
        "html",
        "css",
        "json",
        "jinja",
        "make",
        "bash",
        "javascript",
        "typescript",
        "dockerfile",
        "jq",
        "lua",
        "markdown",
        "markdown_inline",
        "sql",
        "toml",
        "yaml",
        "xml",
        "vim",
        "regex",
      },
      highlight = {
        enable = true,
        additional_vim_regex_highlighting = false,
      },
      indent = {
        enable = true,
      },
    })
  end,
}
