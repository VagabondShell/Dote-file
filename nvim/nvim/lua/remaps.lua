-- Set Leader Key to Space
vim.g.mapleader = " "

-- Move highlighted text down/up and auto-indent
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")

-- Keep cursor in middle when scrolling (Ctrl+d / Ctrl+u)
vim.keymap.set("n", "<C-d>", "<C-d>zz")
vim.keymap.set("n", "<C-u>", "<C-u>zz")

-- Keep cursor in middle when searching (n / N)
vim.keymap.set("n", "n", "nzzzv")
vim.keymap.set("n", "N", "Nzzzv")

-- ================= CLIPBOARD =================
-- "The Greatest Remap": Paste over selected text without overwriting your clipboard
vim.keymap.set("x", "<leader>p", [["_dP]])

-- Copy to System Clipboard (so you can paste in browser)
vim.keymap.set({ "n", "v" }, "<leader>y", [["+y]])
vim.keymap.set("n", "<leader>Y", [["+Y]])

-- Delete to void (delete without copying)
vim.keymap.set({ "n", "v" }, "<leader>d", [["_d]])

-- ================= EDITING =================
-- Join lines but keep cursor in place
vim.keymap.set("n", "J", "mzJ`z")

vim.keymap.set("n", "<leader>s", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]])

vim.keymap.set("n", "<leader>x", "<cmd>!chmod +x %<CR>", { silent = true })

vim.opt.splitright = true
vim.opt.splitbelow = true
-- 1. Create Splits
-- Shift + | (Pipe) -> Vertical Split (Left/Right)
vim.keymap.set("n", "|", "<cmd>vsplit<CR>")

-- Shift + _ (Underscore) -> Horizontal Split (Up/Down) - Optional but useful
vim.keymap.set("n", "_", "<cmd>split<CR>")

local function smart_nav(dir)
    local current_win = vim.api.nvim_get_current_win()
    -- Try to move in the direction
    vim.cmd("wincmd " .. dir)
    
    -- If the window ID didn't change, we hit a wall!
    if vim.api.nvim_get_current_win() == current_win then
        -- Wrap to the opposite side
        if dir == 'h' then vim.cmd("wincmd 999l") -- Hit Left wall -> Go Far Right
        elseif dir == 'l' then vim.cmd("wincmd 999h") -- Hit Right wall -> Go Far Left
        elseif dir == 'j' then vim.cmd("wincmd 999k") -- Hit Bottom wall -> Go Top
        elseif dir == 'k' then vim.cmd("wincmd 999j") -- Hit Top wall -> Go Bottom
        end
    end
end

-- Map the keys to the smart function
vim.keymap.set("n", "<C-h>", function() smart_nav('h') end)
vim.keymap.set("n", "<C-j>", function() smart_nav('j') end)
vim.keymap.set("n", "<C-k>", function() smart_nav('k') end)
vim.keymap.set("n", "<C-l>", function() smart_nav('l') end)
-- =====================================================
-- Save file with Leader + w
vim.keymap.set("n", "<leader>w", "<cmd>w<CR>")

-- Quit file with Leader + q
vim.keymap.set("n", "<leader>q", "<cmd>q<CR>")

-- Exit Insert Mode by typing "jj" quickly
vim.keymap.set("i", "jk", "<Esc>")

-- Reload configuration without closing nvim
vim.keymap.set("n", "<leader><leader>", function()
	vim.cmd("so")
end)
