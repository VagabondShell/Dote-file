
return {
  {
    "nvim-treesitter/nvim-treesitter",
    branch = 'master',      -- Use the recommended branch
    lazy = false,           -- Load immediately on startup
    build = ":TSUpdate",    -- Automatically update parsers when plugin updates

    -- The 'config' function is executed AFTER the plugin is loaded,
    -- ensuring that 'require' works and the setup is applied.
    config = function()
      -- Paste your provided setup block here:
      require'nvim-treesitter.configs'.setup {
        -- A list of parser names, or "all" (the listed parsers MUST always be installed)
        ensure_installed =  {"cpp", "lua", "markdown", "markdown_inline", "vimdoc" },

        -- Install parsers synchronously (only applied to `ensure_installed`)
        sync_install = false,

        -- Automatically install missing parsers when entering buffer
        auto_install = true,

        -- List of parsers to ignore installing (or "all")
        -- Note: If you want 'javascript' later, you must remove it from this list.
        -- ignore_install = { "javascript" },

        highlight = {
          enable = true,

          -- NOTE: You have two 'disable' settings here. The function will override the list.
          -- For clarity, you should typically use only one method.
          -- Since you are disabling two different ways, I recommend choosing one.
          
          -- Using the function method to disable for large files:
          -- disable = function(lang, buf)
          --   local max_filesize = 100 * 1024 -- 100 KB
          --   local ok, stats = pcall(vim.loop.fs_stat, vim.api.nvim_buf_get_name(buf))
          --   if ok and stats and stats.size > max_filesize then
          --       return true
          --   end
          -- end, 
          
          -- If you prefer the list for 'c' and 'rust', remove the function above and use this:
          -- disable = { "c", "rust" },

          additional_vim_regex_highlighting = false,
        },
        
        -- You may also want to explicitly enable indentation here:
        -- indent = { enable = true },
      }
    end,
  }
}
