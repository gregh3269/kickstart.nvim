-- You can add your own plugins here or in other files in this directory!
--  I promise not to create any merge conflicts in this directory :)
--
-- See the kickstart.nvim README for more information

-- Custom setup
-- Save undo history. No undo from previous edit, was true.
vim.o.undofile = false

-- Load
require 'custom.config.autocmds'
require 'custom.config.keymaps'

return {}
