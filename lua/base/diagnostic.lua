vim.diagnostic.config({
	--virtual_text = {
		--source = "if_many",  -- Or "always"
		--prefix = '●', -- Could be '■', '▎', 'x'
	--},
	virtual_text = false,
	severity_sort = true,
	float = {
		source = "if_many",  -- Or "always"
	},
})

-- Show on cursor hold
vim.cmd([[
autocmd CursorHold * lua vim.diagnostic.open_float(nil, { focusable = false })
]])
