--if true then return {} end

return {
  require('telescope').setup {
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
    },
  },
}
