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
require("lazy").setup(
  {   -- Plugins
    -- Appearance --
    { -- Theme
      "sainnhe/gruvbox-material",
      lazy = false,
      priority = 1000,
    },
    { -- Transparent window
      "xiyaowong/transparent.nvim",
      lazy = false,
      config = function()
        require("plugins.transparent")
      end,
    },
    { -- Statusline
      "nvim-lualine/lualine.nvim",
      dependencies = { "kyazdani42/nvim-web-devicons" },
      config = function()
        require("plugins.lualine")
      end,
    },
    { -- Numbertoggle
      "jeffkreeftmeijer/vim-numbertoggle",
    },
    { -- Highlighting word uses
      "RRethy/vim-illuminate",
    },
    { -- Todo comments
      "folke/todo-comments.nvim",
      dependencies = { "nvim-lua/plenary.nvim" },
      config = function()
        require("plugins.todo-comments")
      end
    },

    -- Completion --
    { -- Completion framework:
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
        require("plugins.cmp")
      end,
    },
    { -- Autopairs
      "windwp/nvim-autopairs",
      config = function()
        require("nvim-autopairs").setup()
      end,
    },
    {
      "tpope/vim-surround",
    },

    -- LSP --
    { -- Mason
      "williamboman/mason.nvim",
      dependencies = {
        "williamboman/mason-lspconfig.nvim",
        "neovim/nvim-lspconfig",
      },
      config = function()
        require("plugins.lspconfig")
      end,
    },

    -- Syntax highlighting
    { -- TreeSitter
      "nvim-treesitter/nvim-treesitter",
      build = ":TSUpdate",
      config = function()
        require("plugins.treesitter")
      end,
    },

    -- Other --
    { -- Sudo interactions
      "lambdalisue/suda.vim",
    },
    { -- rust-tools
      "simrat39/rust-tools.nvim",
    },
    { -- Terminal window
      "voldikss/vim-floaterm",
    },
    {
      "nvim-tree/nvim-tree.lua",
      version = "*",
      lazy = false,
      dependencies = {
        "kyazdani42/nvim-web-devicons",
      },
      config = function()
        require("nvim-tree").setup {}
      end,
    },
    { -- Project warnings
      "folke/trouble.nvim",
      dependencies = { "kyazdani42/nvim-web-devicons" },
    },
    { -- Project structure
      "preservim/tagbar"
    },
  },
  { -- Options
    ui = {
      border = "rounded",
    },
  }
)
