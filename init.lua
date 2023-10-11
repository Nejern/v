-- [[ Variables ]] --
opt = vim.opt
g = vim.g

-- [[ Plugins ]] --
require('plugins.lazy')

-- [[ Options ]] --
require('base.filetype')    -- Filetype
require('base.appearance')  -- Appearance
require('base.colorscheme') -- Colorscheme
require('base.search')      -- Search
require('base.cursor')      -- Cursor
require('base.window')      -- Window
require('base.panels')      -- Panels
require('base.tabs')        -- Tabs
require('base.completion')  -- Completion
require('base.diagnostic')  -- Diagnostic
require('base.other')       -- Other

-- [[ Hotkeys ]] --
require('keys.plugins')
