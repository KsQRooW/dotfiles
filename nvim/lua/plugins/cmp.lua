return {
  { "rcarriga/cmp-dap" },
  {
    "hrsh7th/nvim-cmp",
    dependencies = {
      "hrsh7th/cmp-nvim-lsp",      -- LSP completion source
      "hrsh7th/cmp-buffer",        -- buffer words source
      "hrsh7th/cmp-path",          -- filesystem paths
      "hrsh7th/cmp-cmdline",       -- command-line completion
      "L3MON4D3/LuaSnip",          -- snippet engine
      "saadparwaiz1/cmp_luasnip",  -- LuaSnip source
      "rafamadriz/friendly-snippets", -- Predefined snippets
    },
    config = function()
      local cmp = require("cmp")
      cmp.setup({
        mapping = {
          ["<Down>"] = cmp.mapping.select_next_item(),
          ["<Up>"] = cmp.mapping.select_prev_item(),
          ["<Tab>"] = cmp.mapping(function(fallback)
            if cmp.visible() then
              cmp.confirm({ select = true }) -- confirm first
            else
              fallback()
            end
          end, { "i", "s" }),
          -- ["<CR>"] = cmp.mapping.confirm({ select = true }),
        },
        sources = cmp.config.sources({
          { name = "nvim_lsp" },
          { name = "buffer" },
          { name = "path" },
        }),
      })

      -- autocomplete in dap
      cmp.setup({
        enabled = function()
          return vim.api.nvim_buf_get_option(0, "buftype") ~= "prompt" or require("cmp_dap").is_dap_buffer()
        end,
      })
      cmp.setup.filetype({ "dap-repl", "dapui_watches" }, {
        sources = {
          { name = "dap" },
        },
      })
    end,
  },
}
