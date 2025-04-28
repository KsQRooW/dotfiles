return {
	"folke/todo-comments.nvim",
	dependencies = { "nvim-lua/plenary.nvim" },
	opts = {
		keywords = {
			TODO = { color = "todo", alt = { "todo" } },
		},
		highlight = {
			multiline = false,
			multiline_pattern = "^.",
			multiline_context = 10,
			before = "",
			keyword = "fg",
			after = "fg",
			pattern = [[.*<(KEYWORDS)\s*:]],
			comments_only = true,
		},
		colors = {
			todo = { "#d8ff00" },
		},
	},
}
