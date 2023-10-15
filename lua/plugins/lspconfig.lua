require("mason").setup({
  ui = {
    icons = {
      package_installed = "",
      package_pending = "",
      package_uninstalled = "",
    },
    border = "rounded",
  }
})

-- mason-null-ls
require("mason-null-ls").setup({
  handlers = {},
})

-- mason-dap
require("mason-nvim-dap").setup({
  handlers = {},
})

require("mason-lspconfig").setup({
  ensure_installed = {},
  automatic_installation = true,
})

require("mason-lspconfig").setup_handlers({
  function(server_name)
    require("lspconfig")[server_name].setup({
      capabilities = require('cmp_nvim_lsp').default_capabilities()
    })
  end,
  -- Next, you can provide a dedicated handler for specific servers.
  -- For example, a handler override for the `rust_analyzer`:
  ["rust_analyzer"] = function()
    require("rust-tools").setup {}
  end
})

vim.lsp.handlers['textDocument/hover'] = vim.lsp.with(
  vim.lsp.handlers.hover,
  { border = 'rounded' }
)

vim.lsp.handlers['textDocument/signatureHelp'] = vim.lsp.with(
  vim.lsp.handlers.signature_help,
  { border = 'rounded' }
)
