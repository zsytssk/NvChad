-- n, v, i, t = mode names

local M = {}

M.general = {
  i = {
    -- save
    ["<leader>na"] = { "<cmd> Nvdash <CR>", "open nvdash" },
    ["<C-s>"] = { "<cmd> w  <CR>", "save file" },
  },
  n = {
    -- save
    ["<leader>gg"] = { "<cmd> VimBeGood <CR>", "open nvdash" },
    ["<leader>na"] = { "<cmd> Nvdash <CR>", "open nvdash" },
    ["<C-s>"] = { "<cmd> w  <CR>", "save file" },
  },
}

return M
