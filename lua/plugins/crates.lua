return {
  "saecki/crates.nvim",
  tag = "stable",
  event = {
    "BufRead Cargo.toml",
    "BufNewFile Cargo.toml",
  },
  opts = {
    lsp = {
      enabled = true,
      actions = true,
      completion = true,
      hover = true,
    },
    completion = {
      crates = {
        enabled = true,
        min_chars = 3,
        max_results = 8,
      },
    },
  },
}
