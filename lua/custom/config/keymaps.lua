-- Additional group headings
local wk = require 'which-key'
wk.add {
  { '<leader>p', group = '[P]roject' },
  { '<leader>pw', group = 'Search Cursor <cword>' },
  { '<leader>pW', group = 'Search Cursor <cWORD>' },
  { '<leader>pF', group = 'Fugitive' },
  { '<leader>pFp', group = 'Git push' },
  { '<leader>pFP', group = 'Git Pull' },
}

local builtin = require 'telescope.builtin'

-- Only files tracked by Git
vim.keymap.set('n', '<leader>pg', builtin.git_files, { desc = 'Search Git Files' })

-- Search files by input
vim.keymap.set('n', '<leader>pi', function()
  builtin.grep_string { search = vim.fn.input 'Grep > ' }
end, { desc = 'Search Input' })

-- Project Word Search from cursor > a sequence of letters, digits and underscores, or a
-- sequence of other non-blank characters, separated with white space
vim.keymap.set('n', '<leader>pws', function()
  local word = vim.fn.expand '<cword>'
  builtin.grep_string { search = word }
end, { desc = 'Project Word Search' })

-- Project Word Search from cursor > sequence of non-blank characters, separated with white space.
vim.keymap.set('n', '<leader>pWs', function()
  local word = vim.fn.expand '<cWORD>'
  builtin.grep_string { search = word }
end, { desc = 'Project WORD Search' })

-- Scroll through quick list 'zz' to move the current line to the center of the screen
vim.keymap.set('n', '<C-k>', '<cmd>cnext<CR>zz', { desc = 'Next in List' })
vim.keymap.set('n', '<C-j>', '<cmd>cprev<CR>zz', { desc = 'Previous in List' })

-- vim.keymap.set('n', '<leader>pf', builtin.find_files , {  desc = 'find files' })
