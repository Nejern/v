return {
  "nvim-tree/nvim-tree.lua",
  version = "*",
  lazy = false,
  dependencies = {
    "kyazdani42/nvim-web-devicons",
  },
  config = function()
    require("nvim-tree").setup {}
  end,
}
