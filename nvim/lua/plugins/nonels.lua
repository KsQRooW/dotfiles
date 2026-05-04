local mypy_extra_args = {}
if not vim.uv.fs_stat("pyproject.toml") then
  mypy_extra_args = {
    "--strict",
    "--follow-untyped-imports",
  }
end

return {
  "nvimtools/none-ls.nvim",
  dependencies = { "nvim-lua/plenary.nvim" },
  config = function()
    local null_ls = require("null-ls")

    null_ls.setup({
      sources = {
        null_ls.builtins.diagnostics.mypy.with({
          extra_args = mypy_extra_args,
          -- cwd = function(params)
          --   return params.root
          -- end,
        }),
      },
    })
  end,
}
