vim.api.nvim_set_hl(0, 'CustomOverlay', {
  fg = '#333333',
  bg = '#dce309',
  bold = true,
})

local function show_active_buffer()
  local buf_nr = vim.api.nvim_get_current_buf()
  local ns_id = vim.api.nvim_create_namespace('show_buffer')
  vim.api.nvim_buf_clear_namespace(buf_nr, ns_id, 0, -1)
  vim.api.nvim_buf_set_extmark(buf_nr, ns_id, 0, 0, {
    virt_text = { { 'ACTIVE', 'CustomOverlay' } },
    virt_text_pos = 'overlay',
  })
  vim.defer_fn(function()
    if vim.api.nvim_buf_is_valid(buf_nr) then
      vim.api.nvim_buf_clear_namespace(buf_nr, ns_id, 0, -1)
    end
  end, 2000)
end

vim.keymap.set('n', '<C-b>', show_active_buffer)
vim.keymap.set('i', '<C-b>', show_active_buffer)
