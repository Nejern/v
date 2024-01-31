require('keys.alias')

g.mapleader = ' '

-- LSP
NM('K', '<cmd>lua vim.lsp.buf.hover()<CR>')          -- Hover for object
NM('<leader>f', '<cmd>lua vim.lsp.buf.format()<CR>') -- Format document
NM('ga', '<cmd>lua vim.lsp.buf.code_action()<CR>')   -- Code actions
NM('gd', '<cmd>lua vim.lsp.buf.definition()<CR>')    -- Definition
NM('gR', '<cmd>lua vim.lsp.buf.rename()<CR>')        -- Rename object

-- FloaTerm configuration
--nm('<leader>t', ':FloatermNew --name=myfloat --height=0.8 --width=0.7 --autoclose=2 zsh <CR>')
NM('<leader>T', '<cmd>FloatermToggle myfloat<CR>')
TM('<Esc>', '<C-\\><C-n>:q<CR>')

-- nvim-tree
NM('<C-w>t', '<cmd>NvimTreeToggle<CR>')

-- tagbar
NM('<F8>', '<cmd>TagbarToggle<CR>')

-- Trouble
NM('<F7>', '<cmd>TroubleToggle<CR>')

-- Telescope
NM('<leader>tf', '<cmd>Telescope find_files<CR>')
NM('<leader>tg', '<cmd>Telescope live_grep<CR>')
NM('<leader>tb', '<cmd>Telescope buffers<CR>')
NM('<leader>th', '<cmd>Telescope help_tags<CR>')
