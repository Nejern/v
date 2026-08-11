local ensure_installed = {
  "lua",
  "markdown",
  "markdown_inline",
  "rust",
  "toml",
}

return {
  "nvim-treesitter/nvim-treesitter",
  branch = "main",
  lazy = false,
  build = ":TSUpdate",
  config = function()
    local treesitter = require("nvim-treesitter")

    -- The main branch is a full rewrite. Avoid calling its API while lazy.nvim
    -- is still using the old locked revision during the first plugin sync.
    if not treesitter.install then
      vim.notify("Run :Lazy sync to migrate nvim-treesitter to its main branch", vim.log.levels.WARN)
      return
    end

    local max_filesize = 100 * 1024 -- 100 KB

    local function start(buf)
      if not vim.api.nvim_buf_is_valid(buf) or vim.bo[buf].buftype ~= "" then
        return
      end

      local filename = vim.api.nvim_buf_get_name(buf)
      local stats = filename ~= "" and vim.uv.fs_stat(filename) or nil
      if stats and stats.size > max_filesize then
        return
      end

      local lang = vim.treesitter.language.get_lang(vim.bo[buf].filetype)
      if not lang then
        return
      end

      local ok, loaded = pcall(vim.treesitter.language.add, lang)
      if not ok or not loaded then
        return
      end

      if not vim.treesitter.highlighter.active[buf] then
        vim.treesitter.start(buf, lang)
      end

      for _, win in ipairs(vim.fn.win_findbuf(buf)) do
        vim.wo[win].foldmethod = "expr"
        vim.wo[win].foldexpr = "v:lua.vim.treesitter.foldexpr()"
        vim.wo[win].foldenable = false
      end
    end

    local group = vim.api.nvim_create_augroup("treesitter-highlight", { clear = true })
    vim.api.nvim_create_autocmd("FileType", {
      group = group,
      callback = function(args)
        start(args.buf)
      end,
    })

    -- Install the configured parsers asynchronously, then enable highlighting
    -- for buffers that were opened while installation was in progress.
    treesitter.install(ensure_installed):await(function(err, installed)
      if err or not installed then
        return
      end

      vim.schedule(function()
        for _, buf in ipairs(vim.api.nvim_list_bufs()) do
          if vim.api.nvim_buf_is_loaded(buf) then
            start(buf)
          end
        end
      end)
    end)
  end,
}
