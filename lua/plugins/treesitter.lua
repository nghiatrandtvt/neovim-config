require('nvim-treesitter.configs').setup({
  ensure_installed = { 'lua', 'python', 'c', 'javascript', 'cpp', 'json', 'java', 'vim', 'bash' },
  auto_install = true,
  highlight = {
    enable = true,
    additional_vim_regex_highlighting = false,
  },
  fold = {
    enable = true,
  },
})
