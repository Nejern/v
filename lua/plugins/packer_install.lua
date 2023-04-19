vim.cmd([[packadd packer.nvim]])

return require("packer").startup(function(use)
	-- Packer can manage itself
	use("wbthomason/packer.nvim")

	-- Transparent window
	use({
		"xiyaowong/transparent.nvim",
		config = function()
			require('plugins.transparent')
		end
	})

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

	-- rust-tools
	use "simrat39/rust-tools.nvim"

	-- LSP
	use({
		"williamboman/mason.nvim",
		requires = {
			"williamboman/mason-lspconfig.nvim",
			"neovim/nvim-lspconfig",
			"hrsh7th/cmp-nvim-lsp", -- LSP completion source
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
			require("plugins.lspconfig")
		end,
	})

	-- GLSL syntax highlighting
	use("tikhomirov/vim-glsl")

	-- LuaSnip
	use({
		"L3MON4D3/LuaSnip",
		-- follow latest release.
		tag = "v<CurrentMajor>.*",
		-- install jsregexp (optional!:).
		run = "make install_jsregexp",
	})

	-- Completion --
	-- LuaSnip source
	use "saadparwaiz1/cmp_luasnip"
	-- Useful completion sources:
	use "hrsh7th/cmp-nvim-lua"
	use "hrsh7th/cmp-nvim-lsp-signature-help"
	use "hrsh7th/cmp-path"
	use "hrsh7th/cmp-buffer"
	use "hrsh7th/cmp-cmdline"

	-- Completion framework:
	use({
		"hrsh7th/nvim-cmp",
		config = function()
			require("plugins.cmp")
		end,
	})
end)
