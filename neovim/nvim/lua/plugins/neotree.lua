return {
	{
		"nvim-neo-tree/neo-tree.nvim",
		dependencies = {
			"nvim-lua/plenary.nvim",
			"nvim-tree/nvim-web-devicons", -- не обязательный, но красивый
			"MunifTanjim/nui.nvim",
		},
		config = function()
			require("neo-tree").setup({
				filesystem = {
					filtered_items = {
						visible = true,
						hide_dotfiles = false,
						hide_gitignored = false,
					},
				},

				-- close neo-tree when opening a file.
				event_handlers = {
					{
						event = "file_opened",
						handler = function()
							require("neo-tree").close_all()
						end,
					},
				},
			})
		end,
	},
}
