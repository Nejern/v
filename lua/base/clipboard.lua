opt.clipboard = "unnamedplus"                 -- System clipboard
vim.g.clipboard = "osc52"                     -- OSC52 provider for SSH
vim.api.nvim_create_autocmd("TextYankPost", { -- SSH
  group = vim.api.nvim_create_augroup("highlight-yank", { clear = true }),
  callback = function()
    vim.highlight.on_yank()
  end,
})
