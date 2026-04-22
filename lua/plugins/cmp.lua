local cmp = require('cmp')

cmp.setup({
  snippet = {
    expand = function(args) require('luasnip').lsp_expand(args.body) end,
  },
  mapping = {
    ['<Down>']    = cmp.mapping.select_next_item(),
    ['<Up>']      = cmp.mapping.select_prev_item(),
    ['<CR>']      = cmp.mapping.confirm({ select = true }),
    ['<Left>']    = cmp.mapping.abort(),
    ['<Right>']   = cmp.mapping.abort(),
    ['<C-Space>'] = cmp.mapping.complete(),
    ['<C-e>']     = cmp.mapping.close(),
    ['<C-h>'] = cmp.mapping(function()
      if cmp.visible() and cmp.get_selected_entry() then cmp.close() end
      vim.lsp.buf.signature_help()
    end, { 'i' }),
    ['<Tab>'] = cmp.mapping(function(fallback)
      if cmp.visible() then cmp.select_next_item() else fallback() end
    end, { 'i', 's' }),
  },
  sources = {
    { name = 'nvim_lsp', priority = 1000 },
    { name = 'luasnip',  priority = 750 },
    { name = 'buffer',   priority = 500 },
    { name = 'path',     priority = 250 },
  },
})

cmp.event:on('confirm_done', require('nvim-autopairs.completion.cmp').on_confirm_done())
