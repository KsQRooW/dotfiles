vim.g.mapleader = " " -- space and after command

local map = vim.keymap.set
local telescope = require("telescope.builtin")
local git = require("gitsigns")
local dap = require("dap")
local dapui = require("dapui")
local iron = require("iron.core")
local conform = require("conform")

-- telescope
map("n", "<leader>ff", telescope.find_files, { desc = "Find Files" })
map("n", "<leader>gg", telescope.live_grep, { desc = "Find by Grep" })
map("n", "<leader>bb", telescope.buffers, { desc = "Find Buffers" })
map("n", "<leader>gs", telescope.git_status, { desc = "Find Git Status Files" })
-- files symbols
map("n", "<leader>fo", "<cmd>Telescope lsp_document_symbols<CR>")

-- neotree
map("n", "<leader>n", "<cmd>Neotree toggle<CR>", { desc = "Toggle Neo-tree" })

-- comments
map("n", "<leader>/", "gcc", { desc = "toggle comment", remap = true })
map("v", "<leader>/", "gc", { desc = "toggle comment", remap = true })

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
map("n", "<leader>xx", "<cmd>Telescope diagnostics severity=ERROR<CR>")

-- changing a word throughout the file
map("n", "<leader>s", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]])

-- show projects todos
map("n", "<leader>tt", "<cmd>TodoTelescope<CR>")

-- code action
map("n", "<leader>.", vim.lsp.buf.code_action, { desc = "LSP: Code Action" })

-- rename variable
map("n", "<leader>rn", vim.lsp.buf.rename)

-- go to function definition
map("n", "<leader>gd", "<cmd>Telescope lsp_definitions<CR>")

-- go to function references
map("n", "<leader>gr", "<cmd>Telescope lsp_references<CR>")

-- git (un)stage current/selected hunk
map("n", "<leader>hs", git.stage_hunk)
map("v", "<leader>hs", function()
  git.stage_hunk({ vim.fn.line("."), vim.fn.line("v") })
end)

-- git stage/unstage file
map("n", "<leader>hS", git.stage_buffer)
map("n", "<leader>hR", git.reset_buffer)

-- git reset hunk
map("n", "<leader>hr", git.reset_hunk)
map("v", "<leader>hr", function()
  local gs = package.loaded.gitsigns
  local start_line = vim.fn.line("v")
  local end_line = vim.fn.line(".")
  if start_line > end_line then
    start_line, end_line = end_line, start_line
  end
  gs.reset_hunk({ start_line, end_line })
end)

-- lazygit
map("n", "<leader>lg", "<cmd>LazyGit<cr>")

-- zen mode
map("n", "<leader>zm", "<cmd>NoNeckPain<cr>")

-- format code
map({ "n", "v" }, "<leader><leader>", function()
  conform.format({ async = true })
end)

-- split window
map("n", "<A-Right>", "<cmd>vsplit<cr>")
map("n", "<A-Down>", "<cmd>split<cr>")

-- debug with dap
map("n", "<leader>bo", dapui.toggle)
map("n", "<leader>bp", dap.toggle_breakpoint)
map("n", "<leader>bc", function()
  dapui.float_element("console", { position = "center", height = 20, width = 120 })
end)
map("n", "<leader>bd", function()
  dapui.float_element("repl", { position = "center", height = 20, width = 120 })
end)
map("n", "<F5>", dap.continue)

-- repl
iron.setup({
  keymaps = {
    toggle_repl = "<leader>rr", -- toggles the repl open and closed.
    -- If repl_open_command is a table as above, then the following keymaps are
    -- available
    -- toggle_repl_with_cmd_1 = "<leader>rv",
    -- toggle_repl_with_cmd_2 = "<leader>rh",
    restart_repl = "<leader>rR", -- calls `IronRestart` to restart the repl
    -- send_motion = "<leader>rsc",
    visual_send = "<leader>rc",
    send_file = "<leader>rf",
    send_line = "<leader>rl",
    send_paragraph = "<leader>rp",
    send_until_cursor = "<leader>ru",
    -- send_mark = "<leader>sm",
    send_code_block = "<leader>rb",
    send_code_block_and_move = "<leader>rm",
    -- mark_motion = "<leader>mc",
    -- mark_visual = "<leader>mc",
    -- remove_mark = "<leader>md",
    cr = "<leader>r<cr>",
    interrupt = "<leader>ri",
    exit = "<leader>rq",
    clear = "<leader>cl",
  },
})

-- obsidian
map("n", "<leader>of", "<cmd>ObsidianQuickSwitch<CR>")
map("n", "<leader>ow", "<cmd>ObsidianWorkspace<CR>")
