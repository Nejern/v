vim.cmd([[packadd packer.nvim]]) 

return require("packer").startup(function()
	-- Packer can manage itself
	use("wbthomason/packer.nvim")

	-- Theme
        use("sainnhe/gruvbox-material")

	-- Autopairs
	use({
		"windwp/nvim-autopairs",
		config = function()
			require("nvim-autopairs").setup()
		end,
	})

	-- Statusline
	use({
		"nvim-lualine/lualine.nvim",
		requires = { "kyazdani42/nvim-web-devicons", opt = true },
		config = function()
			require("plugins.lualine")
		end,
	})

	-- LSP
	use({
		"williamboman/mason.nvim",
		requires = {
			"williamboman/mason-lspconfig.nvim",
			"neovim/nvim-lspconfig"
			--"nvim-lua/plenary.nvim",
			--"jose-elias-alvarez/null-ls.nvim",
			--"jay-babu/mason-null-ls.nvim",
		},
		config = function()
			require("mason").setup()
			--require("mason-null-ls").setup({
				--automatic_setup = true,
			--})
			require("mason-lspconfig").setup()
			require("mason-lspconfig").setup_handlers({
				function(server_name)
					require("lspconfig")[server_name].setup({})
				end,
				-- Next, you can provide a dedicated handler for specific servers.
				-- For example, a handler override for the `rust_analyzer`:
				--["rust_analyzer"] = function ()
				--  require("rust-tools").setup {}
				--end
			})
			require("plugins.lspconfig")
		end,
	})

	-- Completion framework:
	use({
		"hrsh7th/nvim-cmp",
		requires = {
			require("plugins.cmp")
		},
	})
	-- LSP completion source:
	use "hrsh7th/cmp-nvim-lsp"
	-- Useful completion sources:
	use "hrsh7th/cmp-nvim-lua"
	use "hrsh7th/cmp-nvim-lsp-signature-help"
	use "hrsh7th/cmp-vsnip"
	use "hrsh7th/cmp-path"
	use "hrsh7th/cmp-buffer"
	use "hrsh7th/vim-vsnip"
end)
