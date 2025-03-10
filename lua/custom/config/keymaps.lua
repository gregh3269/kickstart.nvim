local builtin = require 'telescope.builtin'

-- Only files tracked by Git
vim.keymap.set('n', '<leader>pg', builtin.git_files, { desc = 'Search Git Files' })

-- Search files by input
vim.keymap.set('n', '<leader>pi', function()
  builtin.grep_string { search = vim.fn.input 'Grep > ' }
end, { desc = 'Search Input' })

-- Project Word Search > a sequence of letters, digits and underscores, or a
-- sequence of other non-blank characters, separated with white space
vim.keymap.set('n', '<leader>pws', function()
  local word = vim.fn.expand '<cword>'
  builtin.grep_string { search = word }
end, { desc = 'Project Word Search' })

-- Project Word Search > sequence of non-blank characters, separated with white space.
vim.keymap.set('n', '<leader>pWs', function()
  local word = vim.fn.expand '<cWORD>'
  builtin.grep_string { search = word }
end, { desc = 'Project WORD Search' })

-- vim.keymap.set('n', '<leader>pf', builtin.find_files , {  desc = 'find files' })
-- vim.keymap.set('n', '<leader>pf', builtin.find_files , {  desc = 'find files' })
-- vim.keymap.set('n', '<leader>pf', builtin.find_files , {  desc = 'find files' })
-- vim.keymap.set('n', '<leader>pf', builtin.find_files , {  desc = 'find files' })
