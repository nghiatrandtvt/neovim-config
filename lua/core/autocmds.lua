-- Terminal: disable line numbers and set background
vim.api.nvim_create_autocmd({ 'BufEnter', 'TermOpen', 'BufRead' }, {
  pattern = 'term://*',
  callback = function()
    vim.opt_local.number = false
    vim.opt_local.relativenumber = false
    vim.wo.winhighlight = 'Normal:TermNormal'
  end,
})

-- Auto-reload files changed outside Neovim
vim.api.nvim_create_autocmd({ 'FocusGained', 'BufEnter' }, {
  command = 'checktime',
})