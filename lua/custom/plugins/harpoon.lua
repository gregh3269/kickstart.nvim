return {
  -- https://github.com/Traap/nvim/blob/master/lua/traap/plugins/harpoon.lua
  -- Define the Harpoon lazy.vim specificaiton.

  'ThePrimeagen/harpoon',
  enabled = true,
  event = { 'BufReadPost', 'BufNewFile', 'BufWritePre' },
  branch = 'harpoon2',
  dependencies = {
    'nvim-lua/plenary.nvim',
    'nvim-telescope/telescope.nvim',
  },

  -- ----------------------------------------------------------------------- }}}
  -- Define events to load Harpoon.

  config = function()
    local harpoon = require 'harpoon'
    local extensions = require 'harpoon.extensions'

    harpoon:setup()
    -- Navigate with numbers in the harpoon buffer list
    harpoon:extend(extensions.builtins.navigate_with_number())

    -- Highlight current file in the harpoon buffer list
    harpoon:extend(extensions.builtins.highlight_current_file())

    -- Add keymaps for harpoon window
    harpoon:extend {
      UI_CREATE = function(cx)
        vim.keymap.set('n', '<C-v>', function()
          harpoon.ui:select_menu_item { vsplit = true }
        end, { buffer = cx.bufnr })

        vim.keymap.set('n', '<C-x>', function()
          harpoon.ui:select_menu_item { split = true }
        end, { buffer = cx.bufnr })

        vim.keymap.set('n', '<C-t>', function()
          harpoon.ui:select_menu_item { tabedit = true }
        end, { buffer = cx.bufnr })
      end,
    }
  end,

  keys = function()
    -- basic telescope configuration
    local conf = require('telescope.config').values
    local function toggle_telescope(harpoon_files)
      local file_paths = {}
      for _, item in ipairs(harpoon_files.items) do
        table.insert(file_paths, item.value)
      end

      require('telescope.pickers')
        .new({}, {
          prompt_title = 'Harpoon',
          finder = require('telescope.finders').new_table {
            results = file_paths,
          },
          previewer = conf.file_previewer {},
          sorter = conf.generic_sorter {},
        })
        :find()
    end

    local keys = {

      -- Harpoon marked files 1 through 4
      {
        '<a-1>',
        function()
          require('harpoon'):list():select(1)
        end,
        desc = 'Harpoon buffer 1',
      },

      {
        '<a-2>',
        function()
          require('harpoon'):list():select(2)
        end,
        desc = 'Harpoon buffer 2',
      },

      {
        '<a-3>',
        function()
          require('harpoon'):list():select(3)
        end,
        desc = 'Harpoon buffer 3',
      },

      {
        '<a-4>',
        function()
          require('harpoon'):list():select(4)
        end,
        desc = 'Harpoon buffer 4',
      },

      -- Harpoon next and previous.
      {
        '<a-5>',
        function()
          require('harpoon'):list():next()
        end,
        desc = 'Harpoon next buffer',
      },

      {
        '<a-6>',
        function()
          require('harpoon'):list():prev()
        end,
        desc = 'Harpoon prev buffer',
      },

      -- Harpoon user interface.
      {
        '<a-7>',
        function()
          local harpoon = require 'harpoon'
          harpoon.ui:toggle_quick_menu(harpoon:list())
        end,
        desc = 'Harpoon Toggle Menu',
      },

      {
        '<a-8>',
        function()
          require('harpoon'):list():add()
        end,
        desc = 'Harpoon add file',
      },

      {
        '<a-9>',
        function()
          toggle_telescope(require('harpoon'):list())
        end,
        desc = 'Harpoon Telescope Menu',
      },

      -- Harpoon by mark index.
      {
        '<C-x>',
        function()
          vim.ui.input({ prompt = 'Harpoon mark index: ' }, function(input)
            local num = tonumber(input)
            if num then
              require('harpoon'):list():select(num)
            end
          end)
        end,
        desc = 'Harpoon goto index of mark',
      },
    }
    return keys
  end,

  -- ----------------------------------------------------------------------- }}}
}
