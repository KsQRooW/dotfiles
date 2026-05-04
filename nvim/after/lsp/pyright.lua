vim.lsp.config("pyright", {
  settings = {
    python = {
      analysis = {
        typeCheckingMode = "off",
      },
    },
  },
})

-- vim.lsp.enable("pyright")
