-- Keymaps are automatically loaded on the VeryLazy event
-- LazyVim defaults: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua

local map = vim.keymap.set

-- Exit insert mode
map("i", "jj", "<Esc>")
map("i", "jk", "<Esc>")

-- ===== moved here from the old lua/remaps.lua (which was never loaded) =====

-- Move highlighted text down/up and auto-indent
map("v", "J", ":m '>+1<CR>gv=gv")
map("v", "K", ":m '<-2<CR>gv=gv")

-- Keep the cursor centred when scrolling and searching
map("n", "<C-d>", "<C-d>zz")
map("n", "<C-u>", "<C-u>zz")
map("n", "n", "nzzzv")
map("n", "N", "Nzzzv")

-- Join lines without moving the cursor
map("n", "J", "mzJ`z")

-- Clipboard
map("x", "<leader>p", [["_dP]], { desc = "Paste without yanking" })
map({ "n", "v" }, "<leader>y", [["+y]], { desc = "Yank to system clipboard" })
map("n", "<leader>Y", [["+Y]], { desc = "Yank line to system clipboard" })

-- Splits
map("n", "|", "<cmd>vsplit<CR>", { desc = "Split vertically" })
map("n", "_", "<cmd>split<CR>", { desc = "Split horizontally" })

-- These three used lowercase leader keys that LazyVim already owns as menus
-- (<leader>d = debug, <leader>s = search, <leader>x = diagnostics), so they'd
-- have broken those menus. Moved to the uppercase equivalents.
map({ "n", "v" }, "<leader>D", [["_d]], { desc = "Delete without yanking" })
map("n", "<leader>S", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]], { desc = "Replace word under cursor" })
map("n", "<leader>X", "<cmd>!chmod +x %<CR>", { silent = true, desc = "Make file executable" })

-- Picker keymaps, using whichever picker LazyVim is configured with
map("n", "<C-p>", LazyVim.pick("files"), { desc = "Find files" })
map("n", "<leader>fw", LazyVim.pick("live_grep"), { desc = "Grep" })

-- Dropped from remaps.lua, with LazyVim equivalents:
--   <C-h/j/k/l> smart_nav  -> vim-tmux-navigator owns these now (motions.lua)
--   <leader>w save         -> use <C-s>
--   <leader>q quit         -> use <leader>qq
--   <leader><leader> :so   -> LazyVim maps this to Find Files
--   vim.g.mapleader        -> LazyVim already sets it to <Space>
