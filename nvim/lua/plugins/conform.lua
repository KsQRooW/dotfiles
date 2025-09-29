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
    format_on_save = {
      -- These options will be passed to conform.format()
      timeout_ms = 500, -- 10 sec
      lsp_format = "fallback",
    },
  },
}
