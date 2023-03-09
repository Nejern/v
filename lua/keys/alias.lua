--[[ Variables ]]--
local map = vim.api.nvim_set_keymap

--[[ Functions ]]--
-- Normal mode
function nm(key, command)
  map('n', key, command, {noremap = true, silent = true})
end
-- Insert mode
function im(key, command)
  map('i', key, command, {noremap = true, silent = true})
end
-- Visual mode
function vm(key, command)
  map('v', key, command, {noremap = true, silent = true})
end
-- Terminal mode
function tm(key, command)
  map('t', key, command, {noremap = true, silent = true})
end
