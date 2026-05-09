return {
    'nvim-treesitter/nvim-treesitter',
    build = ':TSUpdate',
    config = function()
        -- Use the main module directly instead of .configs
        local configs = require("nvim-treesitter")

        configs.setup({
            ensure_installed = { "lua", "javascript", "typescript", "html" },
            auto_install = true,
            highlight = { enable = true },
            indent = { enable = true },
        })
    end
}
