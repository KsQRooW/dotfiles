return {
	"shortcuts/no-neck-pain.nvim",
	config = function()
		require("no-neck-pain").setup({
			width = 120,
			buffers = {
				scratchPad = {
					enabled = true,
					location = nil,
				},
				bo = {
					filetype = "md",
				},
			},
		})
	end,
}
