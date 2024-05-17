return {
  -- Tmux
  {
    "christoomey/vim-tmux-navigator",
    event = "VeryLazy",
    lazy = false,
  },
  -- Keymaps
  {
    "folke/which-key.nvim",
    event = "VeryLazy",
    init = function()
      vim.o.timeout = true
      vim.o.timeoutlen = 500
    end,
    opts = {}
  },
  -- UI
  {
    "stevearc/dressing.nvim",
    event = "VeryLazy"
  },
  -- Startup
  {
    "dstein64/vim-startuptime"
  },
  -- Theme
  {
    "catppuccin/nvim",
    name = "catppuccin",
    piority = 1000,
    config = function()
      vim.cmd.colorscheme "catppuccin-mocha"
    end,
  }
}
