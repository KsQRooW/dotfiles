return {
	"nvimtools/none-ls.nvim",
	dependencies = { "nvim-lua/plenary.nvim" },
	config = function()
		local null_ls = require("null-ls")

		local venv_path = os.getenv("VIRTUAL_ENV")
		local is_windows = package.config:sub(1, 1) == "\\"
		local python_bin = nil

		if venv_path then
			if is_windows then
				python_bin = venv_path .. "\\Scripts"
			else
				python_bin = venv_path .. "/bin"
			end
		end

		null_ls.setup({
			sources = {
				null_ls.builtins.formatting.prettier.with({
					filetypes = {
						"javascript",
						"typescript",
						"javascriptreact",
						"typescriptreact",
						"html",
						"css",
						"json",
						"yaml",
						"markdown",
					},
				}),

				null_ls.builtins.formatting.stylua.with({
					filetypes = { "lua" },
				}),
				null_ls.builtins.formatting.dart_format.with({
					filetypes = { "dart" },
				}),
				null_ls.builtins.formatting.black.with({
					command = python_bin and (python_bin .. (is_windows and "\\black.exe" or "/black")),
					filetypes = { "python" },
				}),
				null_ls.builtins.diagnostics.mypy.with({
					command = python_bin and (python_bin .. (is_windows and "\\mypy.exe" or "/mypy")),
					filetypes = { "python" },
				}),
			},

			-- autoformat on save
			on_attach = function(client, bufnr)
				if client.supports_method("textDocument/formatting") then
					local augroup = vim.api.nvim_create_augroup("LspFormatting", {})
					vim.api.nvim_clear_autocmds({ group = augroup, buffer = bufnr })
					vim.api.nvim_create_autocmd("BufWritePre", {
						group = augroup,
						buffer = bufnr,
						callback = function()
							vim.lsp.buf.format({ bufnr = bufnr })
						end,
					})
				end
			end,
		})
	end,
}
