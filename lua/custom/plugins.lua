-- test
local plugins = {
  --- override default plugins setting - start
  {
    "neovim/nvim-lspconfig",
    dependencies = {
      "jose-elias-alvarez/null-ls.nvim",
      config = function()
        require "custom.null-ls"
      end,
    },

    config = function()
      require "plugins.configs.lspconfig"
      require "custom.lspconfig"
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
      ensure_installed = { "html", "css", "javascript", "typescript", "tsx", "bash" },
    },
  },
  --- override default plugins setting - end

  { "dstein64/vim-startuptime", cmd = { "StartupTime" } },
  { "ThePrimeagen/vim-be-good", cmd = { "VimBeGood" } },
  { "mbbill/undotree", cmd = { "UndotreeToggle" } },
  -- 在顶部显示当前的scope
  {
    "nvim-treesitter/nvim-treesitter-context",
    cmd = { "TSContextEnable" },
    lazy = false,
  },
  {
    "kylechui/nvim-surround",
    version = "*", -- Use for stability; omit to use `main` branch for the latest features
    event = "VeryLazy",
  },
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
    "folke/trouble.nvim",
    cmd = { "TroubleToggle" },
    dependencies = { "nvim-tree/nvim-web-devicons" },
  },
  {
    "natecraddock/workspaces.nvim",
    cmd = { "WorkspacesAdd", "WorkspacesRemove" },
    config = function()
      require("workspaces").setup {}
    end,
  },
  {
    "BooleanCube/keylab.nvim",
    cmd = { "KeylabStart" },
  },
  {
    "LukasPietzschmann/telescope-tabs",
    requires = { "nvim-telescope/telescope.nvim" },
    event = "VeryLazy",
    config = function()
      require("telescope-tabs").setup {}
    end,
  },
}
return plugins
