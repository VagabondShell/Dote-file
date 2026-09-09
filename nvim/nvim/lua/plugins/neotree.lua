return {
  "nvim-neo-tree/neo-tree.nvim",
  -- No config function here on purpose: LazyVim already sets neo-tree up.
  -- Overriding `config` would throw away git status, follow-current-file, etc.
  keys = {
    { "<C-n>", "<cmd>Neotree filesystem toggle<cr>", desc = "Toggle Neo-tree" },
  },
}
