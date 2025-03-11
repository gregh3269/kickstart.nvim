--return {
--  {
--    'tpope/vim-fugitive',
--  },
--}

return {
  'tpope/vim-fugitive',
  config = function()
    vim.keymap.set('n', '<leader>pf', vim.cmd.Git, { desc = 'Fugitive' })

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
        vim.keymap.set('n', '<leader>pFp', function()
          vim.cmd.Git 'push'
        end, opts)

        -- rebase always
        vim.keymap.set('n', '<leader>pFP', function()
          vim.cmd.Git { 'pull', '--rebase' }
        end, opts)

        -- NOTE: It allows me to easily set the branch i am pushing and any tracking
        -- needed if i did not set the branch up correctly
        vim.keymap.set('n', '<leader>pFpo', ':Git push -u origin ', opts)
      end,
    })

    vim.keymap.set('n', 'pFu', '<cmd>diffget //2<CR>')
    vim.keymap.set('n', 'pFh', '<cmd>diffget //3<CR>')
  end,
}
