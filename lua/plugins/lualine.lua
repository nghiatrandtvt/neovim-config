require('nvim-web-devicons').setup({ default = true })

local theme = require('lualine.themes.powerline_dark')
theme.normal.c.bg = '#05546f'
theme.command.c.bg = '#140689'

require('lualine').setup({
  options = {
    theme = theme,
    section_separators = { left = '', right = '' },
    component_separators = { left = '', right = '' },
    globalstatus = true,
    refresh = { statusline = 200 },
  },
  sections = {
    lualine_a = { 'mode' },
    lualine_b = {
      { 'branch', icon = { '', align = 'left', color = { fg = 'yellow', gui = 'bold' } } },
    },
    lualine_c = { 'filename', { function() return vim.lsp.status() ~= '' and vim.lsp.status() or vim.g.jdtls_status or '' end } },
    lualine_x = {
      function() return vim.fn.getcwd() end,
      function() return 'wnu-' .. vim.api.nvim_win_get_number(0) end,
      'filetype',
    },
    lualine_y = { 'progress' },
    lualine_z = { 'location' },
  },
})
