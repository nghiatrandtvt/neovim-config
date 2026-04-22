local map = vim.keymap.set
local fn, api = vim.fn, vim.api

local function open_file(filepath)
  if fn.filereadable(filepath) == 1 then
    vim.cmd('tabedit ' .. fn.fnameescape(filepath))
    return true
  end
  print('No such file: ' .. filepath)
  return false
end

local function cfile() return fn.expand('<cfile>') end

local function selection()
  vim.cmd('normal! "zy')
  return fn.getreg('z')
end

local function ask_dir(prompt)
  local dir = fn.input(prompt or 'Enter path: ', fn.getcwd(), 'dir')
  return (dir ~= '' and fn.isdirectory(dir) == 1) and dir or nil
end

local function term_cwd()
  local buf = api.nvim_get_current_buf()
  if vim.bo[buf].buftype ~= 'terminal' then return nil, 'Current buffer is not a terminal.' end
  local ok, pid = pcall(api.nvim_buf_get_var, buf, 'terminal_job_pid')
  if not ok then return nil, 'No terminal pid found.' end
  local cwd = fn.resolve('/proc/' .. pid .. '/cwd')
  return fn.isdirectory(cwd) == 1 and cwd or nil, 'Cannot resolve terminal cwd.'
end

-- mode, lhs, get_name(), get_dir()|nil, desc
local mappings = {
  { 'n', '<leader>jf', cfile,     nil,                                            'open-under-cursor-file' },
  { 'v', '<leader>jf', selection, nil,                                            'open-selected-file' },
  { 'n', '<leader>jp', cfile,     function() return ask_dir('Enter file path: ') end, 'open-file-at-cursor-with-path' },
  { 'v', '<leader>jp', selection, function() return ask_dir() end,                'open-selected-file-with-path' },
  { 'n', '<leader>jF', cfile,     function() local d, e = term_cwd(); if not d then print(e) end; return d end, 'goto-file-at-cursor-pwd-used-for-terminal' },
}

for _, m in ipairs(mappings) do
  local mode, lhs, get_name, get_dir, desc = unpack(m)
  map(mode, lhs, function()
    local name = get_name()
    local dir = get_dir and get_dir() or nil
    if get_dir and not dir then return end
    open_file(dir and (dir .. '/' .. name) or name)
  end, { desc = desc })
end

-- Go to directory at cursor
map('n', '<leader>jd', function()
  local p = cfile()
  local dir = fn.isdirectory(p) == 1 and p
    or fn.filereadable(p) == 1 and fn.fnamemodify(p, ':h')
    or fn.fnamemodify(fn.expand('%:p:h') .. '/' .. p, ':h')
  if fn.isdirectory(dir) ~= 1 then print('No such directory: ' .. dir); return end
  print('Jumping to: ' .. dir)
  vim.cmd('tabnew | terminal ' .. vim.env.SHELL)
  api.nvim_feedkeys('cd ' .. fn.fnameescape(dir) .. '\r', 't', false)
end, { desc = 'goto-dir-at-cursor' })
