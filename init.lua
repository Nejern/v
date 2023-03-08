--[[ Variables ]]--
opt = vim.opt
g = vim.g

--[[ Plugins ]]--
require('plugins.packer_install')

--[[ Options ]]--
require('base.appearance')	-- Appearance
require('base.colorscheme')	-- Colorscheme
require('base.completion')	-- Completion
require('base.other')		-- Other
