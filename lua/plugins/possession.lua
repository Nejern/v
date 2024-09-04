return {
  "jedrzejboczar/possession.nvim",
  dependencies = {
    "nvim-lua/plenary.nvim",
    "nvim-telescope/telescope.nvim",
  },
  config = function()
    require("possession").setup({
      autosave = {
        current = true,
      },
      autoload = "last_cwd",
    })
    require("telescope").load_extension("possession")
  end,
}
