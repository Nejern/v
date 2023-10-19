require('keys.alias')

g.mapleader = ' '

-- LSP
nm('K', '<cmd>lua vim.lsp.buf.hover()<CR>')          -- Hover for object
nm('<leader>f', '<cmd>lua vim.lsp.buf.format()<CR>') -- Format document
nm('ga', '<cmd>lua vim.lsp.buf.code_action()<CR>')   -- Code actions
nm('gd', '<cmd>lua vim.lsp.buf.definition()<CR>')    -- Definition
nm('gR', '<cmd>lua vim.lsp.buf.rename()<CR>')        -- Rename object

-- FloaTerm configuration
--nm('<leader>t', ':FloatermNew --name=myfloat --height=0.8 --width=0.7 --autoclose=2 zsh <CR>')
nm('<leader>T', '<cmd>FloatermToggle myfloat<CR>')
tm('<Esc>', '<C-\\><C-n>:q<CR>')

-- nvim-tree
nm('<C-w>t', '<cmd>NvimTreeToggle<CR>')

-- tagbar
nm('<F8>', '<cmd>TagbarToggle<CR>')

-- Telescope
nm('<leader>tf', '<cmd>Telescope find_files<CR>')
nm('<leader>tg', '<cmd>Telescope live_grep<CR>')
nm('<leader>tb', '<cmd>Telescope buffers<CR>')
nm('<leader>th', '<cmd>Telescope help_tags<CR>')
