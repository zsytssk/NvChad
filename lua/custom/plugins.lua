local plugins = {
  { "ThePrimeagen/vim-be-good", cmd = { "VimBeGood" }, },
  { "dstein64/vim-startuptime", cmd = { "StartupTime" }, },
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
    end
  }
}
return plugins
