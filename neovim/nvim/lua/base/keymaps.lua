vim.g.mapleader = " " -- space and after command

local map = vim.keymap.set
local telescope = require("telescope.builtin")

-- telescope
map("n", "<leader>f", telescope.find_files, { desc = "Find Files" })
map("n", "<leader>g", telescope.live_grep, { desc = "Find by Grep" })
map("n", "<leader>b", telescope.buffers, { desc = "Find Buffers" })

-- neotree
map("n", "<leader>n", "<cmd>Neotree toggle<CR>", { desc = "Toggle Neo-tree" })

-- comments
map("n", "<leader>/", "gcc", { desc = "toggle comment", remap = true })
map("v", "<leader>/", "gc", { desc = "toggle comment", remap = true })

-- save file
map("n", "<C-s>", "<cmd>w<CR>", { desc = "general save file" })

-- disable marked text highlights
map("n", "<Esc>", "<cmd>noh<CR>", { desc = "general clear highlights" })

-- swap lines
map("v", "<A-Down>", ":m '>+1<CR>gv=gv")
map("v", "<A-Up>", ":m '<-2<CR>gv=gv")

-- next/past half page and centered cursor
map("n", "<C-d>", "<C-d>zz")
map("n", "<C-u>", "<C-u>zz")

-- swap highlighted text to something from buffer
map("x", "<leader>p", [["_dP]])

-- delete without saving into buffer
map({ "n", "v" }, "<leader>d", [["_d]])

-- show error popup
map("n", "<leader>e", vim.diagnostic.open_float)

-- show all errors
map("n", "<leader>ae", "<cmd>Telescope diagnostics<CR>")

-- changing a word throughout the file
map("n", "<leader>s", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]])

-- show projects todos
map("n", "<leader>tt", "<cmd>TodoTelescope<CR>")

-- code action
map("n", "<leader>.", vim.lsp.buf.code_action, { desc = "LSP: Code Action" })
