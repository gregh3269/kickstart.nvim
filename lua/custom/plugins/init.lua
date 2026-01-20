-- You can add your own plugins here or in other files in this directory!
--  I promise not to create any merge conflicts in this directory :)
--
-- See the kickstart.nvim README for more information

-- Custom setup
-- Save undo history. No undo from previous edit, was true.
vim.o.undofile = false

-- always set autoindenting on
vim.o.autoindent = true
-- use smart indent if there is no indent file
vim.o.smartindent = true
-- <tab> inserts 4 spaces
vim.o.tabstop = 4
-- <BS> over an autoindent deletes 4 spaces.
vim.o.softtabstop = 4
-- Handle tabs more intelligently"
vim.o.smarttab = true
-- Use spaces, not tabs, for autoindent/tab key.
vim.o.expandtab = true
-- an indent level is 4 spaces wide.
vim.o.shiftwidth = 4
--rounds indent to a multiple of shiftwidth
vim.o.shiftround = true

-- Load
require 'custom.config.autocmds'
require 'custom.config.keymaps'

return {}
