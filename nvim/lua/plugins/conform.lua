return {
  "stevearc/conform.nvim",
  opts = {
    formatters_by_ft = {
      -- Add Prettier for your Node.js/Express stack
      javascript = { "prettier" },
      typescript = { "prettier" },
      json = { "prettier" },
      html = { "prettier" },
      css = { "prettier" },
      markdown = { "prettier" },
      -- Keep your existing YAML setup
      yaml = { "yamlfmt" },
    },
    
    -- This is the missing piece for "Auto on Save"
    format_on_save = {
      timeout_ms = 500,
      lsp_fallback = true,
    },

    formatters = {
      yamlfmt = {
        command = "yamlfmt",
        args = { "-formatter", "basic", "-indentless_arrays=true" },
      },
      -- Note: Prettier usually doesn't need a custom command block 
      -- if it's installed via Mason or npm.
    },
  },
}
