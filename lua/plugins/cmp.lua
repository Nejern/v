local cmp = require('cmp')
cmp.setup({
  -- Enable LSP snippets
  snippet = {
    expand = function(args)
      require('luasnip').lsp_expand(args.body) -- LuaSnip
    end,
  },
  -- Window options
  window = {
    completion = cmp.config.window.bordered(),
    documentation = cmp.config.window.bordered(),
  },
  -- Mapping
  mapping = {
    -- Select prev completion
    ['<C-p>'] = cmp.mapping.select_prev_item(),
    ['<S-Tab>'] = cmp.mapping.select_prev_item(),
    -- Select next completion
    ['<C-n>'] = cmp.mapping.select_next_item(),
    ['<Tab>'] = cmp.mapping.select_next_item(),
    -- Scroll docs
    ['<C-b>'] = cmp.mapping.scroll_docs(-4),
    ['<C-f>'] = cmp.mapping.scroll_docs(4),
    -- Complete
    ['<C-Space>'] = cmp.mapping.complete(),
    -- Close
    ['<C-e>'] = cmp.mapping.close(),
    -- Confirm
    ['<C-y>'] = cmp.mapping.confirm({
      behavior = cmp.ConfirmBehavior.Insert,
      select = true,
    })
  },
  -- Sources
  sources = {
    -- file paths
    {
      name = 'path',
      option = {
        trailing_slash = false,       -- Default false
        label_trailing_slash = false, -- Default false
        --get_cwd = function(); -- Default returns the current working directory of the current buffer
      }
    },
    { name = 'copilot', },                                   -- from language server
    { name = 'nvim_lsp',               keyword_length = 3 }, -- from language server
    { name = 'nvim_lsp_signature_help' },                    -- display function signatures with current parameter emphasized
    { name = 'nvim_lua',               keyword_length = 2 }, -- complete neovim's Lua runtime API such vim.lsp.*
    { name = 'buffer',                 keyword_length = 2 }, -- source current buffer
    { name = 'calc' },                                       -- source for math calculation
    { name = 'luasnip',                keyword_length = 2 }, -- nvim-cmp source for LuaSnip
  },
  -- Use buffer source for `/` and `?` (if enabled `native_menu`, this won't work anymore)
  cmp.setup.cmdline({ '/', '?' }, {
    mapping = cmp.mapping.preset.cmdline(),
    sources = {
      { name = 'buffer' }
    }
  }),
  -- Use cmdline & path source for ':' (if enabled `native_menu`, this won't work anymore)
  cmp.setup.cmdline(':', {
    mapping = cmp.mapping.preset.cmdline(),
    sources = cmp.config.sources({
      { name = 'path' }
    }, {
      { name = 'cmdline' }
    })
  }),
  formatting = {
    fields = { 'menu', 'abbr', 'kind' },
    format = function(entry, item)
      local menu_icon = {
        nvim_lsp = 'λ',
        luasnip = '⋗',
        buffer = 'Ω',
        path = '🖫',
        copilot = '',
      }
      item.menu = menu_icon[entry.source.name]
      return item
    end,
  },
})

-- Autopairs options
cmp.event:on(
  'confirm_done',
  require('nvim-autopairs.completion.cmp').on_confirm_done()
)

-- Setup buffer-local keymaps / options for LSP buffers
local capabilities = require("cmp_nvim_lsp").default_capabilities(vim.lsp.protocol.make_client_capabilities())
local lsp_attach = function(client, buf)
  -- Example maps, set your own with vim.api.nvim_buf_set_keymap(buf, "n", <lhs>, <rhs>, { desc = <desc> })
  -- or a plugin like which-key.nvim
  -- <lhs>        <rhs>                        <desc>
  -- "K"          vim.lsp.buf.hover            "Hover Info"
  -- "<leader>qf" vim.diagnostic.setqflist     "Quickfix Diagnostics"
  -- "[d"         vim.diagnostic.goto_prev     "Previous Diagnostic"
  -- "]d"         vim.diagnostic.goto_next     "Next Diagnostic"
  -- "<leader>e"  vim.diagnostic.open_float    "Explain Diagnostic"
  -- "<leader>ca" vim.lsp.buf.code_action      "Code Action"
  -- "<leader>cr" vim.lsp.buf.rename           "Rename Symbol"
  -- "<leader>fs" vim.lsp.buf.document_symbol  "Document Symbols"
  -- "<leader>fS" vim.lsp.buf.workspace_symbol "Workspace Symbols"
  -- "<leader>gq" vim.lsp.buf.formatting_sync  "Format File"

  vim.api.nvim_buf_set_option(buf, "formatexpr", "v:lua.vim.lsp.formatexpr()")
  vim.api.nvim_buf_set_option(buf, "omnifunc", "v:lua.vim.lsp.omnifunc")
  vim.api.nvim_buf_set_option(buf, "tagfunc", "v:lua.vim.lsp.tagfunc")
end

-- Setup rust_analyzer via rust-tools.nvim
require("rust-tools").setup({
  server = {
    capabilities = capabilities,
    on_attach = lsp_attach,
  }
})
