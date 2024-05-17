return {
  -- Async
  {
    "nvim-neotest/nvim-nio",
    lazy = false,
  },
  -- Tmux
  {
    "christoomey/vim-tmux-navigator",
    event = "VeryLazy",
    lazy = false,
  },
  -- Git
  {
    "tpope/vim-fugitive",
    event = "VeryLazy",
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
  -- Theme
  {
    "catppuccin/nvim",
    name = "catppuccin",
    priority = 1000,
    config = function()
      vim.cmd.colorscheme "catppuccin-mocha"
    end,
  }
}
