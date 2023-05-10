-- n, v, i, t = mode names

local M = {}

M.general = {
  i = {
    -- save
    ["<C-s>"] = { "<cmd> w  <CR>", "save file" },
  },
  n = {
    -- save
    ["<leader>gg"] = { "<cmd> VimBeGood <CR>", "open vim_be_good" },
    ["<leader>na"] = { "<cmd> Nvdash <CR>", "toggle nvdash" },
    ["<leader>u"] = { "<cmd> UndotreeToggle <CR>", "undo tree" },
    ["<leader>nu"] = { "<cmd> NvChadUpdate <CR>", "nvdash update" },
    ["<leader>m"] = { "<cmd> TSJToggle  <CR>", "treesj toggle" },
    ["<leader>kl"] = { "<cmd> KeylabStart  <CR>", "KeylabStart" },
    ["<C-t>"] = { "<cmd> TroubleToggle  <CR>", "trouble toggle" },
    -- ["<C-s>"] = { "<cmd> w  <CR>", "save file" },
    ["<leader>tr"] = {
      function()
        require("base46").toggle_transparency()
      end,
      "toggle transparency",
    },
    ["<leader>pp"] = {
      "<cmd> Telescope workspaces <CR>", "find workspaces",
    },
  },
}

return M
