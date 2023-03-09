local cmp = require('cmp')
cmp.setup({
	-- Enable LSP snippets
	snippet = {
		expand = function(args)
			-- vim.fn["vsnip#anonymous"](args.body) -- For `vsnip` users.
			require('luasnip').lsp_expand(args.body) -- For `luasnip` users.
			--require('snippy').expand_snippet(args.body) -- For `snippy` users.
			--vim.fn["UltiSnips#Anon"](args.body) -- For `ultisnips` users.
		end,
	},
	mapping = {
		-- Select prev completion
		['<C-p>'] = cmp.mapping.select_prev_item(),
		['<S-Tab>'] = cmp.mapping.select_prev_item(),
		['<C-n>'] = cmp.mapping.select_next_item(),
		['<Tab>'] = cmp.mapping.select_next_item(),
		--['<C-S-f>'] = cmp.mapping.scroll_docs(-4),
		['<C-f>'] = cmp.mapping.scroll_docs(4),
		['<C-Space>'] = cmp.mapping.complete(),
		['<C-e>'] = cmp.mapping.close(),
		['<C-y>'] = cmp.mapping.confirm({
			behavior = cmp.ConfirmBehavior.Insert,
			select = true,
		})
	},
	-- Installed sources:
	sources = {
		{	-- file paths
		name = 'path',
		option = {
			trailing_slash = false; -- Default false
			label_trailing_slash = false; -- Default false
			--get_cwd = function(); -- Default returns the current working directory of the current buffer
		}
	},
	{ name = 'nvim_lsp', keyword_length = 3 },	-- from language server
	{ name = 'nvim_lsp_signature_help'},		-- display function signatures with current parameter emphasized
	{ name = 'nvim_lua', keyword_length = 2},	-- complete neovim's Lua runtime API such vim.lsp.*
	{ name = 'buffer', keyword_length = 2 },	-- source current buffer
	{ name = 'calc'},				-- source for math calculation
	--{ name = 'vsnip', keyword_length = 2 },	-- nvim-cmp source for vim-vsnip 
},
window = {
	completion = cmp.config.window.bordered(),
	documentation = cmp.config.window.bordered(),
},
formatting = {
	fields = {'menu', 'abbr', 'kind'},
	format = function(entry, item)
		local menu_icon ={
			nvim_lsp = 'λ',
			--vsnip = '⋗',
			buffer = 'Ω',
			path = '🖫',
		}
		item.menu = menu_icon[entry.source.name]
		return item
	end,
},
})
