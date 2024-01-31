-- [[ Variables ]] --

local map = vim.api.nvim_set_keymap

-- [[ Functions ]] --

function NM(key, command) -- Normal mode
  map('n', key, command, { noremap = true, silent = true })
end

function IM(key, command) -- Insert mode
  map('i', key, command, { noremap = true, silent = true })
end

function VM(key, command) -- Visual mode
  map('v', key, command, { noremap = true, silent = true })
end

function TM(key, command) -- Terminal mode
  map('t', key, command, { noremap = true, silent = true })
end
