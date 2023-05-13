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
    ["<leader>m"] = { "<cmd> TSJToggle <CR>", "treesj toggle" },
    ["<leader>kl"] = { "<cmd> KeylabStart  <CR>", "KeylabStart" },
    ["<leader>kw"] = { "<cmd> bufdo bd <CR>", "close all buffer" },
    ["<C-t>"] = { "<cmd> TroubleToggle  <CR>", "trouble toggle" },
    ["<A-z>"] = {
      function()
        require("custom.utils").toggle_wrap()
      end,
      "save file",
    },
    ["<leader>pp"] = {
      "<cmd> Telescope workspaces <CR>", "find workspaces",
    },
  },
  v = {
    -- save
    ["J"] = { ":m '>+1<CR>gv=gv", "move lines down" },
    ["K"] = { ":m '<-2<CR>gv=gv", "move lines up" },
    ["<C-p>"] = { "y'>o<Esc>gp", "dulplicate lines downs" },
  },
}

return M
