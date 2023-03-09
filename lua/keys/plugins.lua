require('keys.alias')

g.mapleader = ' '

-- LSP
nm('K', '<cmd>lua vim.lsp.buf.hover()<CR>')        -- Hover for object
nm('gf', '<cmd>lua vim.lsp.buf.format()<CR>')      -- Format document
nm('ga', '<cmd>lua vim.lsp.buf.code_action()<CR>') -- Code actions
nm('gR', '<cmd>lua vim.lsp.buf.rename()<CR>')      -- Rename object
