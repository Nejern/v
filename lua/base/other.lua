-- [[ Options ]] --

opt.updatetime = 250                           -- Update time
opt.clipboard = "unnamedplus"                  -- System clipboard
vim.cmd("au BufEnter * set fo-=c fo-=r fo-=o") -- No auto comment on new lines

-- [[ Providers ]] --

vim.g.loaded_ruby_provider = 0
vim.g.loaded_node_provider = 0
vim.g.loaded_perl_provider = 0
