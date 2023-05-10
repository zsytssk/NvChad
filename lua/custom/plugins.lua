local plugins = {
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
  --
  { "dstein64/vim-startuptime", cmd = { "StartupTime" } },
  { "ThePrimeagen/vim-be-good", cmd = { "VimBeGood" } },
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
    'Wansmer/treesj',
    cmd = { "TSJToggle" },
    dependencies = { 'nvim-treesitter/nvim-treesitter' },
    config = function()
      require('treesj').setup({})
    end,
  },
  {
    "folke/trouble.nvim",
    cmd = { "TroubleToggle" },
    dependencies = { "nvim-tree/nvim-web-devicons" },
  }
}
return plugins
