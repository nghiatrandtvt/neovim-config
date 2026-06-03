-- Highlights
vim.api.nvim_set_hl(0, 'NvimTreeNormal', { bg = '#3f3f4e' })
vim.api.nvim_set_hl(0, 'WinSeparator', { fg = '#06c197' })
vim.api.nvim_set_hl(0, 'Cursor', { bg = '#888888' })
vim.api.nvim_set_hl(0, 'Comment', { fg = '#a9a9a9', italic = true })
vim.api.nvim_set_hl(0, '@comment', { fg = '#a9a9a9', italic = true })

-- Tabline
function _G.MyTabLine()
  local s = ''
  for i = 1, vim.fn.tabpagenr('$') do
    local winnr = vim.fn.tabpagewinnr(i)
    local bufnr = vim.fn.tabpagebuflist(i)[winnr]
    local filename = vim.fn.fnamemodify(vim.fn.bufname(bufnr), ':t')
    s = s .. (i == vim.fn.tabpagenr() and '%#TabLineSel#' or '%#TabLine#')
    s = s .. ' ' .. i .. ':' .. (filename == '' and '[No Name]' or filename) .. ' '
  end
  return s .. '%#TabLineFill#'
end

vim.opt.tabline = '%!v:lua.MyTabLine()'
