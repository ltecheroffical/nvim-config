---@type ChadrcConfig 
local M = {}
require("custom.nvim")
M.ui = { theme = 'catppuccin' }
M.plugins = "custom.plugins"
M.mappings = require("custom.keymaps")
return M
