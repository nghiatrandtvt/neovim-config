local map = vim.keymap.set

local function get_word()
  return (vim.fn.expand('<cword>')):match('^[^/]+') or vim.fn.expand('<cword>')
end

local function get_selection()
  vim.cmd('normal! "zy')
  return vim.fn.getreg('z')
end

local function fzf_opts(query)
  return '--color=hl:yellow,hl+:cyan --query ' .. vim.fn.shellescape(query)
end

local function ask_dir()
  local dir = vim.fn.input('Enter directory: ', vim.fn.getcwd(), 'dir')
  if dir == '' or vim.fn.isdirectory(dir) == 0 then return nil end
  return dir
end

-- Search word under cursor in current/all buffers
map('n', '<leader>scs', function()
  local w = get_word()
  vim.fn['fzf#vim#buffer_lines'](w, { options = fzf_opts(w) })
end, { desc = 'FzF-search-under-cursor-current-buf' })

map('n', '<leader>scS', function()
  local w = get_word()
  vim.fn['fzf#vim#lines'](w, { options = fzf_opts(w) })
end, { desc = 'FzF-search-under-cursor-all-buf' })

-- Search file under cursor with input directory
map('n', '<leader>scF', function()
  local filename = (vim.fn.expand('<cfile>')):match('[^/]+$')
  if not filename then print('No file path under cursor'); return end
  local dir = ask_dir()
  if not dir then return end
  vim.fn['fzf#vim#files'](dir, { options = fzf_opts(filename) }, 0)
end, { desc = 'FZF-search-file-under-cursor-with-input-dir' })

-- Search selected text in current/all buffers
map('v', '<leader>ss', function()
  local t = get_selection()
  vim.fn['fzf#vim#buffer_lines'](t, { options = fzf_opts(t) })
end, { desc = 'FZF-search-selected-text-current-buf' })

map('v', '<leader>sS', function()
  local t = get_selection()
  vim.fn['fzf#vim#lines'](t, { options = fzf_opts(t) })
end, { desc = 'FZF-search-selected-text-all-buf' })

-- Search selected file in current dir / with input directory
map('v', '<leader>sf', function()
  local t = get_selection()
  vim.fn['fzf#vim#lines']('', { options = fzf_opts(t) }, 0)
end, { desc = 'FZF-search-file-current-dir' })

map('v', '<leader>sF', function()
  local t = get_selection()
  local dir = ask_dir()
  if not dir then return end
  vim.fn['fzf#vim#files'](dir, { options = fzf_opts(t) }, 0)
end, { desc = 'FZF-search-selected-file-with-input-dir' })

-- Highlights
vim.api.nvim_set_hl(0, 'FzfBorder', { fg = '#FED000', bg = 'NONE' })
vim.api.nvim_set_hl(0, 'FzfSelectionBg', { bg = '#3f3f4e' })
vim.api.nvim_set_hl(0, 'FzfSelectionFg', { fg = '#00bfff' })
vim.g.fzf_colors = {
  border = { 'fg', 'FzfBorder' },
  ['bg+'] = { 'bg', 'FzfSelectionBg' },
  ['fg+'] = { 'fg', 'FzfSelectionFg' },
}
