return {
  "sainnhe/gruvbox-material",
  lazy = false,
  priority = 1000,
  config = function()
    g.gruvbox_material_background = "hard"    -- Hard background
    g.gruvbox_material_foreground = "hard"    -- Hard foreground
    g.gruvbox_material_enable_italic = 1      -- Enable italic
    g.gruvbox_material_better_performance = 1 -- Better performance

    vim.cmd("colorscheme gruvbox-material")   -- Set colorscheme
  end,
}
