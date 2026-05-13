local map = vim.keymap.set

-- Search in current file
map('n', 's', function()
  local pattern = vim.fn.input('Search: ')
  if pattern ~= '' then
    vim.cmd('vimgrep /' .. pattern .. '/ % | copen')
  end
end, { desc = 'search-in-file' })

-- Exit terminal mode
map('t', '<Esc>', '<C-\\><C-n>', { desc = 'exit-terminal-mode' })

-- Reload config
map('n', '<leader>r', ':source $MYVIMRC<CR>', { desc = 'reload-config' })

-- Buffer management
map('n', '<leader>bd', ':ls<CR>:bd!', { desc = 'delete-buffer' })

-- Tab navigation
map({ 'n', 'i' }, '<A-Right>', '<Esc>:tabnext<CR>', { desc = 'next-tab' })
map({ 'n', 'i' }, '<A-Left>', '<Esc>:tabprev<CR>', { desc = 'prev-tab' })

-- Window navigation
for _, mode in ipairs({ 'n', 'i', 't' }) do
  local prefix = ({ n = '', i = '<Esc>', t = '<C-\\><C-n>' })[mode]
  map(mode, '<C-Left>',  prefix .. ':wincmd h<CR>', { desc = 'window-left' })
  map(mode, '<C-Down>',  prefix .. ':wincmd j<CR>', { desc = 'window-down' })
  map(mode, '<C-Up>',    prefix .. ':wincmd k<CR>', { desc = 'window-up' })
  map(mode, '<C-Right>', prefix .. ':wincmd l<CR>', { desc = 'window-right' })
end

-- Insert mode editing
map('i', '<C-d>',   '<Esc>ddi',   { desc = 'delete-line' })
map('i', '<A-d>',   '<Esc>diwi',  { desc = 'delete-word' })
map('i', '<A-S-d>', '<Esc>diWi',  { desc = 'delete-WORD' })
map('i', '<C-l>',   '<Esc>d$i',   { desc = 'delete-to-eol' })
map('i', '<C-a>',   '<Esc>d0i',   { desc = 'delete-to-bol' })

-- Yank line content (without newline)
map('n', '<C-y>', '^y$',       { desc = 'yank-line-content' })
map('i', '<C-y>', '<Esc>^y$i', { desc = 'yank-line-content' })

-- Paste from clipboard
map('n', '<C-k>', '"+p',       { desc = 'paste-clipboard' })
map('i', '<C-k>', '<Esc>"+pi', { desc = 'paste-clipboard' })

-- Wild menu navigation
map('c', '<Up>',   function() return vim.fn.wildmenumode() == 1 and '<C-p>' or '<Up>' end,   { expr = true })
map('c', '<Down>', function() return vim.fn.wildmenumode() == 1 and '<C-n>' or '<Down>' end, { expr = true })

-- Commands
vim.api.nvim_create_user_command('Dirtab', function(opts)
  vim.cmd('tabnew | tcd ' .. opts.args .. ' | NvimTreeOpen ' .. opts.args)
end, { nargs = '*', complete = 'dir' })

vim.api.nvim_create_user_command('Diropen', function(opts)
  vim.cmd('tcd ' .. opts.args .. ' | NvimTreeOpen ' .. opts.args)
end, { nargs = '*', complete = 'dir' })

vim.api.nvim_create_user_command('CopyToClipboard', function(opts)
  vim.fn.setreg('+', opts.args)
  print('Copied to clipboard: ' .. opts.args)
end, { nargs = 1 })

vim.api.nvim_create_user_command('Repo', function(opts)
  vim.cmd('tcd <path>' .. opts.args)
end, { nargs = 1, complete = 'dir' })
