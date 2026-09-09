local function float_win()
  return {
    position = "float",
    border = "rounded",
    width = 0.8,
    height = 0.8,
    backdrop = 60,
    title = "  terminal ",
    title_pos = "center",
    wo = {
      winhighlight = "NormalFloat:TermFloat,FloatBorder:TermFloatBorder,FloatTitle:TermFloatTitle",
    },
  }
end

local function set_hl()
  local ok, palette = pcall(require, "catppuccin.palettes")
  if not ok then
    return
  end
  local c = palette.get_palette("mocha")
  vim.api.nvim_set_hl(0, "TermFloat", { bg = c.mantle })
  vim.api.nvim_set_hl(0, "TermFloatBorder", { fg = c.blue, bg = c.mantle })
  vim.api.nvim_set_hl(0, "TermFloatTitle", { fg = c.mauve, bg = c.mantle, bold = true })
end

return {
  "folke/snacks.nvim",
  keys = {
    {
      "<leader>tf",
      function()
        set_hl()
        Snacks.terminal(nil, { cwd = LazyVim.root(), win = float_win() })
      end,
      desc = "Terminal (float)",
    },
  },
}
