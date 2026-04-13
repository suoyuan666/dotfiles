return {
  {
    "ibhagwan/fzf-lua",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    config = function()
      require("fzf-lua").setup({
        winopts = {
          height  = 0.85,
          width   = 0.80,
          preview = {
            layout = 'vertical',
          },
        },
      })
    end
  },
  {
    'nvim-telescope/telescope.nvim',
    branch = '0.1.x',
    dependencies = {
      'nvim-lua/plenary.nvim',
      { "nvim-telescope/telescope-fzf-native.nvim", build = "make" },
    },
    config = function()
      require('plugins.config.telescope')
    end,
  },
  { 'akinsho/toggleterm.nvim', version = "*", config = true },
  {
    "stevearc/dressing.nvim",
    event = "VeryLazy",
  },
  {
    'windwp/nvim-autopairs',
    event = "InsertEnter",
    config = true
    -- use opts = {} for passing setup options
    -- this is equalent to setup({}) function
  },
}
