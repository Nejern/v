-- [[ Diagnostic ]] --

local sign = function(opts)
  vim.fn.sign_define(opts.name, {
    texthl = opts.name,
    text = opts.text,
    numhl = ''
  })
end

sign({ name = 'DiagnosticSignError', text = '🖕' })
sign({ name = 'DiagnosticSignWarn', text = '🦽' })
sign({ name = 'DiagnosticSignHint', text = '🥸' })
sign({ name = 'DiagnosticSignInfo', text = '🌚' })

vim.diagnostic.config({
  virtual_text = false,
  signs = true,
  update_in_insert = true,
  underline = true,
  severity_sort = false,
  float = {
    border = 'rounded',
    source = 'always',
    header = '',
    prefix = '',
  },
})

-- Show on cursor hold
vim.cmd([[autocmd CursorHold * lua vim.diagnostic.open_float(nil, { focusable = false })]])
