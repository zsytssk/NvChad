---@type ChadrcConfig

local M = {}
M.ui = {
  theme = "ayu_dark",
  transparency = true,
  nvdash = { load_on_startup = true },
  hl_override = require "custom.highlights",
}
M.plugins = "custom.plugins"
M.mappings = require "custom.mappings"

return M
