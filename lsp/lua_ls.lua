return {
  cmd = { 'lua-language-server' },
  filetypes = { 'lua', 'vim' },
  root_markers = { '.luarc.json', '.git' },
  settings = {
    Lua = {
      runtime = { version = 'LuaJIT' },
      workspace = { library = vim.api.nvim_get_runtime_file('', true) },
    },
  },
}