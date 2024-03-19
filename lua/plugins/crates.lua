return {
  "saecki/crates.nvim",
  dependencies = {
    "nvim-lua/plenary.nvim",
    "jose-elias-alvarez/null-ls.nvim",
  },
  config = function()
    require("crates").setup({
      src = {
        cmp = {
          enabled = true,
        },
      },
      null_ls = {
        enabled = true,
        name = "crates.nvim",
      },
    })
  end,
}
