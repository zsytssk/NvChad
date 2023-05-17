-- test
local plugins = {
  --- override default plugins setting - start
  {
    "neovim/nvim-lspconfig",
    dependencies = {
      "jose-elias-alvarez/null-ls.nvim",
      config = function()
        require "custom.plugins_config.null-ls"
      end,
    },

    config = function()
      require "plugins.configs.lspconfig"
      require "custom.plugins_config.lspconfig"
    end,
  },
  {
    "nvim-telescope/telescope.nvim",
    config = function(_, opts)
      -- 覆盖默认设置 start
      dofile(vim.g.base46_cache .. "telescope")
      local telescope = require "telescope"
      telescope.setup(opts)
      for _, ext in ipairs(opts.extensions_list) do
        telescope.load_extension(ext)
      end
      -- 覆盖默认设置 end

      telescope.load_extension "workspaces"
    end,
  },
  {
    "nvim-treesitter/nvim-treesitter",
    opts = {
      matchup = {
        enable = true,
      },
      ensure_installed = { "markdown", "html", "css", "javascript", "typescript", "tsx", "bash" },
    },
  },
  --- override default plugins setting - end

  { "ThePrimeagen/vim-be-good", cmd = { "VimBeGood" } },
  { "christoomey/vim-tmux-navigator", lazy = false },
  { "mbbill/undotree", cmd = { "UndotreeToggle" } },
  -- 在顶部显示当前的scope
  {
    "nvim-treesitter/nvim-treesitter-context",
    cmd = { "TSContextEnable" },
    event = "VeryLazy",
  },
  {
    "kylechui/nvim-surround",
    version = "*", -- Use for stability; omit to use `main` branch for the latest features
    event = "VeryLazy",
    config = function()
      require("nvim-surround").setup()
    end,
  },
  { "kazhala/close-buffers.nvim" },
  {
    "f-person/git-blame.nvim",
    event = "VeryLazy",
  },
  -- 展开收紧函数对象等
  {
    "Wansmer/treesj",
    cmd = { "TSJToggle" },
    dependencies = { "nvim-treesitter/nvim-treesitter" },
    config = function()
      require("treesj").setup {}
    end,
  },
  {
    "natecraddock/workspaces.nvim",
    cmd = { "WorkspacesAdd", "WorkspacesRemove" },
    dependencies = { "natecraddock/sessions.nvim" },
    event = "VeryLazy",
    config = function()
      require "custom.plugins_config.workspaces"
    end,
  },
  {
    "folke/noice.nvim",
    event = "VeryLazy",
    config = function()
      require "custom.plugins_config.notice"
    end,
    dependencies = {
      "MunifTanjim/nui.nvim",
      "rcarriga/nvim-notify",
    },
  },
  { "kevinhwang91/nvim-bqf", event = "VeryLazy" },
  {
    "andymass/vim-matchup",
    event = "VeryLazy",
  },
  {
    "ThePrimeagen/harpoon",
    event = "VeryLazy",
  },
  {
    "nvim-pack/nvim-spectre",
    event = "VeryLazy",
  },
}
return plugins
