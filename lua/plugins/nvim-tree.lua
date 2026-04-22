vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

require('nvim-tree').setup({
  sync_root_with_cwd = true,
  update_focused_file = {
    enable = true,
    update_root = false,
  },
  sort = {
    sorter = 'case_sensitive',
  },
  renderer = {
    group_empty = true,
    highlight_opened_files = 'icon',
    highlight_modified = 'icon',
    full_name = true,
    indent_markers = { enable = true },
    icons = {
      git_placement = 'after',
      show = { git = true },
    },
  },
  modified = {
    enable = true,
  },
  filters = {
    dotfiles = false,
    custom = { '^.git$' },
  },
  git = {
    enable = true,
    ignore = false,
  },
  diagnostics = {
    enable = true,
    show_on_dirs = true,
  },
  actions = {
    open_file = {
      quit_on_open = false,
      window_picker = { enable = true },
    },
  },
  view = {
    width = 35,
  },
})

vim.api.nvim_set_hl(0, 'NvimTreeSymlink', { fg = '#98e4de', italic = true })
vim.api.nvim_set_hl(0, 'NvimTreeFolderArrowClosed', { fg = '#FFFF00' })
vim.api.nvim_set_hl(0, 'NvimTreeFolderArrowOpen', { fg = '#70dbb7' })
vim.api.nvim_set_hl(0, 'NvimTreeExecFile', { fg = '#00FF00' })
vim.api.nvim_set_hl(0, 'NvimTreeFolderName', { fg = '#00BFFF' })
