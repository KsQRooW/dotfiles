return {
	{
		"nvim-lualine/lualine.nvim",
		dependencies = { "nvim-tree/nvim-web-devicons" }, -- красивые иконки
		config = function()
			require("lualine").setup({})
		end,
	},
}
