vim.g.mapleader = ' '

-- Theme
vim.cmd('colorscheme dracula')
vim.opt.termguicolors = true

-- General
vim.opt.number = true
vim.opt.wildmode = 'longest:full,full'
vim.opt.list = true
vim.opt.listchars = { tab = '→ ', trail = '·', extends = '>', precedes = '<', nbsp = '·', eol = '↲' }
vim.opt.expandtab = true
vim.opt.tabstop = 4
vim.opt.shiftwidth = 4
vim.opt.softtabstop = 4
vim.opt.splitbelow = true
vim.opt.splitright = true
vim.opt.colorcolumn = '80'
vim.opt.clipboard = 'unnamedplus'
vim.opt.autoread = true

-- Cursor (block + blink in insert mode)
vim.opt.guicursor:append('i:block-blinkwait700-blinkoff400-blinkon250')

-- Folding (treesitter)
vim.opt.foldmethod = 'expr'
vim.opt.foldexpr = 'nvim_treesitter#foldexpr()'
vim.opt.foldlevel = 99
