return {
  cmd = { 'clangd', '--background-index', '--clang-tidy' },
  root_markers = { 'compile_commands.json', 'configure.ac', '.git' },
  filetypes = { 'c', 'cpp', 'objc', 'objcpp' },
}