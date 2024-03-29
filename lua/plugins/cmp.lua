return {
  "hrsh7th/nvim-cmp",
  dependencies = {
    { -- LuaSnip source
      "saadparwaiz1/cmp_luasnip",
      dependencies = { "L3MON4D3/LuaSnip" },
    },
    -- LSP completion source
    "hrsh7th/cmp-nvim-lsp",
    -- Useful completion sources:
    "hrsh7th/cmp-nvim-lua",
    "hrsh7th/cmp-nvim-lsp-signature-help",
    "hrsh7th/cmp-path",
    "hrsh7th/cmp-buffer",
    "hrsh7th/cmp-cmdline",
  },
  config = function()
    local WIDE_HEIGHT = 40
    local cmp = require('cmp')
    cmp.setup({
      -- Enable LSP snippets
      snippet = {
        expand = function(args)
          require('luasnip').lsp_expand(args.body) -- LuaSnip
        end,
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
        { name = "crates" },                                     -- rust crates
        { name = 'path', },                                      -- file paths
        { name = 'nvim_lsp',               keyword_length = 3 }, -- from language server
        { name = 'nvim_lsp_signature_help' },                    -- display function signatures with current parameter emphasized
        { name = 'nvim_lua',               keyword_length = 2 }, -- complete neovim's Lua runtime API such vim.lsp.*
        { name = 'buffer',                 keyword_length = 2 }, -- source current buffer
        { name = 'luasnip',                keyword_length = 2 }, -- nvim-cmp source for LuaSnip
        { name = 'calc' },                                       -- source for math calculation
      },
      -- Window options
      window = {
        completion = cmp.config.window.bordered({
          --border = { '', '', '', '', '', '', '', '' },
          winhighlight = 'Normal:Normal,FloatBorder:BorderBG,CursorLine:PmenuSel,Search:None',
          scrolloff = 0,
          col_offset = 0,
          side_padding = 1,
          scrollbar = true,
        }),
        documentation = cmp.config.window.bordered({
          max_height = math.floor(WIDE_HEIGHT * (WIDE_HEIGHT / vim.o.lines)),
          max_width = math.floor((WIDE_HEIGHT * 2) * (vim.o.columns / (WIDE_HEIGHT * 2 * 16 / 9))),
          border = { '', '', '', ' ', '', '', '', ' ' },
          winhighlight = 'FloatBorder:NormalFloat',
        }),
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

    cmp.event:on("menu_opened", function()
      vim.b.copilot_suggestion_hidden = true
    end)

    cmp.event:on("menu_closed", function()
      vim.b.copilot_suggestion_hidden = false
    end)

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

    require("rust-tools").setup({
      server = {
        capabilities = capabilities,
        on_attach = lsp_attach,
      }
    })
  end,
}
