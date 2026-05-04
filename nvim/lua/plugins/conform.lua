return {
  "stevearc/conform.nvim",
  opts = {
    formatters = {
      stylua = {
        prepend_args = {
          "--indent-type",
          "Spaces",
          "--indent-width",
          "2",
        },
      },
    },
    formatters_by_ft = {
      lua = { "stylua" },
      dart = { "dart_format" },

      markdown = { "prettier" },
      json = { "prettier" },
      javascript = { "prettier" },
      python = { "ruff_fix", "ruff_organize_imports", "ruff_format", "black" },
    },
    format_after_save = {
      timeout_ms = 5000,
      lsp_format = "fallback",
    },
  },
}
