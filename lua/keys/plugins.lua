require('keys.alias')

g.mapleader = ' '

-- LSP
nm('K', '<cmd>lua vim.lsp.buf.hover()<CR>')        -- Hover for object
nm('gf', '<cmd>lua vim.lsp.buf.format()<CR>')      -- Format document
nm('ga', '<cmd>lua vim.lsp.buf.code_action()<CR>') -- Code actions
nm('gR', '<cmd>lua vim.lsp.buf.rename()<CR>')      -- Rename object

-- FloaTerm configuration
nm('<leader>ft', ':FloatermNew --name=myfloat --height=0.8 --width=0.7 --autoclose=2 zsh <CR>')
nm('t', ':FloatermToggle myfloat<CR>')
tm('<Esc>', '<C-\\><C-n>:q<CR>')
