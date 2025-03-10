return {
  'mbbill/undotree',
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
  config = function()

    local undotree = require 'undotree'

    undotree.setup {
      float_diff = true, -- using float window previews diff, set this `true` will disable layout option
      layout = 'left_bottom', -- "left_bottom", "left_left_bottom"
      position = 'left', -- "right", "bottom"
      ignore_filetype = { 'undotree', 'undotreeDiff', 'qf', 'TelescopePrompt', 'spectre_panel', 'tsplayground' },
      window = {
        winblend = 30,
      },
      keymaps = {
        ['j'] = 'move_next',
        ['k'] = 'move_prev',
        ['gj'] = 'move2parent',
        ['J'] = 'move_change_next',
        ['K'] = 'move_change_prev',
        ['<cr>'] = 'action_enter',
        ['p'] = 'enter_diffbuf',
        ['q'] = 'quit',
      },
    }

    vim.keymap.set('n', '<leader>u', require('undotree').toggle, { noremap = true, silent = true,  desc = 'gggg' })

    -- or
    vim.keymap.set('n', '<leader>uo', require('undotree').open, { noremap = true, silent = true, desc = '1' })
    vim.keymap.set('n', '<leader>uc', require('undotree').close, { noremap = true, silent = true, desc = '2' })
  end,i
  ,--]]
}
