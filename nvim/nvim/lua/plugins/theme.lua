return {
  -- 1. Install the Catppuccin plugin
  {
    "catppuccin/nvim",
    name = "catppuccin",
    priority = 1000, -- Load this first!
    opts = {
      flavour = "mocha", -- mocha, macchiato, frappe, latte
      transparent_background = true, -- Since you're using Ghostty transparency
      term_colors = true,
      integrations = {
        telescope = true,
        mason = true,
        neotree = true,
      },
    },
  },

  -- 2. Force LazyVim to use it on startup
  {
    "LazyVim/LazyVim",
    opts = {
      colorscheme = "catppuccin-mocha",
    },
  },
}
