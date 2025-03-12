return {
  'nvimtools/none-ls.nvim',
  event = { 'BufReadPre', 'BufNewFile' },
  dependencies = {
    'jay-babu/mason-null-ls.nvim',
    'nvimtools/none-ls-extras.nvim',
  },
  -- ft = { 'css', 'html' },
  config = function()
    local null_ls = require 'null-ls'
    local null_ls_utils = require 'null-ls.utils'

    local formatting = null_ls.builtins.formatting
    -- local diagnostics = null_ls.builtins.diagnostics
    -- local hover = null_ls.builtins.hover

    -- vim.keymap.set('n', '<leader>gf', ':lua vim.lsp.buf.format({ async = true })<CR>', { desc = 'Format the open buffer' })
    -- vim.keymap.set('n', '<leader>gf', vim.lsp.buf.format, { desc = 'Format buffer' })
    vim.keymap.set('n', '<leader>wf', ':noautocmd w<CR>', { desc = 'Save Without Formatting' })

    null_ls.setup {
      -- debug = true,
      -- add package.json as additional identifier for root (for typescript monorepos)
      root_dir = null_ls_utils.root_pattern('.null-ls-root', 'Makefile', '.git', 'package.json'),
      timeout = 20000, -- ms
      sources = {
        require 'none-ls.diagnostics.eslint_d',
        -- formatting.stylua, -- lua formatter
        formatting.prettier.with {
          filetypes = { 'css' },
          extra_args = {},
        },
        formatting.prettier.with {
          filetypes = { 'html' },
          extra_args = {
            '--bracket-same-line',
            '--trailing-comma',
            'all',
            '--tab-width',
            '2',
            '--semi',
            '--single-quote',
            '--html-whitespace-sensitivity',
            'ignore',
          },
        },
      },
    }
  end,
}
