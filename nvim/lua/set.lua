vim.opt.guicursor = ""

vim.api.nvim_set_hl(0, "LineNr", { bg = "none" })
vim.api.nvim_set_hl(0, "LineNrAbove", { bg = "none" })
vim.api.nvim_set_hl(0, "LineNrBelow", { bg = "none" })
vim.api.nvim_set_hl(0, "SignColumn", { bg = "none" })
vim.opt.nu = true
vim.opt.relativenumber = true

vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true

vim.opt.smartindent = true

vim.opt.wrap = false

vim.opt.swapfile = false
vim.opt.backup = false
vim.opt.undofile = true

vim.opt.hlsearch = false
vim.opt.incsearch = true

-- vim.opt.termguicolors = true
-- Force the Line Number column to have no background color

vim.opt.scrolloff = 8
--
vim.opt.updatetime = 50
--
-- vim.opt.colorcolumn = "80"

