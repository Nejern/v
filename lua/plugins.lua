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

-- use a protected call so we don't error out on first use
local status_ok, _ = pcall(require, "lazy")
if not status_ok then
  print("lazy just installed, please restart neovim")
  return
end

-- Setup plugins
require("lazy").setup(
-- Plugins --
  {
    -- Appearance --
    require("plugins.gruvbox-material"), -- Theme
    require("plugins.transparent"),      -- Transparent window
    require("plugins.lualine"),          -- Statusline
    require("plugins.numbertoggle"),     -- Numbertoggle
    require("plugins.illuminate"),       -- Highlighting word uses
    require("plugins.todo-comments"),    -- Todo comments
    require("plugins.dressing"),         -- UI
    require("plugins.indent"),           -- UI

    -- Completion --
    require("plugins.cmp"),       -- Completion framework
    require("plugins.autopairs"), -- Autopairs
    require("plugins.surround"),  -- Surround
    --require("plugins.copilot"),   -- Copilot

    -- LSP --
    require("plugins.lsp"),

    -- Syntax highlighting
    require("plugins.treesitter"), -- TreeSitter

    -- Other --
    require("plugins.suda"),      -- Sudo interactions
    require("plugins.rust"),      -- rust-tools
    require("plugins.crates"),    -- Rust crates support
    require("plugins.tree"),      -- File explorer
    require("plugins.trouble"),   -- Project warnings
    require("plugins.tagbar"),    -- Project structure
    require("plugins.telescope"), -- Search
    require("plugins.gitsigns"),  -- Git decorations
  },

  { -- Options
    ui = {
      border = "rounded",
    },
  }
)
