local action_state = require('telescope.actions.state')
local actions = require('telescope.actions')
local builtin = require('telescope.builtin')

local scripts_dir = vim.fn.stdpath('config') .. '/scripts'
local function run_script(script, hash)
  return vim.fn.system(scripts_dir .. '/' .. script .. ' ' .. hash)
end

local function get_commit_hash()
  local entry = action_state.get_selected_entry()
  return entry and entry.value:match('^%S+')
end

local function checkout_commit(prompt_bufnr)
  local hash = get_commit_hash()
  if not hash then return end
  print('Checking out commit: ' .. hash .. '? (y/n)')
  if vim.fn.nr2char(vim.fn.getchar()):lower() == 'y' then
    actions.close(prompt_bufnr)
    vim.fn.system('git checkout ' .. hash)
    print('Checked out commit: ' .. hash)
  else
    print('Check out canceled')
  end
end

local function copy_hash_commit(prompt_bufnr)
  local hash = get_commit_hash()
  if not hash then return end
  vim.fn.setreg('+', hash)
  actions.close(prompt_bufnr)
  print('Copied commit hash to clipboard: ' .. hash)
end

local commit_mappings = { ['<CR>'] = checkout_commit, ['<C-y>'] = copy_hash_commit }

local git_mappings = {
  ['<C-g>'] = function(prompt_bufnr)
    local hash = get_commit_hash()
    if not hash then return end
    actions.close(prompt_bufnr)
    vim.notify(run_script('open-commit-lazygit.sh', hash))
  end,
  ['<A-g>'] = function(prompt_bufnr)
    local hash = get_commit_hash()
    if not hash then return end
    actions.close(prompt_bufnr)
    vim.notify(run_script('copy-commit-lazygit.sh', hash))
  end,
}

require('telescope').setup({
  defaults = {
    prompt_prefix = '>>> ',
    selection_caret = '➜ ',
    vimgrep_arguments = { 'ag', '--nocolor', '--noheading', '--numbers', '--column' },
  },
  pickers = {
    git_commits = {
      mappings = {
        i = vim.tbl_extend('force', commit_mappings, git_mappings),
        n = vim.tbl_extend('force', commit_mappings, git_mappings),
      },
      git_command = { 'git', 'log', '--pretty=%h %ci %s', '--' },
    },
    git_bcommits = {
      mappings = { i = git_mappings, n = git_mappings },
    },
  },
})

-- Show line numbers in previewer and results
vim.api.nvim_create_autocmd('User', {
  pattern = 'TeleScopePreviewerLoaded',
  callback = function()
    vim.wo.number = true
    vim.wo.relativenumber = false
    vim.wo.cursorline = true
  end,
})

vim.api.nvim_create_autocmd('FileType', {
  pattern = 'TelescopeResults',
  callback = function() vim.opt_local.number = true end,
})

-- Keymaps
vim.keymap.set('n', '<leader>sF', function()
    local dir = vim.fn.input('Search in: ', vim.fn.getcwd(), 'dir')
    if dir == '' then return end
    builtin.find_files({ cwd = dir })
  end, { desc = 'telescope-find-file-custom-dir' })

vim.keymap.set('n', '<leader>sca', function()
  local word = vim.fn.expand('<cword>'):match('^[^/]+') or vim.fn.expand('<cword>')
  builtin.live_grep({ default_text = word })
end, { desc = 'telescope-search-under-cursor-current-dir' })

vim.keymap.set('v', '<leader>sa', function()
  vim.cmd('normal! "zy')
  builtin.live_grep({ default_text = vim.fn.getreg('z') })
end, { desc = 'telescope-search-selected-text-current-dir' })

vim.keymap.set('n', '<leader>scf', function()
  local filename = vim.fn.expand('<cfile>'):match('[^/]+$')
  if not filename then print('No file path under cursor'); return end
  builtin.find_files({ default_text = filename, prompt_title = 'Search File: ' .. filename })
end, { desc = 'telescope-search-file-under-cursor-current-dir' })

-- Highlights
vim.api.nvim_set_hl(0, 'TelescopeBorder', { fg = '#FED000' })
vim.api.nvim_set_hl(0, 'TelescopeSelection', { bg = '#3f3f4e' })
vim.api.nvim_set_hl(0, 'TelescopeNormal', { fg = '#00BFFF' })
