require('gitsigns').setup({
  signs = {
    add          = { text = '│' },
    change       = { text = '│' },
    delete       = { text = '_' },
    topdelete    = { text = '‾' },
    changedelete = { text = '~' },
  },
  current_line_blame = true,
})

local gs = require('gitsigns')
local map = vim.keymap.set
map('n', ']c', gs.next_hunk, { desc = 'next-hunk' })
map('n', '[c', gs.prev_hunk, { desc = 'previous-hunk' })
map('n', '<leader>hs', gs.stage_hunk, { desc = 'stage-hunk' })
map('n', '<leader>hr', gs.reset_hunk, { desc = 'reset-hunk' })
map('n', '<leader>hp', gs.preview_hunk, { desc = 'preview-hunk' })
map('n', '<leader>gb', function() gs.blame_line({ full = true }) end, { desc = 'git-blame-line' })
map('n', '<leader>gB', function() gs.blame({ full = true }) end, { desc = 'git-blame' })
map('n', '<leader>gd', gs.diffthis, { desc = 'git-diff-current-file' })
