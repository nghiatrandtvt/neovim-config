local scripts_dir = vim.fn.stdpath('config') .. '/scripts'
local map = vim.keymap.set

local function run_script(script, hash)
  return vim.fn.system(scripts_dir .. '/' .. script .. ' ' .. hash)
end

-- From clipboard hash
map('n', '<leader>gc', function()
  run_script('copy-commit-lazygit.sh', vim.fn.getreg('+'))
end, { desc = 'Copy commit URL to clipboard' })

map('n', '<leader>go', function()
  run_script('open-commit-lazygit.sh', vim.fn.getreg('+'))
end, { desc = 'Open commit on browser' })

-- From git blame on current line
map('n', '<c-g>', function()
  local blame = vim.b.gitsigns_blame_line_dict
  if not blame then return end
  vim.notify(run_script('open-commit-lazygit.sh', blame.sha))
end, { desc = 'browse commit url from git blame' })

map('n', '<a-g>', function()
  local blame = vim.b.gitsigns_blame_line_dict
  if not blame then return end
  vim.notify(run_script('copy-commit-lazygit.sh', blame.sha))
end, { desc = 'copy commit url from git blame' })
