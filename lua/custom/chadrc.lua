---@type ChadrcConfig
local M = {}

M.ui = {
	theme = 'nord',
	transparency = true,
}
M.mappings = require "custom.mappings"
M.plugins = "custom.plugins"

return M
