--if true then return {} end

return {
  require('telescope').setup {
    defaults = {
      wrap_results = true,
      layout_strategy = 'horizontal',
      -- more space
      layout_config = {
        width = { padding = 0 },
        preview_width = 0.65,
      },
    },
  },
}
