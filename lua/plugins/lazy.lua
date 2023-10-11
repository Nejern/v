-- Bootstrap lazy.nvim
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end
opt.rtp:prepend(lazypath)

-- Setup plugins
require("lazy").setup({
  { -- Theme
    "sainnhe/gruvbox-material",
    lazy = false,
    priority = 1000,
  },
  { -- Transparent window
    "xiyaowong/transparent.nvim",
    lazy = false,
    priority = 1000,
    config = function()
      require('plugins.transparent')
    end,
  },
  { -- Autopairs
    "windwp/nvim-autopairs",
    config = function()
      require("nvim-autopairs").setup()
    end,
  },
  { -- Numbertoggle
    "jeffkreeftmeijer/vim-numbertoggle",
  },
  { -- Statusline
    "nvim-lualine/lualine.nvim",
    dependencies = { "kyazdani42/nvim-web-devicons" },
    config = function()
      require("plugins.lualine")
    end,
  },
  { -- Sudo interactions
    "lambdalisue/suda.vim",
  },
  { -- rust-tools
    "simrat39/rust-tools.nvim",
  },
  { -- TreeSitter
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",
    config = function()
      require("plugins.treesitter")
    end,
  },

  -- Completion --
  { -- Completion framework:
    "hrsh7th/nvim-cmp",
    dependencies = {
      { -- LuaSnip source
        "saadparwaiz1/cmp_luasnip",
        dependencies = { "L3MON4D3/LuaSnip" },
      },
      -- Useful completion sources:
      "hrsh7th/cmp-nvim-lua",
      "hrsh7th/cmp-nvim-lsp-signature-help",
      "hrsh7th/cmp-path",
      "hrsh7th/cmp-buffer",
      "hrsh7th/cmp-cmdline",
    },
    config = function()
      require("plugins.cmp")
    end,
  },

  -- LSP --
  { -- Mason
    "williamboman/mason.nvim",
    dependencies = {
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
  },
})
