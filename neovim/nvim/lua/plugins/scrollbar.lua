return {
	{
		"petertriho/nvim-scrollbar",
		dependencies = { "lewis6991/gitsigns.nvim", "kevinhwang91/nvim-hlslens" },
		config = function()
			require("scrollbar.handlers.search").setup({})
			require("scrollbar").setup({
				handlers = {
					search = true,
					gitsigns = true,
				},
			})
		end,
	},
}
