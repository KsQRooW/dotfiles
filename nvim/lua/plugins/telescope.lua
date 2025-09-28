local function custom_ignores()
	local cwd = vim.fn.getcwd()
	local patterns = {}
	if cwd == vim.env.DOTFILES then
		patterns = {}
	end
	return patterns
end

return {
	"nvim-telescope/telescope.nvim",
	dependencies = {
		"nvim-lua/plenary.nvim",
		"BurntSushi/ripgrep",
		"sharkdp/fd",
	},
	config = function()
		local telescope = require("telescope")

		telescope.setup({
			defaults = {
				layout_config = {
					prompt_position = "top",
				},
				sorting_strategy = "ascending",
				file_ignore_patterns = custom_ignores(),
			},
			pickers = {
				find_files = {
					find_command = { "rg", "--files", "--hidden", "--glob", "!**/.git/*" },
				},
			},
		})
	end,
}
