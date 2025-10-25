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
    },
    format_after_save = {
      timeout_ms = 5000,
      lsp_format = "fallback",
    },
  },
}
