return{
  "rebelot/kanagawa.nvim",  
  name = "kanagawa",
  priority = 1000,
  config = function()
require('kanagawa').setup({
      background = {
        dark = "dragon",
        light = "default"
      },
      dimInactive = true,
    })
    vim.cmd.colorscheme "kanagawa"
  end
}

