return {
  "nvim-treesitter/nvim-treesitter",
  lazy = false,
  event = { "BufReadPost", "BufNewFile" },
  cmd = { "TSInstall", "TSBufEnable", "TSBufDisable", "TSModuleInfo" },
  build = ":TSUpdate",
  opts = {
    ensure_installed = {
      -- Docs
      "vimdoc",

      -- Languages
      "cpp",
      "lua",
      "vim",
      "c",
      "c_sharp",

      "python",

      -- Git
      "git_config",
      "git_rebase",
      "gitcommit",

      -- Build systems
      "cmake",
      "dockerfile",
    },
    highlight = {
      enable = true,
      use_languagetree = true,
    },

    indent = { enable = true },
  },
  config = function(_, opts)
    require("nvim-treesitter.configs").setup(opts)
  end
}
