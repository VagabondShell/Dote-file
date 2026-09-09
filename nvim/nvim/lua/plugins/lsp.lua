return {
  {
    "neovim/nvim-lspconfig",
    opts = {
      -- Inferred types shown inline, TypeScript-style.
      -- Toggle at runtime with <leader>uh
      inlay_hints = { enabled = true },

      diagnostics = {
        -- virtual_lines wraps long messages onto their own lines below the
        -- code instead of running off the right edge of the screen.
        -- Requires Neovim 0.11+ (check with :version).
        virtual_text = false,
        virtual_lines = { current_line = true },
        underline = true,
        update_in_insert = false,
        severity_sort = true,
      },
      servers = {
        emmet_language_server = {
          filetypes = {
            "html",
            "css",
            "scss",
            "less",
            "javascript",
            "javascriptreact",
            "typescript",
            "typescriptreact",
          },
        },
      },
    },
  },
}
