--g.did_load_filetypes = 0
g.do_filetype_lua = 1
vim.filetype.add({
  extension = {
    -- [[ OpenGL ]] --
    -- Shader files
    ["vs"] = "glsl",
    ["fs"] = "glsl",
    -- [[ C++ ]] --
    ["cpp"] = function()
      vim.bo.cinoptions = vim.bo.cinoptions .. "L0"
      return "cpp"
    end,
    -- [[ Lua ]] --
    ["lua"] = function()
      opt.expandtab = true
      opt.tabstop = 2
      opt.shiftwidth = 2
      return "lua"
    end,
    -- [[ Rust ]] --
    ["rs"] = function()
      opt.expandtab = true
      opt.tabstop = 4
      opt.shiftwidth = 4
      return "rust"
    end,
    -- [[ Go ]] --
    ["go"] = function()
      opt.expandtab = false
      opt.tabstop = 4
      opt.shiftwidth = 4
      return "go"
    end,
    -- [[ HTML ]] --
    ["html"] = function()
      opt.expandtab = true
      opt.tabstop = 4
      opt.shiftwidth = 4
      return "html"
    end,
    -- [[ Terraform ]] --
    ["tf"] = function()
      opt.expandtab = true
      opt.tabstop = 2
      opt.shiftwidth = 2
      return "terraform"
    end,
    -- [[ Terragrunt ]] --
    ["hcl"] = function()
      opt.expandtab = true
      opt.tabstop = 2
      opt.shiftwidth = 2
      return "hcl"
    end,
    -- [[ JS ]] --
    ["js"] = function()
      opt.expandtab = true
      opt.tabstop = 4
      opt.shiftwidth = 4
      return "javascript"
    end,
  },
})
