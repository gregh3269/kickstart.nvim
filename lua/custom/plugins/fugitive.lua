--return {
--  {
--    'tpope/vim-fugitive',
--  },
--}

return {
  'tpope/vim-fugitive',
  config = function()
    vim.keymap.set('n', '<leader>pf', vim.cmd.Git, { desc = 'Fugitive (Git)' })

    local My_Fugitive = vim.api.nvim_create_augroup('My_Fugitive', {})

    local autocmd = vim.api.nvim_create_autocmd
    autocmd('BufWinEnter', {
      group = My_Fugitive,
      pattern = '*',
      callback = function()
        if vim.bo.ft ~= 'fugitive' then
          return
        end

        local bufnr = vim.api.nvim_get_current_buf()
        local opts = { buffer = bufnr, remap = false }

        vim.keymap.set('n', '<leader>Fp', ':Git push<CR>', opts)

        -- pull --rebase = fetch + rebase
        vim.keymap.set('n', '<leader>FP', ':Git pull --rebase<CR>', opts)

        -- NOTE: Sets upstream branch for check >> [-u | --set-upstream]
        vim.keymap.set('n', '<leader>Fo', ':Git push -u origin ', opts)
      end,
    })
  end,
}
