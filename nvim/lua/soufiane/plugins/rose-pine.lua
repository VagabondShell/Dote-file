return {
    {
        "rose-pine/neovim",
        name = "rose-pine",
        priority = 1000, -- Ensures it loads early
        lazy = false,     -- Must load on startup, but the config runs last

        config = function()
            -- Define the function inside the config block (or right above it)
            local function ColorMyPencils(color)
                color = color or "rose-pine"
                
                -- Apply the colorscheme
                vim.cmd.colorscheme(color)
                
                -- Set global highlight groups for transparency (using 0 namespace)
                vim.api.nvim_set_hl(0, "Normal", {bg = "none"})
                vim.api.nvim_set_hl(0, "LineNr", {bg = "none"})
                vim.api.nvim_set_hl(0, "SignColumn", {bg = "none"})
                vim.api.nvim_set_hl(0, "NormalFloat", {bg = "none"})
            end

            -- CALL THE FUNCTION HERE, AFTER THE PLUGIN IS AVAILABLE
            ColorMyPencils()
        end,
    },
}
