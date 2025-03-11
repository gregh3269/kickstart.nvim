return {
  'mbbill/undotree',
  lazy = false,
  config = function()
    vim.keymap.set('n', '<leader>u', vim.cmd.UndotreeToggle, { desc = 'Undotree' })
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
