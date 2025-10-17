return {
  "neovim/nvim-lspconfig",
  dependencies = {
    -- UI and Utilities
    "j-hui/fidget.nvim",
    "stevearc/conform.nvim",

    -- LSP and Tooling Management
    "williamboman/mason.nvim",
    "williamboman/mason-lspconfig.nvim",

    -- Autocompletion Engine
    "hrsh7th/nvim-cmp",
    "hrsh7th/cmp-nvim-lsp",
    "hrsh7th/cmp-buffer",
    "hrsh7th/cmp-path",

    -- Snippet Engine and Snippets
    {
      "L3MON4D3/LuaSnip",
      dependencies = { "rafamadriz/friendly-snippets" },
    },
    "saadparwaiz1/cmp_luasnip",
  },

  config = function()
    -- ## 1. Define the on_attach function with keymaps ##
    local on_attach = function(client, bufnr)
      local keymap = vim.keymap.set
      local opts = { buffer = bufnr, remap = false }

      -- Keymaps for LSP actions
      keymap("n", "K", vim.lsp.buf.hover, opts)
      keymap("n", "gd", vim.lsp.buf.definition, opts)
      keymap("n", "gi", vim.lsp.buf.implementation, opts)
      keymap("n", "<leader>rn", vim.lsp.buf.rename, opts)
      keymap("n", "<leader>ca", vim.lsp.buf.code_action, opts)
      keymap("n", "gr", "<cmd>Telescope lsp_references<CR>", opts)

      -- Keymaps for diagnostics (errors/warnings)
      keymap("n", "]d", vim.diagnostic.goto_next, opts)
      keymap("n", "[d", vim.diagnostic.goto_prev, opts)
      keymap("n", "<leader>e", vim.diagnostic.open_float, opts)
    end

    -- ## 2. Configure Mason and Mason-LSPConfig ##
    local cmp_lsp = require("cmp_nvim_lsp")
    local capabilities = cmp_lsp.default_capabilities()

    require("mason").setup()
    require("mason-lspconfig").setup({
      ensure_installed = { "lua_ls", "clangd" },
      handlers = {
        function(server_name) -- Default handler
          require("lspconfig")[server_name].setup {
            capabilities = capabilities,
            on_attach = on_attach,
          }
        end,
        ["lua_ls"] = function() -- Custom handler for lua_ls
          require("lspconfig").lua_ls.setup {
            capabilities = capabilities,
            on_attach = on_attach,
            settings = { Lua = { diagnostics = { globals = { "vim" } } } }
          }
        end,
      }
    })

    -- ## 3. Configure nvim-cmp (Autocompletion) ##
    local cmp = require('cmp')
    cmp.setup({
      snippet = { expand = function(args) require('luasnip').lsp_expand(args.body) end },
      mapping = cmp.mapping.preset.insert({
        ['<C-p>'] = cmp.mapping.select_prev_item(),
        ['<C-n>'] = cmp.mapping.select_next_item(),
        ['<C-y>'] = cmp.mapping.confirm({ select = true }),
        ["<C-Space>"] = cmp.mapping.complete(),
      }),
      sources = cmp.config.sources({
        { name = 'nvim_lsp' },
        { name = 'luasnip' },
      }, {
        { name = 'buffer' },
        { name = 'path' },
      })
    })

    -- ✨ THE FIX: TELL LUASNIP TO LOAD THE SNIPPETS ✨
    require("luasnip.loaders.from_vscode").lazy_load()

    -- ## 4. Configure other plugins ##
    require("fidget").setup({})
    require("conform").setup({
      formatters_by_ft = { lua = { "stylua" } },
    })
  end
}
