---@type ChadrcConfig 
local M = {}
require("custom.nvim")
M.ui = { theme = 'catppuccin' }
M.mappings = require("custom.keymaps")
M.plugins = "custom.plugins"
return M
