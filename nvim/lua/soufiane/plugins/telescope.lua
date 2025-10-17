return {
    'nvim-telescope/telescope.nvim',
    tag = '0.1.8',
    dependencies = { 'nvim-lua/plenary.nvim' },
    keys = {
        -- Map <leader>ff to find files
	{"<leader>gf", "<cmd>Telescope git_files<cr>", desc = "Git Files"},

        {"<leader>ff", "<cmd>Telescope find_files<cr>", desc = "Find Files"},

        -- Map <leader>fg to grep (search content in files)
        {"<leader>fg", "<cmd>Telescope live_grep<cr>", desc = "Live Grep"},

        -- Map <leader>fb to list all buffers
        {"<leader>fb", "<cmd>Telescope buffers<cr>", desc = "List Buffers"},

        -- Map <leader>fh to search help tags
        {"<leader>fh", "<cmd>Telescope help_tags<cr>", desc = "Help Tags"},
	-- vim.keymap.set('n', "<leader>ps", function()
	-- builtin.grep_string({ search = vim.fn.input("Grep > ")});
    },
    
    config = function()
        require("telescope").setup({
        })
    end
}
