-- Options are automatically loaded before lazy.nvim startup
-- LazyVim defaults: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua

vim.opt.wrap = true
vim.opt.foldmethod = "manual"

-- Splits open to the right / below
vim.opt.splitright = true
vim.opt.splitbelow = true

-- ===== moved here from the old lua/set.lua (which was never loaded) =====

vim.opt.guicursor = "" -- always a block cursor

vim.opt.scrolloff = 8
vim.opt.updatetime = 50

vim.opt.smartindent = true
vim.opt.swapfile = false
vim.opt.backup = false
vim.opt.undofile = true

vim.opt.incsearch = true

-- The two blocks below were in set.lua but never actually ran, so turning
-- them on now would change behaviour you're used to. Uncomment if you want them.

-- 4-space indentation (LazyVim's default is 2):
-- vim.opt.tabstop = 4
-- vim.opt.softtabstop = 4
-- vim.opt.shiftwidth = 4
-- vim.opt.expandtab = true

-- No highlight on search matches (LazyVim leaves this on):
-- vim.opt.hlsearch = false

-- Dropped from set.lua:
--   vim.opt.wrap = false          -> contradicted wrap = true above
--   vim.opt.nu / relativenumber   -> already LazyVim defaults
--   LineNr/SignColumn bg = "none" -> runs before the colorscheme loads, so it
--                                    was overwritten anyway; catppuccin's
--                                    transparent_background = true handles it
--   vim.g.codeium_os / _arch      -> no codeium plugin installed
