-- catppuccin-frappe
-- return {
-- 	"catppuccin/nvim",
-- 	name = "catppuccin",
-- 	priority = 1000, -- чтобы тема применялась до загрузки других плагинов
-- 	config = function()
-- 		vim.cmd.colorscheme("catppuccin-frappe")
-- 	end,
-- }

-- rose-pine
-- return {
-- 	"rose-pine/neovim",
-- 	name = "rose-pine",
-- 	priority = 1000,
-- 	config = function()
-- 		require("rose-pine").setup({
-- 			styles = {
-- 				italic = false,
-- 			},
-- 		})
-- 		vim.cmd("colorscheme rose-pine")
-- 	end,
-- }

-- kanagawa
return {
	"rebelot/kanagawa.nvim",
	name = "kanagawa",
	priority = 1000,
	config = function()
		require("kanagawa").setup({
			transparent = true,
			keywordStyle = { italic = false },
		})
		vim.cmd("colorscheme kanagawa-wave")
	end,
}
