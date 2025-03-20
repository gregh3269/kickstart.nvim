-- Additional group headings
local wk = require 'which-key'
wk.add {
  { '<leader>p', group = '[P]roject' },
  --  { '<leader>pw', group = 'Search Cursor <cword>' },
  --  { '<leader>pW', group = 'Search Cursor <cWORD>' },
  { '<leader>pF', group = 'Fugitive' },
  { '<leader>F', group = ':Git Commands' },
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
vim.keymap.set('n', '<leader>pw', function()
  local word = vim.fn.expand '<cword>'
  builtin.grep_string { search = word }
end, { desc = 'Search Cursor <cword>' })

-- Project Word Search from cursor > sequence of non-blank characters, separated with white space.
vim.keymap.set('n', '<leader>pW', function()
  local word = vim.fn.expand '<cWORD>'
  builtin.grep_string { search = word }
end, { desc = 'Search Cursor <cWORD>' })

-- Scroll through quick list 'zz' to move the current line to the center of the screen
-- :copen to open the qlist
vim.keymap.set('n', '<C-k>', '<cmd>cnext<CR>zz', { desc = 'Next in qfix list' })
vim.keymap.set('n', '<C-j>', '<cmd>cprev<CR>zz', { desc = 'Previous in qfix list' })

-- vim.keymap.set('n', '<C-h>', '<cmd>lnext<CR>zz', { desc = 'Next in location list' })
-- vim.keymap.set('n', '<C-l>', '<cmd>lprev<CR>zz', { desc = 'Previous in location list' })

-- Resize with arrows
-- vim.keymap.set('n', '<C-S-Down>', ':resize +2<CR>', { desc = 'Resize Horizontal Split Down' })
-- vim.keymap.set('n', '<C-S-Up>', ':resize -2<CR>', { desc = 'Resize Horizontal Split Up' })
vim.keymap.set('n', '<C-Left>', ':vertical resize -2<CR>', { desc = 'Resize Vertical Split Down' })
vim.keymap.set('n', '<C-Right>', ':vertical resize +2<CR>', { desc = 'Resize Vertical Split Up' })

-- vim.keymap.set('n', '<leader>pf', builtin.find_files , {  desc = 'find files' })
