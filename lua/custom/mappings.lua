-- n, v, i, t = mode names

local M = {}

M.general = {
  i = {
    -- save
    ["<C-s>"] = { "<cmd> w <CR>", "save file" },
  },
  n = {
    ["<C-d>"] = { "<C-d>zz", "move down" },
    ["<C-u>"] = { "<C-u>zz", "move up" },
    ["n"] = { "nzzzv", "find down" },
    ["N"] = { "Nzzzv", "find up" },
    ["<leader>hh"] = {
      function()
        require("harpoon.ui").toggle_quick_menu()
      end,
      "open vim_be_good",
    },
    ["<leader>ha"] = {
      function()
        require("harpoon.mark").add_file()
      end,
      "open vim_be_good",
    },

    -- save
    ["z="] = {
      function()
        require("telescope.builtin").spell_suggest(require("telescope.themes").get_cursor {})
      end,
      "telescope spell suggest",
    },
    ["gr"] = {
      function()
        require("telescope.builtin").lsp_references()
      end,
      "telescope lsp_references",
    },
    ["<leader>S"] = { "<cmd>lua require('spectre').open()<CR>", "global find replace" },
    ["<leader>gg"] = { "<cmd> VimBeGood <CR>", "open vim_be_good" },
    ["<leader>na"] = { "<cmd> Nvdash <CR>", "toggle nvdash" },
    ["<leader>u"] = { "<cmd> UndotreeToggle <CR>", "undo tree" },
    ["<leader>nu"] = { "<cmd> NvChadUpdate <CR>", "nvdash update" },
    ["<leader>m"] = { "<cmd> TSJToggle <CR>", "treesj toggle" },
    ["<leader>ol"] = { "<cmd> AerialToggle <CR>", "Toggle outline" },
    ["<leader>og"] = { "<cmd> OrganizeImports <CR>", "organize imports" },
    ["<leader>kl"] = {
      function()
        require("close_buffers").wipe { type = "all", force = true }
      end,
      "close all buffers",
    },
    ["<leader>kw"] = { "<cmd> bufdo bd <CR>", "close all buffer" },
    ["<leader>cf"] = { "<cmd> echo expand('%:p') <CR>", "show current file name" },
    ["<A-z>"] = {
      function()
        require("custom.utils").toggle_wrap()
      end,
      "save file",
    },
    ["<leader>pp"] = {
      "<cmd> Telescope workspaces <CR>",
      "find workspaces",
    },
    ["<leader>w"] = {
      function()
        local picker = require "window-picker"
        local picked_window_id = picker.pick_window {
          include_current_win = true,
          selection_chars = "12345",
        }
        vim.api.nvim_set_current_win(picked_window_id)
      end,
      "find workspaces",
    },
    ["<A-t>"] = {
      function()
        require("custom.utils").test()
      end,
      "test",
    },
  },
  v = {
    -- save
    ["<A-p>"] = { "yPgv", "copy lines down", opts = { silent = true } },
    ["<A-S-P>"] = { "ygv<esc>pgv", "copy lines up", opts = { silent = true } },
    ["J"] = { ":m '>+1<CR>gv=gv", "move lines down", opts = { silent = true } },
    ["K"] = { ":m '<-2<CR>gv=gv", "move lines up", opts = { silent = true } },
    ["R"] = { '"xy:@x<CR>', "vim.cmd select text" },
  },
}

return M
