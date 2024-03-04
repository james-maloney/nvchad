---@type ChadrcConfig
local M = {}

M.ui = {
	theme = 'catppuccin',
	transparency = true,
  statusline = {
    theme = "minimal",
    separator_style = "round",
  },
  tabufline = {
    show_numbers = true,
  },
  cheatsheet = {
    theme = "simple",
  },
  cmp = {
    style = "flat_light"
  }
}

M.mappings = require "custom.mappings"
M.plugins = "custom.plugins"

local disabled_plugins = require("plugins.configs.lazy_nvim").performance.rtp.disabled_plugins

M.lazy_nvim = {
  performance = {
    rtp = {
      disabled_plugins = vim.tbl_filter(function(x)
        return x ~= "rplugin"
      end, disabled_plugins),
    },
  },
}

return M
