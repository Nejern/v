return {
  "saecki/crates.nvim",
  dependencies = {
    "nvim-lua/plenary.nvim",
    "nvimtools/none-ls.nvim",
  },
  config = function()
    require("crates").setup({
      null_ls = {
        enabled = true,
        name = "crates.nvim",
      },
    })
  end,
}
