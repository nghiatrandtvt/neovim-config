-- Plugin manager
require('plugins-manager')

-- Core
require('core.options')
require('core.keymaps')
require('core.autocmds')
require('core.ui')

-- Plugins
require('plugins.treesitter')
require('plugins.nvim-tree')
require('plugins.whichkey')
require('plugins.cmp')
require('plugins.telescope')
require('plugins.lualine')
require('plugins.glow')
require('plugins.lspsaga')
require('plugins.gitsigns')
require('plugins.fzf')
require('plugins.lazygit')
require('plugins.autopairs')

-- LSP
require('lsp')

-- Custom
require('custom.jump-to-file')
require('custom.show-active-buffer')
require('custom.git-gerrit')
require('custom.open-url')