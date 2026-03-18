--if true then return {} end

return {
  require('telescope').setup {
    -- local ts = require 'telescope'
    --local actions = require('telescope.actions')
    defaults = {
      wrap_results = true,
      layout_strategy = 'horizontal',
      layout_config = {
        -- more space
        horizontal = {
          -- prompt_position = "top",
          width = { padding = 0 },
          height = { padding = 0 },
          preview_width = 0.65,
        },
      },
      mappings = {
        --[[n = { -- normal mode (i for insert mode)
          ['<C-c>'] = function(...) require('telescope.actions').close(...) end,
          ['<Space>c'] = function(...)
            require('telescope.actions').send_selected_to_qflist(...)
            require('telescope.actions').open_qflist(...)
          end,
        },]]
        --
        i = {
          ['<S-Down>'] = function(...) require('telescope.actions').cycle_history_next(...) end,
          ['<S-Up>'] = function(...) require('telescope.actions').cycle_history_prev(...) end,
        },
      },
    },
  },
}
