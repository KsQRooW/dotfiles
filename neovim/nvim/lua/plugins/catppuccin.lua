return {
  "catppuccin/nvim",
  name = "catppuccin",
  priority = 1000, -- чтобы тема применялась до загрузки других плагинов
  config = function()
    vim.cmd.colorscheme "catppuccin-frappe"
  end
}
