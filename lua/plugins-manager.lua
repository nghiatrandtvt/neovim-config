local plug = vim.fn['plug#']

vim.call('plug#begin', '~/.local/share/nvim/site/plugged')

-- File explorer
plug('nvim-tree/nvim-tree.lua')
plug('nvim-tree/nvim-web-devicons')

-- Fuzzy finder
plug('junegunn/fzf', { ['do'] = function() vim.fn['fzf#install']() end })
plug('junegunn/fzf.vim')
plug('nvim-lua/plenary.nvim')
plug('nvim-telescope/telescope.nvim')

-- Git
plug('lewis6991/gitsigns.nvim')
plug('kdheepak/lazygit.nvim')

-- Themes
plug('dracula/vim')
plug('joshdick/onedark.vim')
plug('kaicataldo/material.vim')
plug('altercation/vim-colors-solarized')
plug('arcticicestudio/nord-vim')
plug('morhetz/gruvbox')

-- UI
plug('folke/which-key.nvim')
plug('nvim-lualine/lualine.nvim')
plug('nvimdev/lspsaga.nvim')
plug('mhinz/vim-startify')

-- Editing
plug('preservim/nerdcommenter')
plug('windwp/nvim-autopairs')
plug('tpope/vim-surround')
plug('sindrets/winshift.nvim')

-- Completion
plug('hrsh7th/nvim-cmp')
plug('hrsh7th/cmp-nvim-lsp')
plug('hrsh7th/cmp-buffer')
plug('hrsh7th/cmp-cmdline')
plug('L3MON4D3/LuaSnip')

-- LSP & Treesitter
plug('mfussenegger/nvim-jdtls')
plug('nvim-treesitter/nvim-treesitter', { ['do'] = ':TSUpdate' })

-- Markdown
plug('ellisonleao/glow.nvim')

vim.call('plug#end')
