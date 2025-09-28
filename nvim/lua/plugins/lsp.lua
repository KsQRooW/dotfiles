return {
	"neovim/nvim-lspconfig",
	{
		"williamboman/mason.nvim",
		config = function()
			require("mason").setup()
		end,
	},
	{
		"williamboman/mason-lspconfig.nvim",
		dependencies = { "williamboman/mason.nvim", "neovim/nvim-lspconfig" },
		config = function()
			require("mason-lspconfig").setup({
				ensure_installed = {
					"pyright",
					"ruff",
					"rust_analyzer",
					"ast_grep", --dart, ts, go
					"html",
					"cssls",
					"jsonls",
					"bashls",
					"dockerls",
					"texlab",
					"lua_ls",
					"marksman", -- markdown
					"sqlls",
					"stylua", -- lua
					"taplo", -- toml
					"yamlls",
					"lemminx", -- xml
				},
				automatic_installation = true,
			})
		end,
	},
}
