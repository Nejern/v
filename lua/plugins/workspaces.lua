return {
  "natecraddock/workspaces.nvim",
  config = function()
    require("workspaces").setup({
      hooks = {
        open = { "NvimTreeOpen", 'lua require("nvim-tree.api").tree.change_root(vim.fn.getcwd(-1, -1))' },
      },
    })
  end,
}
