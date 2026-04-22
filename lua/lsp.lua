local builtin = require('telescope.builtin')

-- Enable LSP servers (configs in lsp/ directory)
vim.lsp.enable({ 'clangd', 'pyright', 'bashls', 'jdtls', 'lua_ls' })

-- Diagnostics
vim.diagnostic.config({
  virtual_text = { current_line = true },
  signs = true,
  underline = true,
  update_in_insert = false,
  severity_sort = true,
})

-- LSP keymaps
vim.keymap.set('n', 'gd', builtin.lsp_definitions, { desc = 'lsp-go-to-definition' })
vim.keymap.set('n', 'gi', builtin.lsp_implementations, { desc = 'lsp-go-to-implementation' })
vim.keymap.set('n', 'gr', builtin.lsp_references, { desc = 'lsp-find-references' })
vim.keymap.set({ 'n', 'i' }, '<C-s>', vim.lsp.buf.signature_help, { desc = 'lsp-signature-help' })

-- jdtls custom progress notification (not standard LSP progress)
vim.g.jdtls_status = ''
vim.lsp.handlers['language/status'] = function(_, result)
  vim.g.jdtls_status = (result.type or '') .. ': ' .. (result.message or '')
end
