local M = {}

local telescope = require("telescope.builtin")

M.custom_telescope_lsp_document_symbols = function()
  local ft = vim.bo.filetype
  local ignore_symbols_by_ft = {
    dart = { "field", "constructor", "enummember" },
    python = { "variable" },
  }
  local ignore_symbols = ignore_symbols_by_ft[ft] or {}
  telescope.lsp_document_symbols({
    ignore_symbols = ignore_symbols,
  })
end

return M
