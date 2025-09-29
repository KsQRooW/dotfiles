-- tabs
vim.opt.tabstop = 2
vim.opt.shiftwidth = 2
vim.opt.expandtab = true -- use spaces instead of tab

vim.api.nvim_create_autocmd("FileType", {
  pattern = "python",
  callback = function()
    vim.bo.shiftwidth = 4
    vim.bo.tabstop = 4
    vim.bo.expandtab = true
  end,
})

vim.api.nvim_create_autocmd("FileType", {
  pattern = "groovy",
  callback = function()
    vim.bo.shiftwidth = 4
    vim.bo.tabstop = 4
    vim.bo.expandtab = true
  end,
})

-- left column signs - just 2 signs
vim.opt.signcolumn = "yes:2"

-- smart indents
vim.opt.smartindent = true

-- line numbering
vim.opt.number = true
vim.opt.relativenumber = true

-- disable comments on pressing Enter
vim.cmd([[autocmd FileType * setlocal formatoptions-=cro]])

-- use system clipboard
vim.opt.clipboard = "unnamedplus"

-- search
vim.opt.ignorecase = true -- ignore case if all characters in lower case
vim.opt.joinspaces = false -- join multiple spaces in search
vim.opt.smartcase = true -- when there is a one capital letter search for exact match
vim.opt.showmatch = true -- highlight search instances

-- window
vim.opt.splitbelow = true -- Put new windows below current
vim.opt.splitright = true -- Put new vertical splits to right

-- go to previous/next line with h,l,left arrow and right arrow
-- when cursor reaches end/beginning of line
vim.opt.whichwrap:append("<>[]hl")

-- for obsidian and for hiding content if it possible
vim.opt.conceallevel = 2
