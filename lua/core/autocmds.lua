-- Quickfix: open entries in tab/split instead of current buffer
vim.api.nvim_create_autocmd('FileType', {
  pattern = 'qf',
  callback = function()
    local map = vim.keymap.set
    local opts = { buffer = true, noremap = true }
    map('n', '<CR>',  '<CR>',              opts)  -- default: open in current window
    map('n', 't',     '<C-W><CR><C-W>T',   opts)  -- open in new tab
    map('n', 'x',     '<C-W><CR><C-W>K',   opts)  -- open in horizontal split
    map('n', 'v',     '<C-W><CR><C-W>H',   opts)  -- open in vertical split
  end,
})

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