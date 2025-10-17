-- File: lua/soufiane/plugins/terminal.lua

return {
  "akinsho/toggleterm.nvim",
  version = "*",
  opts = {
    shell = vim.o.shell,

    -- This function now only disables Neovim's UI, not your shell's prompt
    on_open = function(term)
      -- Disable Neovim features that aren't useful in a terminal
      vim.cmd("setlocal nospell nonumber norelativenumber")
    end,

    -- Customize the floating window's border
    float_opts = {
      border = "single",
    },
  },
}
