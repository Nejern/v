--[[ Variables ]]--
opt = vim.opt
g = vim.g

--[[ Plugins ]]--
require('plugins.packer_install')

--[[ Options ]]--
require('base.appearance')	-- Appearance
require('base.colorscheme')	-- Colorscheme
require('base.cursor')		-- Cursor
require('base.completion')	-- Completion
require('base.diagnostic')	-- Diagnostic
require('base.other')		-- Other
