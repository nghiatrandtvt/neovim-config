local map = vim.keymap.set

local function cword_with_dash()
  local isk = vim.bo.iskeyword
  vim.opt_local.iskeyword:append('-')
  local word = vim.fn.expand('<cword>')
  vim.bo.iskeyword = isk
  return word
end

local function get_visual_selection()
  local _, ls, cs = unpack(vim.fn.getpos('v'))
  local _, le, ce = unpack(vim.fn.getpos('.'))
  return table.concat(vim.api.nvim_buf_get_text(0, ls-1, cs-1, le-1, ce, {}), '\n')
end

-- Search in current file or directory: pattern then optional path with tab completion
map('n', 's', function()
  local pattern = vim.fn.input('Search: ', cword_with_dash())
  if pattern == '' then return end
  local dir = vim.fn.input('(Searching "' .. pattern .. '") Enter file or directory (empty = current file): ', '', 'file')
  if dir == '' then
    vim.cmd('vimgrep /' .. pattern .. '/ % | copen')
  else
    vim.cmd('grep! -rE ' .. vim.fn.shellescape(pattern) .. ' ' .. dir)
    vim.cmd('copen')
  end
end, { desc = 'search-file-or-dir' })

-- Search in all open buffers
map('n', 'S', function()
  local pattern = vim.fn.input('Search: ', cword_with_dash())
  if pattern == '' then return end
  local files = table.concat(vim.tbl_map(function(buf)
    return vim.api.nvim_buf_get_name(buf)
  end, vim.tbl_filter(function(buf)
    return vim.api.nvim_buf_is_loaded(buf) and vim.api.nvim_buf_get_name(buf) ~= ''
  end, vim.api.nvim_list_bufs())), ' ')
  vim.cmd('vimgrep /' .. pattern .. '/ ' .. files .. ' | copen')
  vim.cmd('echo \'Searched "' .. pattern .. '" in all open buffers\'')
end, { desc = 'search-open-buffers' })

-- Visual mode: search selected text
map('v', 's', function()
  local pattern = vim.fn.input('Search: ', get_visual_selection())
  if pattern == '' then return end
  local dir = vim.fn.input('(Searching "' .. pattern .. '") Enter file or directory (empty = current file): ', '', 'file')
  vim.fn.setqflist({})
  if dir == '' then
    vim.cmd('vimgrep /' .. pattern .. '/ % | copen')
  else
    vim.cmd('grep! -rE ' .. vim.fn.shellescape(pattern) .. ' ' .. dir)
    vim.cmd('copen')
  end
end, { desc = 'search-selection-file-or-dir' })

map('v', 'S', function()
  local pattern = vim.fn.input('Search: ', get_visual_selection())
  if pattern == '' then return end
  local files = table.concat(vim.tbl_map(function(buf)
    return vim.api.nvim_buf_get_name(buf)
  end, vim.tbl_filter(function(buf)
    return vim.api.nvim_buf_is_loaded(buf) and vim.api.nvim_buf_get_name(buf) ~= ''
  end, vim.api.nvim_list_bufs())), ' ')
  vim.cmd('vimgrep /' .. pattern .. '/ ' .. files .. ' | copen')
  vim.cmd('echo \'Searched "' .. pattern .. '" in all open buffers\'')
end, { desc = 'search-selection-open-buffers' })

-- Jump to quickfix window
map('n', '<leader>q', function()
  for _, win in ipairs(vim.fn.getwininfo()) do
    if win.quickfix == 1 and win.loclist == 0 then
      vim.api.nvim_set_current_win(win.winid)
      return
    end
  end
end, { desc = 'focus-quickfix' })


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
  vim.cmd('tcd /repo/xnghtra/' .. opts.args)
end, { nargs = 1, complete = 'dir' })