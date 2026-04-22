local wk = require('which-key')
local entries = {
  -- Buffers
  { '<leader>b',  group = 'buffers' },
  { '<leader>bs', '<cmd>Telescope buffers<cr>', desc = 'select-buffer' },
  { '<leader>bn', '<cmd>bnext<cr>',             desc = 'next-buffer' },

  -- Tabs & Terminals
  { '<leader>t',  group = 'tab-term-telescope' },
  { '<leader>tn', '<cmd>tabnext<cr>',            desc = 'next-tab' },
  { '<leader>to', '<cmd>tabnew<cr>',             desc = 'new-tab' },
  { '<leader>tt', '<cmd>tabnew | terminal<cr>',  desc = 'new-tab-terminal' },
  { '<leader>tv', '<cmd>vsplit | terminal<cr>',  desc = 'vertical-terminal' },
  { '<leader>th', '<cmd>split | terminal<cr>',   desc = 'horizontal-terminal' },
  { '<leader>tk', '<cmd>Telescope keymaps<cr>',  desc = 'show-keymaps' },
  { '<leader>tc', '<cmd>Telescope commands<cr>', desc = 'show-commands' },

  -- Search
  { '<leader>s',  group = 'search' },
  { '<leader>sf', '<cmd>Telescope find_files<cr>', desc = 'search-file-current-dir' },
  { '<leader>ss', '<cmd>BLines<cr>',               desc = 'grep-string-current-file' },
  { '<leader>sS', '<cmd>Lines<cr>',                desc = 'grep-string-all-buffers' },
  { '<leader>sa', '<cmd>Telescope live_grep<cr>',   desc = 'grep-string-current-dir' },

  -- Directory (NvimTree)
  { '<leader>d',  group = 'directory' },
  { '<leader>dt', '<cmd>NvimTreeToggle<cr>',  desc = 'toggle' },
  { '<leader>df', '<cmd>NvimTreeFindFile<cr>', desc = 'find-file' },
  { '<leader>dj', '<cmd>NvimTreeFocus<cr>',   desc = 'focus' },
  { '<leader>dc', '<cmd>NvimTreeClose<cr>',   desc = 'close' },
  { '<leader>dr', '<cmd>NvimTreeRefresh<cr>', desc = 'refresh' },

  -- File path copy
  { '<leader>f',  group = 'file-copy' },
  { '<leader>fp', "<cmd>let @+=expand('%:p')<cr>",   desc = 'copy-absolute-path' },
  { '<leader>fh', "<cmd>let @+=expand('%:p:h')<cr>", desc = 'copy-dir-path' },
  { '<leader>ft', "<cmd>let @+=expand('%:p:t')<cr>", desc = 'copy-filename' },

  -- Window
  { '<leader>x', '<cmd>WinShift swap<cr>', desc = 'window-swap' },

  -- Code actions (Lspsaga)
  { '<leader>c',  group = 'code-action' },
  { '<leader>cr', '<cmd>Lspsaga rename<CR>',                desc = 'rename' },
  { '<leader>ch', '<cmd>Lspsaga hover_doc<CR>',             desc = 'hover' },
  { '<leader>ca', '<cmd>Lspsaga code_action<CR>',           desc = 'action' },
  { '<leader>cd', '<cmd>Lspsaga show_line_diagnostics<cr>', desc = 'diagnostics' },
  { '<leader>cs', '<cmd>Telescope lsp_document_symbols<cr>', desc = 'symbols' },

  -- Git
  { '<leader>g',  group = 'git' },
  { '<leader>gf', '<cmd>Telescope git_bcommits<CR>', desc = 'file-commits' },
  { '<leader>gl', '<cmd>Telescope git_commits<CR>',  desc = 'repo-commits' },

  -- Lazygit
  { '<leader>gg',  group = 'lazygit' },
  { '<leader>ggo', '<cmd>LazyGit<CR>',                    desc = 'open' },
  { '<leader>ggc', '<cmd>LazyGitConfig<CR>',               desc = 'config' },
  { '<leader>ggf', '<cmd>LazyGitCurrentFile<CR>',          desc = 'current-file' },
  { '<leader>ggl', '<cmd>LazyGitLog<CR>',                  desc = 'log-repo' },
  { '<leader>ggh', '<cmd>LazyGitFilter<CR>',               desc = 'log-filter' },
  { '<leader>ggH', '<cmd>LazyGitFilterCurrentFile<CR>',    desc = 'log-filter-file' },
}

-- Generate tab 1-9 keymaps
for i = 1, 9 do
  table.insert(entries, { '<leader>t' .. i, '<cmd>' .. i .. 'tabnext<cr>', desc = 'tab-' .. i })
end

wk.add(entries)
