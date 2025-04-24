return {
	"shortcuts/no-neck-pain.nvim",
	config = function()
		require("no-neck-pain").setup({
			width = 120,
			buffers = {
				scratchPad = {
					enabled = true,
					-- set to `nil` to default
					-- to current working directory
					location = nil,
				},
				bo = {
					filetype = "md",
				},
			},
		})
	end,
}
