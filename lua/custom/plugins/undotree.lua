return {
  'mbbill/undotree',
  lazy = false,
  init = function()
    local wk = require 'which-key'
    -- undotree
    wk.add {
      {
        '<Leader>u',
        '<cmd>UndotreeToggle<CR>',
        desc = 'Undotree',
        icon = { icon = '', color = 'azure' },
      },
    }
  end,
  config = function()
    --vim.keymap.set('n', '<leader>u', vim.cmd.UndotreeToggle, { desc = 'Undotree' })
    vim.g.undotree_SetFocusWhenToggle = 1
  end,

  --  'jiaoshijie/undotree',
  --  dependencies = 'nvim-lua/plenary.nvim',
  --  config = true,
  --  keys = { -- load the plugin only when using it's keybinding:
  --    { '<leader>u', "<cmd>lua require('undotree').toggle()<cr>", desc = 'Undotree' },
  --  },

  --[[ 
  --]]
}
