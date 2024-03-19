return {
  "nvim-lualine/lualine.nvim",
  event = "VeryLazy",
  dependencies = { "nvim-tree/nvim-web-devicons" },
  init = function()
    -- disable until lualine loads
    vim.opt.laststatus = 0
  end,
  config = function()
    require('lualine').setup {
      options = {
        icons_enabled = true,
        theme = 'auto',
        component_separators = { left = '', right = '' },
        section_separators = { left = '', right = '' },
        disabled_filetypes = {},
        always_divide_middle = true,
        globalstatus = false,
      },
      sections = {
        lualine_c = { 'filename', 'lsp_progress' },
        lualine_y = { 'progress' },
        lualine_z = { 'location' }
      },
    }
  end,
}
