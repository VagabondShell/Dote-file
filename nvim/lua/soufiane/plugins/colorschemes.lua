-- In your plugins file for themes (e.g., lua/soufiane/plugins/theme.lua)

return {
  {
    "rose-pine/neovim",
    name = "rose-pine",
    lazy = false,    -- Make sure it loads on startup
    priority = 1000, -- Make sure it loads first
    opts = {
      -- This is the key setting to fix your problem
      -- It tells the theme to make inactive windows transparent
      inactive_background = "none",

      -- Other useful settings you should have
      styles = {
        bold = true,
        italic = true,
        transparency = true, -- This enables the transparent setting for the active window
      },
    },
    config = function(_, opts)
      -- This loads the theme with your options
      require("rose-pine").setup(opts)
      -- This applies the colorscheme
      vim.cmd("colorscheme rose-pine")
    end,
  },
}
