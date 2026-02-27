-- Highlight LSP background
-- Check with
-- :verbose highlight LspReferenceText
vim.api.nvim_set_hl(0, 'LspReferenceWrite', { bg = '#3383e8' })
vim.api.nvim_set_hl(0, 'LspReferenceRead', { bg = '#3383e8' })
vim.api.nvim_set_hl(0, 'LspReferenceText', { bg = '#3383e8' })

-- Colours eg LSP highlight, load order matters
-- require 'custom.config.visuals'
