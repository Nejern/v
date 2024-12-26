return {
  "lewis6991/gitsigns.nvim",
  config = function()
    require("gitsigns").setup({
      signs_staged_enable = true,
      signcolumn = false, -- Toggle with `:Gitsigns toggle_signs`
      numhl = true,  -- Toggle with `:Gitsigns toggle_numhl`
      linehl = false, -- Toggle with `:Gitsigns toggle_linehl`
      word_diff = false, -- Toggle with `:Gitsigns toggle_word_diff`
    })
  end,
}
