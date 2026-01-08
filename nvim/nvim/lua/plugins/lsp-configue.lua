return{
  {
    "williamboman/mason.nvim",
    config = function()
      require("mason").setup()
    end
  },
  {
    "williamboman/mason-lspconfig.nvim",
    config = function()
      require("mason-lspconfig").setup({
        ensure_installed = { "lua_ls", "ts_ls", "html", "pyright" }
      })
    end
  },
  {
    "neovim/nvim-lspconfig",
    lazy = false,
    config = function()
    local capabilities = require('cmp_nvim_lsp').default_capabilities()
    local lspconfig = require("lspconfig")
      local signs = { Error = " ", Warn = " ", Hint = "󰠠 ", Info = " " }
      for type, icon in pairs(signs) do
        local hl = "DiagnosticSign" .. type
        vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = "" })
      end
      vim.diagnostic.config({
        virtual_text = true,     -- Show text at end of line
        underline = true,        -- Underline the error in code
        update_in_insert = false, -- Don't show errors while I'm typing (wait until I stop)
        severity_sort = true,    -- Show severe errors first
      })

      -- Optional: Add rounded borders to the hover window (Shift+K)
      vim.lsp.handlers["textDocument/hover"] = vim.lsp.with(
        vim.lsp.handlers.hover, { border = "rounded" }
      )
      vim.lsp.handlers["textDocument/signatureHelp"] = vim.lsp.with(
        vim.lsp.handlers.signatureHelp, { border = "rounded" }
      )
      lspconfig.html.setup({capabilities = capabilities})
      lspconfig.lua_ls.setup({capabilities = capabilities})
      lspconfig.ts_ls.setup({capabilities = capabilities})
        lspconfig.pyright.setup({capabilities = capabilities})
      vim.keymap.set('n', 'K', vim.lsp.buf.hover, {})
      vim.keymap.set('n', 'gd', vim.lsp.buf.definition, {})
      vim.keymap.set({'n', 'v'},'<leader>ca', vim.lsp.buf.code_action, {})
    end
  }
}
