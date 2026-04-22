local function open_in_browser(url)
  local cmd = vim.fn.has('linux') == 1 and 'xdg-open'
    or vim.fn.has('mac') == 1 and 'open'
    or vim.fn.has('win32') == 1 and 'start'
  if not cmd then print('Unsupported OS'); return end
  print('Opening: ' .. url)
  vim.fn.jobstart({ cmd, url }, { detach = true })
end

vim.keymap.set('v', '<leader>ju', function()
  vim.cmd('normal! "zy')
  local url = vim.trim(vim.fn.getreg('z'))
  if url ~= '' then open_in_browser(url) else print('No URL selected') end
end, { desc = 'Open-selected-URL-in-browser' })

vim.keymap.set('n', '<leader>gO', function()
  open_in_browser('<gerrit-url>')
end, { desc = 'Open-Gerrit-home-page' })
