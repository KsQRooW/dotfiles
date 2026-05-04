local config = {}

if not vim.uv.fs_stat("pyproject.toml") then
  config.init_options = {
    settings = {
      lineLength = 120,
      lint = {
        select = { "ALL" },
        ignore = {
          "ANN",
          "D100",
          "D104",
          "D415",
          "TD",
          "FIX",
          "RUF001",
          "RUF002",
          "RUF003",
          "DTZ",
        },
      },
    },
  }
end

vim.lsp.config("ruff", config)

-- vim.lsp.enable("ruff")
