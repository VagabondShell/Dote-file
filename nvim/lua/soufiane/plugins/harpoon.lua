return 
{
  'theprimeagen/harpoon',
  dependencies = {
    'nvim-lua/plenary.nvim',
  },
  config = function()
    local mark = require('harpoon.mark')
    local ui = require('harpoon.ui')
    local harpoon = require('harpoon')

    -- Basic Harpoon bindings
    vim.keymap.set('n', '<leader>a', mark.add_file, { desc = '[A]dd file to Harpoon' })
    vim.keymap.set('n', '<C-e>', ui.toggle_quick_menu, { desc = 'Toggle Harpoon menu' })

    vim.keymap.set('n', '<leader>1', function() ui.nav_file(1) end)
    vim.keymap.set('n', '<leader>2', function() ui.nav_file(2) end)
    vim.keymap.set('n', '<leader>3', function() ui.nav_file(3) end)
    vim.keymap.set('n', '<leader>4', function() ui.nav_file(4) end)

    -- ✨ Reordering bindings - These will work when the menu is open ✨
    vim.keymap.set('n', '<C-S-k>', function() -- Ctrl+Shift+K
        ui.move_item_up()
    end, { desc = "Harpoon move item up" })
    
    vim.keymap.set('n', '<C-S-j>', function() -- Ctrl+Shift+J
        ui.move_item_down()
    end, { desc = "Harpoon move item down" })
  end,
}
